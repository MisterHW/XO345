library IEEE;
use IEEE.std_logic_1164.all;   
--use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
--use IEEE.math_real.all;
use IEEE.numeric_std.all;


-- the FIFO pretetch interface started out as a means to match the 2 byte read-ahead of the
-- SPI Slave RD1125 implementation to the "you only read once" behaviour of the FIFO.
-- Simulation and initial results were promising but definitive operation was never achieved in hardware.
--
-- Now a memory read command at address 0xFF triggers 
-- a copy operation that fills 0 to 63 byte into a RAM_DP instance and signals its state with
-- the byte 0 : 0xFF : busy, 0x00 .. 0x3F : nBytes ready to be read.
-- This immediately provides a byte counter in contrast to the FIFO_DC without counters. Read
-- operations can be aborted and restarted, additionally they can resumed. 
-- Variable-length read operations can be easily implemented by the slave reacting to the first byte
-- read carrying the length information.
-- The FIFO status is no longer needed for the TX side, just issue a copy operation and read data until
-- the next copy command results in a zero length filled memory.

entity fifo_prefetch_if is
	port(		  
		MEM_CLK: in std_logic;
		MEM_ADDR: in std_logic_vector(7 downto 0);
		RST_N: in std_logic;
		MEM_RD_FIRST: in std_logic;
		MEM_RD_NEXT : in std_logic;	
		FIFO_STATE_EMPTY : in std_logic; 
		BUFFERED_EMPTY : out std_logic; -- FIFO empty but one byte still kept in buffer
		FIFO_DATA   : in  std_logic_vector(7 downto 0);
		OUTPUT_DATA : out std_logic_vector(7 downto 0);
		FIFO_READ_PULSE : out std_logic;
		dbg_outputselect : out std_logic
	);							
end entity fifo_prefetch_if;			  





architecture fifo_prefetch_if_arch_dummy of fifo_prefetch_if is 
	constant BUF_SIZE : integer := 2;
	constant OUTPUTSEL_DIRECT : std_logic := '0';
	constant OUTPUTSEL_TEMP   : std_logic := '1';
	
	type TByteArray IS ARRAY(0 to BUF_SIZE-1) OF std_logic_vector(7 downto 0);
	signal BUF : TByteArray;	 
	signal BUF_LEN: unsigned(1 downto 0) := (others => '0'); -- BUF_LEN is number of unread bytes in BUF
	signal BUF_POS: unsigned(1 downto 0) := (others => '0'); -- BUF_POS is the last position from which data has been read
	
	signal MEM_RD : std_logic := '0';
	signal output_select: std_logic := OUTPUTSEL_DIRECT;
	signal FIFO_DATA_TEMP: std_logic_vector(7 downto 0) := (others => '0');
	signal FIFO_READ_PULSE_S: std_logic := '0';
begin	   																	
	
	MEM_RD <= MEM_RD_FIRST or MEM_RD_NEXT;
	dbg_outputselect <= output_select;
	FIFO_READ_PULSE <= transport FIFO_READ_PULSE_S;
	
	process(MEM_CLK)
	begin
		-- MEM_RD_FIRST or MEM_RD_NEXT rising edge at MEM_CLK rising edge, high for one cycle
		-- data is sampled immediately at falling edge, leaving 1 cycle for process and data handling
	
		if falling_edge(MEM_CLK) then
			if(MEM_RD = '1') then
				-- at this time, half a clock cycle has elapsed and data needs to be read from the FIFO
				-- or from buffer.  
				FIFO_READ_PULSE_S <= '1';
				output_select <= OUTPUTSEL_DIRECT; -- debug: just read FIFO
			else
				FIFO_READ_PULSE_S <= '0';
			end if;
		end if;
	end process;
	
	-- concurrent signal assignment looks like a process synchronous to right hand side changes
	-- see http://www.ics.uci.edu/~jmoorkan/vhdlref/conc_s_a.html
	OUTPUT_DATA <= transport FIFO_DATA when (output_select = OUTPUTSEL_DIRECT) else FIFO_DATA_TEMP; 


end architecture fifo_prefetch_if_arch_dummy; 



architecture fifo_prefetch_mem_if of fifo_prefetch_if is

	constant RAMEND : integer := 63; -- ram_dp size -1
	
	component ram_dp
		port (WrAddress: in  std_logic_vector(5 downto 0); 
			RdAddress: in  std_logic_vector(5 downto 0); 
			Data: in  std_logic_vector(7 downto 0); WE: in  std_logic; 
			RdClock: in  std_logic; RdClockEn: in  std_logic; 
			Reset: in  std_logic; WrClock: in  std_logic; 
			WrClockEn: in  std_logic; Q: out  std_logic_vector(7 downto 0));
	end component;

	signal RST: std_logic := '0';
	
	signal CMD : std_logic_vector (1 downto 0) := (others => '0');
	signal CMD_PENDING : std_logic := '0';
	
	signal tmp_WR_ENA  : std_logic := '0';
	signal tmp_WR_ADDR : std_logic_vector (5 downto 0) := (others => '0');
	signal tmp_WR_DATA : std_logic_vector (7 downto 0) := (others => '0');
	
	signal WR_ENA  : std_logic := '0';
	signal WR_ADDR : std_logic_vector (5 downto 0) := (others => '0');
	signal WR_DATA : std_logic_vector (7 downto 0) := (others => '0');
	-- signal WR_LEN  : std_logic_vector (7 downto 0) := (others => '0');
	
	type TTransferState is (TS_Idle, TS_Initialize, TS_WaitForCompletion, TS_WriteLength);
	signal STATE : TTransferState;
