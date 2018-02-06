library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;
use IEEE.numeric_std.all;

library lattice;
library MachXO3L;
use MachXO3L.all;


entity fifo_ctrl is
	-- design ports to be mapped to pins
	port( 	
		-- interface pins
		PARALLEL_RXFILLEDN: out std_logic; -- startup: HI
		PARALLEL_TXENABLEDN: out std_logic; -- startup: LO
		PARALLEL_DATA_IO: inout std_logic_vector(7 downto 0);
		
		-- data latch in / latch out control signals
		PARALLEL_WR: in std_logic; -- RXDATA write to FIFO to occur on trailing \_ edge
		PARALLEL_RDN: in std_logic; -- TXData read from FIFO 
		
		-- internal interface
		RXFN_INHIBIT: in std_logic;
		CLOCK: in std_logic; 
		MEM_ADDR: in std_logic_vector(7 downto 0);
		RST_N: in std_logic;
		RXFIFO_DATA: in  std_logic_vector(7 downto 0); -- PARALLEL <-- SPI
		RXFIFO_WR: in std_logic; -- write RXFIFO_DATA at _/
		TXFIFO_DATA: out std_logic_vector(7 downto 0); -- PARALLEL --> SPI
		TXFIFO_RD_FIRST: in std_logic;
		TXFIFO_RD_NEXT : in std_logic;
		STATUS: out std_logic_vector(7 downto 0);
		DEBUG_OUT: out std_logic_vector(1 downto 0)
	);
end entity fifo_ctrl; 



architecture FIFOBackendArch of fifo_ctrl is

	component fifo_prefetch_if 
		port(		  
			MEM_CLK: in std_logic;
			MEM_ADDR: in std_logic_vector(7 downto 0);
			RST_N: in std_logic;
			MEM_RD_FIRST: in std_logic;
			MEM_RD_NEXT : in std_logic;	
			FIFO_STATE_EMPTY : in std_logic;
			BUFFERED_EMPTY: out std_logic;
			FIFO_DATA   : in  std_logic_vector(7 downto 0);
			OUTPUT_DATA : out std_logic_vector(7 downto 0);
			FIFO_READ_PULSE : out std_logic;
			dbg_outputselect : out std_logic
		);
	end component;

	-- delay burst monoflops for output PARALLEL side
	component mono
		port( 	
			CLOCK : in std_logic;
			INP : in std_logic;
			Q : out std_logic
		);	
	end component;
   
	-- FIFO_DC parameterized module component declaration TN1201
	-- http://www.latticesemi.com/~/media/Documents/ApplicationNotes/MO/MemoryUsageGuideforMachXO2Devices.pdf?document_id=39082
	-- http://www.latticesemi.com/~/media/LatticeSemi/Documents/ApplicationNotes/MO/MemoryUsageGuideforMachXO2Devices.pdf?document_id=39082
	component fifo_dc
		port (Data: in  std_logic_vector(7 downto 0); WrClock: in  std_logic; 
			RdClock: in  std_logic; WrEn: in  std_logic; RdEn: in  std_logic; 
			Reset: in  std_logic; RPReset: in  std_logic; 
			Q: out  std_logic_vector(7 downto 0); Empty: out  std_logic; 
			Full: out  std_logic; AlmostEmpty: out  std_logic; 
			AlmostFull: out  std_logic);
	end component;

	-- RX FIFO signals
    signal RX_Data : std_logic_vector(7 downto 0) := (others => '0');
    signal RX_WrClock: std_logic := '0';
    signal RX_RdClock: std_logic := '0';
    signal RX_WrEn: std_logic := '0';
    signal RX_RdEn: std_logic := '0';
    signal RX_Reset: std_logic := '0';
    signal RX_RPReset: std_logic := '0';
    signal RX_Q : std_logic_vector(7 downto 0);
    signal RX_Empty: std_logic;
    signal RX_Full: std_logic;
    signal RX_AlmostEmpty: std_logic;
    signal RX_AlmostFull: std_logic;

	
	-- TX FIFO signals
    signal TX_Data : std_logic_vector(7 downto 0) := (others => '0');
    signal TX_WrClock: std_logic := '0';
    signal TX_RdClock: std_logic := '0';
    signal TX_WrEn: std_logic := '0';
    signal TX_RdEn: std_logic := '0';
    signal TX_Reset: std_logic := '0';
    signal TX_RPReset: std_logic := '0';
    signal TX_Q : std_logic_vector(7 downto 0);
    signal TX_Empty: std_logic := '1';
    signal TX_Full: std_logic;
    signal TX_AlmostEmpty: std_logic;
    signal TX_AlmostFull: std_logic;

	-- other signals
	signal TXBusyAfterWrite: std_logic := '0'; -- 80ns monoflop triggered after TX write operation (implement on demand)
	signal RXBusyAfterRead: std_logic  := '0'; -- 80ns monoflop triggered after RX read operation (implement on demand) 
	-- signal not_PARALLEL_WR: std_logic := '1';
	signal TX_BUFFERED_EMPTY: std_logic := '1';
	signal FIFO_READ_PULSE: std_logic := '0';
	
	-- helper signals to glue PARALLEL to FIFO enable signals
	signal TX_Latch: std_logic_vector(7 downto 0); 
	--signal TX_Capture_Busy: std_logic := '0'; 
	--signal RX_Read_Hold: std_logic := '0';
	signal tmp_RXFIFO_WREN: std_logic := '0';
	signal tmp_PARALLEL_RDN_P: std_logic := '1';
	signal tmp_PARALLEL_RDN_N: std_logic := '1';	
	signal tmp_PARALLEL_WR_P: std_logic := '0';
	signal tmp_PARALLEL_WR_N: std_logic := '0';
	-- signal WR_DETECT: std_logic := '0';
	signal TX_New_Data: std_logic := '0';
