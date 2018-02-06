library IEEE;
use IEEE.std_logic_1164.all;   
--use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
--use IEEE.math_real.all;
use IEEE.numeric_std.all;

entity fifo_prefetch_if is
	port(		  
		MEM_CLK: in std_logic;
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

architecture fifo_prefetch_if_arch of fifo_prefetch_if is 
	signal buffered_data : std_logic_vector(7 downto 0) := (others => '0');
	signal buffered_datavalid: std_logic := '0';
	signal output_select: std_logic := '0';
	signal fifo_read : std_logic := '0';
begin	
	
	FIFO_READ_PULSE <= fifo_read;
	dbg_outputselect <= output_select;
	BUFFERED_EMPTY <= not buffered_datavalid;
	
	process(MEM_RD_FIRST, MEM_RD_NEXT, RST_N)
	begin						   
		if (RST_N = '1') then -- RST_N inactive, normal operation
			
			-- rising edge of MEM_RD_FIRST sets buffered_data_valid <= '1' when not FIFO_STATE_EMPTY 
			-- falling edge of MEM_RD_NEXT clears buffered_data_valid
			if rising_edge(MEM_RD_FIRST) then
				output_select <= buffered_datavalid; 
				buffered_datavalid <= not FIFO_STATE_EMPTY;
				fifo_read <= '0';
			else
				-- toggle fifo_read like MEM_RD_NEXT if buffered_data_valid is '0' at MEM_RD_NEXT rising edge
				if rising_edge(MEM_RD_NEXT) then  
					if (output_select = '0') then
						buffered_data <= FIFO_DATA; -- latch FIFO_DATA
						fifo_read <= '1'; -- alternatively: not FIFO_STATE_EMPTY (toggles fifo_read only when not empty)
					end if;									  
					
					output_select  <= '0'; 
					buffered_datavalid <= not FIFO_STATE_EMPTY;
				end if;
				
				-- clear fifo_read at falling edge of MEM_RD_NEXT
				if falling_edge(MEM_RD_NEXT) then
					fifo_read <= '0'; 
				end if;
			end if;	
		else  
			-- reset condition
			fifo_read <= '0';
			buffered_datavalid <= '0';
			output_select <= '0';
			buffered_data <= (others => '0');  
		end if;	
		
		-- asynchronous data source multiplexer
		if output_select = '1' then	
			OUTPUT_DATA <= buffered_data;
		else 							 
			OUTPUT_DATA <= FIFO_DATA;
		end if;
	end process; 
	
end architecture fifo_prefetch_if_arch;		



architecture fifo_prefetch_if_arch2 of fifo_prefetch_if is 
	constant BUF_SIZE : integer := 2;
	constant OUTPUTSEL_DIRECT : std_logic := '0';
	constant OUTPUTSEL_TEMP   : std_logic := '1';
	
	type TByteArray IS ARRAY(0 to BUF_SIZE-1) OF std_logic_vector(7 downto 0);
	signal BUF : TByteArray;	 
	signal BUF_LEN: unsigned(1 downto 0) := (others => '0'); -- BUF_LEN is number of unread bytes in BUF
	signal BUF_POS: unsigned(1 downto 0) := (others => '0'); -- BUF_POS is the last position from which data has been read
	
	signal MEM_RD : std_logic := '0';
	signal output_select: std_logic := '0';
	signal FIFO_DATA_TEMP: std_logic_vector(7 downto 0) := (others => '0');
	signal FIFO_READ_PULSE_S: std_logic := '0';
begin	   																	
	
	MEM_RD <= MEM_RD_FIRST or MEM_RD_NEXT;
	FIFO_READ_PULSE <= FIFO_READ_PULSE_S;
	dbg_outputselect <= output_select;	
	
	process(MEM_RD)
	begin	   
		if RST_N = '0' then	
			FIFO_READ_PULSE_S <= '0';
			output_select   <= '0';
			BUF_LEN <= (others => '0'); -- to_unsigned(0, BUF_LEN'length)
			BUF_POS <= (others => '0'); 
		else 
			if rising_edge(MEM_RD) then
				-- make decision based upon states of:
				--     MEM_RD_FIRST, MEM_RD_NEXT, MEM_RD
				--     FIFO_STATE_EMPTY
				--     BUF_POS
				--     BUF_LEN
				-- then control	the following signals:
				-- 	   BUF_POS
				--     BUF_LEN
				--     FIFO_READ_PULSE_S
				-- 	   (FIFO_DATA_TEMP)	
				-- 	   output_select

				if (MEM_RD_FIRST = '1') then
					-- MEM_RD_FIRST !
					if (BUF_LEN > 0) then  
						-- FIFO_READ_PULSE_S not activated here
						FIFO_DATA_TEMP <= BUF(to_integer(BUF_LEN - 1));
						output_select <= OUTPUTSEL_TEMP;
						BUF_POS <= BUF_LEN - 1;
						-- BUF_LEN is not changed here
					else	   
						if (FIFO_STATE_EMPTY = '0') then	
							FIFO_READ_PULSE_S <= '1'; 
						else
							-- assert false report "begin of read operation with empty FIFO" severity warning; 
							BUF_LEN <= BUF_LEN - 1;
						end if;
						-- FIFO_DATA_TEMP ignored due to OUTPUTSEL_DIRECT
						output_select <= OUTPUTSEL_DIRECT;				 
						BUF_POS <= (others => '0');
						-- BUF_LEN is 0 here
					end if;	
				else 
				-- MEM_RD_NEXT !
					if (BUF_POS > 0) then 
						-- FIFO_READ_PULSE_S not activated here
						FIFO_DATA_TEMP <= BUF(to_integer(BUF_POS - 1));
						output_select <= OUTPUTSEL_TEMP;
						BUF_POS <= BUF_POS - 1;
						BUF_LEN <= BUF_LEN - 1;						
					else
						if (FIFO_STATE_EMPTY = '0') then	
							FIFO_READ_PULSE_S <= '1'; 
						end if;
						-- FIFO_DATA_TEMP ignored due to OUTPUTSEL_DIRECT
						output_select <= OUTPUTSEL_DIRECT;				 
						BUF_POS <= (others => '0');
						-- BUF_LEN is 0 here	
					end if;
				end if;
				
			end if;
			
			if falling_edge(MEM_RD) then 									   
				-- if a read operation has been performed (FIFO_READ_PULSE_S is '1') 
				if (FIFO_READ_PULSE_S = '1') then	
					FIFO_READ_PULSE_S <= '0';
					-- shift buf, add new byte
					for i in (BUF_SIZE-2) downto 0 loop
						BUF(i+1) <= BUF(i);
					end loop;
					BUF(0) <= FIFO_DATA;		  
					-- update cursors
					if (BUF_LEN < BUF_SIZE) then
						BUF_LEN <= BUF_LEN + 1;
					end if;
				else
				-- a MEM_RD pulse occured without a read operation
					-- no shift operation
					-- update cursors : drop oldest byte
					if (BUF_LEN > 0) then
						BUF_LEN <= BUF_LEN - 1;
					end if;					
				end if;
			end if;	 
			
		end if;
	end process;
	
	
--	process(MEM_RD_FIRST, MEM_RD_NEXT, MEM_CLK, output_select)
--	begin 
--		-- asynchronous data source multiplexer
--		if output_select = OUTPUTSEL_TEMP then	
--			OUTPUT_DATA <= FIFO_DATA_TEMP;
--		else 							 
--			OUTPUT_DATA <= FIFO_DATA;
--		end if;
--		
--		BUFFERED_EMPTY <= '1' when (BUF_LEN = 0) else '0';
--	end process;

	OUTPUT_DATA <= FIFO_DATA when (output_select = OUTPUTSEL_DIRECT) else FIFO_DATA_TEMP;
	BUFFERED_EMPTY <= '1' when (BUF_LEN = 0) else '0';
		
end architecture fifo_prefetch_if_arch2;	


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
	dbg_outputselect <= FIFO_READ_PULSE_S;
	FIFO_READ_PULSE <= transport FIFO_READ_PULSE_S;
	
	process(MEM_RD, MEM_RD_FIRST, MEM_RD_NEXT)
	begin	   
			if rising_edge(MEM_RD) then

				if (MEM_RD_FIRST = '1') then
					-- MEM_RD_FIRST !
					if (BUF_LEN > 0) then  
						-- FIFO_READ_PULSE_S not activated here
						FIFO_DATA_TEMP <= BUF(to_integer(BUF_LEN - 1));
						output_select <= OUTPUTSEL_TEMP;
						BUF_POS <= BUF_LEN - 1;
						-- BUF_LEN is not changed here
					else	   
						if (FIFO_STATE_EMPTY = '0') then	
							FIFO_READ_PULSE_S <= '1'; 
						else
							-- assert false report "begin of read operation with empty FIFO" severity warning; 
							BUF_LEN <= BUF_LEN - 1;
						end if;
						-- FIFO_DATA_TEMP ignored due to OUTPUTSEL_DIRECT
						output_select <= OUTPUTSEL_DIRECT;				 
						BUF_POS <= (others => '0');
						-- BUF_LEN is 0 here
					end if;	
				else 

				-- MEM_RD_NEXT !
					if (BUF_POS > 0) then 
						-- FIFO_READ_PULSE_S not activated here
						FIFO_DATA_TEMP <= BUF(to_integer(BUF_POS - 1));
						output_select <= OUTPUTSEL_TEMP;
						BUF_POS <= BUF_POS - 1;
						BUF_LEN <= BUF_LEN - 1;						
					else
						if (FIFO_STATE_EMPTY = '0') then	
							FIFO_READ_PULSE_S <= '1'; 
						end if;
						-- FIFO_DATA_TEMP ignored due to OUTPUTSEL_DIRECT
						output_select <= OUTPUTSEL_DIRECT;				 
						BUF_POS <= (others => '0');
						-- BUF_LEN is 0 here	
					end if;

				end if;
				
			-- end if;	
			-- if falling_edge(MEM_RD) then 
			
			elsif falling_edge(MEM_RD) then 	
			
				-- if a read operation has been performed (FIFO_READ_PULSE_S is '1') 
				if (FIFO_READ_PULSE_S = '1') then	
					FIFO_READ_PULSE_S <= '0';
					-- shift buf, add new byte
					for i in (BUF_SIZE-2) downto 0 loop
						BUF(i+1) <= BUF(i);
					end loop;
					BUF(0) <= FIFO_DATA;		  
					-- update cursors
					if (BUF_LEN < BUF_SIZE) then
						BUF_LEN <= BUF_LEN + 1;
					end if;
				else
				-- a MEM_RD pulse occured without a read operation
					-- no shift operation
					-- update cursors : drop oldest byte
					if (BUF_LEN > 0) then
						BUF_LEN <= BUF_LEN - 1;
					end if;					
				end if;
			end if;	 
		
	end process;
	
	process(MEM_CLK)
	begin
		if falling_edge(MEM_CLK) then
			if BUF_LEN = 0 then
				BUFFERED_EMPTY <= '1';
			else
				BUFFERED_EMPTY <= '0';
			end if;
		end if;
	end process;
	
	-- concurrent signal assignment looks like a process synchronous to right hand side changes
	-- see http://www.ics.uci.edu/~jmoorkan/vhdlref/conc_s_a.html
	OUTPUT_DATA <= transport FIFO_DATA when (output_select = OUTPUTSEL_DIRECT) else FIFO_DATA_TEMP; 


end architecture fifo_prefetch_if_arch_dummy; 


	