begin

	RST <= not RST_N;
	
	MEM : ram_dp port map (
		Reset=> RST, 
		-- read side
		RdAddress(5 downto 0)=> MEM_ADDR(5 downto 0), 
		RdClock=> MEM_CLK, 
		RdClockEn=> '1', 
		Q(7 downto 0)=> OUTPUT_DATA,
		-- write side
		WrAddress(5 downto 0)=> WR_ADDR, 
		WrClock=> MEM_CLK, 
        WrClockEn=> '1', 
		Data(7 downto 0)=> WR_DATA, 
        WE=> WR_ENA
	);

	-- the facts:
	-- 
	-- MEM.WrClock is driven by MEM_CLK
	-- WR_ADDR is updated at MEM_CLK falling edge so WR_ADDR is stable around rising edge
	--     data is then written at the subsequent MEM_CLK rising edge 
	--     (where next address can be written to tmp_WR_ADDR)
	-- FIFO_READ_PULSE changes at MEM_CLK rising edge, therefore TX_RdClock inverted
	--     and FIFO_READ_PULSE is being evaluated at MEM_CLK falling edge
	--     thus on the following MEM_CLK rising edge, both FIFO.Q and FIFO.Empty are updated
	--     and FIFO_READ_PULSE can be deactivated again without data remaining to be read

	DataTransferFSM : process(MEM_CLK, RST_N) 
	begin
		if (RST_N = '0') then
			STATE <= TS_Idle;
			WR_ENA <= '0';
			FIFO_READ_PULSE <= '0';
			
		else
				
			if rising_edge(MEM_CLK) then 
				case STATE is
					when TS_Idle =>  
					-- if CMD = "11", write MEM[0] = 0xFF, WR_ADDR = 0x00, next TS_Initialize
						if (CMD_PENDING = '1') and (CMD = "11") then 
							tmp_WR_ADDR <= (others => '0'); -- WR_ADDR <= (0=>'1', others => '0'); -- or std_logic_vector(to_unsigned(1, WR_ADDR'length));
							tmp_WR_DATA <= X"FF"; -- "busy"
							tmp_WR_ENA <= '1';
							STATE <= TS_Initialize;
						else 
							tmp_WR_ENA <= '0';
						end if;
						FIFO_READ_PULSE <= '0';
						
					when TS_Initialize => 					
					-- if FIFO not empty, begin reading in TS_WaitForCompletion, otherwise stop at length 0 in TS_WriteLength
						CMD_PENDING <= '0';
						if (FIFO_STATE_EMPTY = '0') then -- debug only
							FIFO_READ_PULSE <= '1';
							STATE <= TS_WaitForCompletion;
						else
							STATE <= TS_WriteLength;
						end if;
						
					when TS_WaitForCompletion => 
					-- at least one byte was in the FIFO, store FIFO_DATA to MEM[++ADDR]
					-- if FIFO empty or ++ADDR = RAMEND terminate in TS_WriteLength
						tmp_WR_ADDR <= WR_ADDR + 1;
						tmp_WR_DATA <= FIFO_DATA;
						if (FIFO_STATE_EMPTY = '1') or (WR_ADDR = RAMEND-1) then
							FIFO_READ_PULSE <= '0';
							STATE <= TS_WriteLength;
						end if;
						
					when TS_WriteLength =>  
					-- if no bytes written WR_ADDR is still 0, otherwise WR_ADDR = nBytes so "WR_ADDR" the length
					-- write length to MEM[0], next TS_Idle
						tmp_WR_ADDR <= (others => '0'); 
						-- WR_LEN(7 downto 6) <= (others => '0');
						-- WR_LEN(5 downto 0) <= WR_ADDR; -- last data write pos is equal to number of bytes written when first byte is skipped
						-- tmp_WR_DATA <= WR_LEN; -- write data length to first byte
						tmp_WR_DATA(7 downto 6) <= (others => '0');
						tmp_WR_DATA(5 downto 0) <= WR_ADDR; -- this is the number of bytes written (formerly WR_LEN)
						STATE <= TS_Idle;
						
				end case;
				
			end if;
			
			if falling_edge(MEM_CLK) then
				WR_ENA  <= tmp_WR_ENA;
				WR_ADDR <= tmp_WR_ADDR;  
				WR_DATA <= tmp_WR_DATA;
				
				-- MEM_ADDR and MEM_RD_FIRST are updated simultaneously at clock rising edge
				-- CMD: "00" normal memory read; "11" init transfer TXFIFO->MEM; "01" and "10" are reserved
				if (MEM_RD_FIRST = '1') then
					CMD(1 downto 0) <=  MEM_ADDR(7 downto 6); -- was hard-coded for debugging <= "11";-- MEM_ADDR(7 downto 6); 
					CMD_PENDING <= '1';
				end if; 
			end if;
		
		end if;
		
	end process;


end architecture fifo_prefetch_mem_if; 


	