begin

	-- create delay burst monoflops ~120ns @ 33 MHz clock
	-- these will set high RXFILLEDN resp. TXENABLEDN directly after read / write operation
	-- not_PARALLEL_WR <= not PARALLEL_WR;
	-- signals change at rising edge
	WR_busy : entity work.mono(simplemonoflop_inv) -- triggers falling edge
		port map ( CLOCK => CLOCK, RST_N => RST_N, INP => PARALLEL_WR, Q=> TXBusyAfterWrite );
	RD_busy : entity mono  -- triggers rising edge
		port map ( CLOCK => CLOCK, RST_N => RST_N, INP => PARALLEL_RDN, Q=> RXBusyAfterRead );	

	-- parameterized module component instances 
	-- RX buf is SPI -> PARALLEL
	RXFF : fifo_dc
		   port map (Data => RX_Data, WrClock => RX_WrClock, RdClock => RX_RdClock, 
				WrEn => RX_WrEn, RdEn => RX_RdEn, Reset => RX_Reset, RPReset => RX_RPReset, 
				Q => RX_Q, Empty => RX_Empty, Full => RX_Full, AlmostEmpty => RX_AlmostEmpty, 
				AlmostFull => RX_AlmostFull
			);
	-- TX buf is PARALLEL -> SPI	
	TXFF : fifo_dc
		   port map (Data => TX_Data, WrClock => TX_WrClock, RdClock => TX_RdClock, 
				WrEn => TX_WrEn, RdEn => TX_RdEn, Reset => TX_Reset, RPReset => TX_RPReset, 
				Q => TX_Q, Empty => TX_Empty, Full => TX_Full, AlmostEmpty => TX_AlmostEmpty, 
				AlmostFull => TX_AlmostFull
			);
			
	-- TXFF prefetch interface
	TXIF : entity work.fifo_prefetch_if(fifo_prefetch_mem_if)
		port map (
			MEM_CLK => CLOCK,
			RST_N => RST_N,
			MEM_ADDR => MEM_ADDR,
			MEM_RD_FIRST => TXFIFO_RD_FIRST, 
			MEM_RD_NEXT => TXFIFO_RD_NEXT,
			FIFO_STATE_EMPTY => TX_Empty,
			BUFFERED_EMPTY => TX_BUFFERED_EMPTY,
			FIFO_DATA => TX_Q,
			OUTPUT_DATA => TXFIFO_DATA,
			FIFO_READ_PULSE => FIFO_READ_PULSE
		);
	
	
	-- PARALLEL side control logic (see timing diagrams)
	
	-- SPI -> RXFF -> PARALLEL
	RX_WrClock <= CLOCK;
	RX_RdClock <= not CLOCK;
	RX_WrEn <= tmp_RXFIFO_WREN; -- high around one RX_WrClock rising edge, delayed w.r.t. data change

	RX_Reset <= not RST_N;
	RX_Data <= RXFIFO_DATA;
	
	process(PARALLEL_RDN, PARALLEL_WR, RX_Q, PARALLEL_DATA_IO)
	begin
		if (PARALLEL_RDN = '0') and (PARALLEL_WR = '0') then
			PARALLEL_DATA_IO <= RX_Q;  
		else 
			PARALLEL_DATA_IO <= (others => 'Z');			
		end if;
	end process;
	
	STATUS(7 downto 4) <= transport (RX_Full, RX_AlmostFull, RX_AlmostEmpty, RX_Empty);
		
	process(CLOCK, tmp_PARALLEL_RDN_N, tmp_PARALLEL_RDN_P)
	begin 
		if rising_edge(CLOCK) then
			tmp_PARALLEL_RDN_P <= PARALLEL_RDN;
			tmp_PARALLEL_RDN_N <= tmp_PARALLEL_RDN_P;
			
			RX_RdEn <= '0'; -- it should be ok to clear RdEn slightly after _/ where it would have an effect. 
			-- maybe use inertial model '0' after 2ns; to have well-defined timing?
		end if;
	
		if falling_edge(CLOCK) then
			if ((tmp_PARALLEL_RDN_P = '1') and (PARALLEL_RDN = '0')) or -- early detection
			   ((tmp_PARALLEL_RDN_N = '1') and (tmp_PARALLEL_RDN_P = '0') and (RX_RdEn = '0')) then -- late detection
				RX_RdEn <= '1';
			else 
				RX_RdEn <= '0';
			end if;
			
			tmp_RXFIFO_WREN <= RXFIFO_WR; -- capture at falling edge
		end if;
				
	end process;
	
	
	-- PARALLEL -> TXFF -> TXIF -> SPI
	TX_WrClock <= CLOCK;
	TX_RdClock <= not CLOCK;	-- ought to be  not CLOCK so TX_RdEn can change at CLOCK rising edges
	TX_RdEn <= FIFO_READ_PULSE; -- transport? - sampled at rising edge of TX_RdClock (stable during CLOCK rising edge)

	TX_Reset <= not RST_N;
	-- TX_Data <= TX_Latch; -- PARALLEL_DATA_IO(7 downto 0); -- DATA_IO is presented to TXFF for sampling
	-- TXIF.TXFIFO_DATA <= TX_Q; 
	STATUS(3 downto 0) <= transport (TX_Full, TX_AlmostFull, TX_AlmostEmpty, TX_Empty);



	process(CLOCK)
	begin
		if rising_edge(CLOCK) then
			TX_Latch <= PARALLEL_DATA_IO;
			tmp_PARALLEL_WR_P <= transport PARALLEL_WR after 2ns;
			if(tmp_PARALLEL_WR_P = '1') then
				TX_Data <= TX_Latch;
			end if;
		end if;
		
		if falling_edge(CLOCK) then

			if  (tmp_PARALLEL_WR_N = '1') and (TX_WrEn = '0') and 
				((tmp_PARALLEL_WR_P = '0') or (PARALLEL_WR = '0')) then
				TX_WrEn <= '1';
			else 
				TX_WrEn <= '0';
			end if;
			tmp_PARALLEL_WR_N <= PARALLEL_WR;
		end if;
	end process;


	-- parallel signal outputs
	process(CLOCK)
	begin
		-- was:
		-- PARALLEL_RXFILLEDN <= RX_Empty or RXBusyAfterRead; -- RXBusyAfterRead;
		-- delay update until PARALLEL_RDN is high again
		if falling_edge(CLOCK) and (PARALLEL_RDN = '1') then
			PARALLEL_RXFILLEDN <= RX_Empty or RXBusyAfterRead or RXFN_INHIBIT;
		end if;
	end process;
	
	
	PARALLEL_TXENABLEDN <= TX_Full or TXBusyAfterWrite; -- or TXBusyAfterWrite
	
	DEBUG_OUT <= (FIFO_READ_PULSE, TXFIFO_RD_FIRST);
	
end architecture FIFOBackendArch;