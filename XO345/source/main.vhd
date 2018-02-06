library IEEE;
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;
use IEEE.numeric_std.all;

library lattice;
library MachXO3L;
use MachXO3L.all;


entity top is
	-- design ports to be mapped to pins 
	port( 	
		-- Parallel FIFO interface
		PARALLEL_RXFILLEDN: out std_logic;
		PARALLEL_TXENABLEDN: out std_logic;
		PARALLEL_PWREN: out std_logic; 
		PARALLEL_DATA_IO: inout std_logic_vector(7 downto 0);
		PARALLEL_RDN: in std_logic; -- current data to be presented when RDN low, select next byte when trailing _/ edge
		PARALLEL_WR: in std_logic; -- data write to occur on trailing \_ edge
		
		-- Slave SPI interface
		SPI_CSN: inout std_logic;
		SPI_CLK: inout std_logic; -- dummy IO (hard-wired output due to black_box_pad_pin option)
		SPI_SDI: inout std_logic; -- dummy IO (hard-wired output due to black_box_pad_pin option)
		SPI_SDOZ: out std_logic;  -- dummy IO (hard-wired output due to black_box_pad_pin option)
			
		-- workaround for discrepancy between FT2232->XO2 connections:
		-- hardened EFB-SPI forces certain IOs to be SCK, MISO, MOSI which do not coincide with
		-- XO2-7000HE breakout board routing to FT2232H. Create "jumper wires" in fabric.
		SPI_CLK_ROUTE_i: in std_logic;		
		SPI_CLK_ROUTE_o: out std_logic;
		SPI_SDI_ROUTE_i: in std_logic;		
		SPI_SDI_ROUTE_o: out std_logic;
		SPI_SDO_ROUTE_i: in std_logic;		
		SPI_SDO_ROUTE_o: out std_logic;
		
		CLK_OUT_SCALED: out std_logic;
		LED_ARRAY: out std_logic_vector(7 downto 0);
		DEBUG_OUT: out std_logic_vector(1 downto 0)
	);
end entity top;
 


architecture main of top is

	-- internal oscillator, see p.28
	-- http://www.latticesemi.com/~/media/LatticeSemi/Documents/ApplicationNotes/MO/MachXO2sysCLOCKPLLDesignandUsageGuide.pdf?document_id=39080
	component OSCH
	-- synthesis translate_off
	  generic(
			NOM_FREQ: string := "33.25");
	-- synthesis translate_on
	  port(  
			STDBY    : IN  STD_LOGIC;
			OSC      : OUT STD_LOGIC;
			SEDSTDBY : OUT STD_LOGIC);
	end component; 
	
	attribute NOM_FREQ : string;
	attribute NOM_FREQ of INT_OSC : label is "33.25";	
	
	component PUR
	-- synthesis translate_off
		generic( 
			RST_PULSE : string := "100"); 
	-- synthesis translate_on
		port(
			PUR: OUT STD_LOGIC -- correct: IN STD_LOGIC but doesn't work ?!
		);
	end component;
	
	component GSR
		port(
			GSR: IN STD_LOGIC 
		);
	end component;

	component fifo_ctrl
		-- design ports to be mapped to pins
		port( 	
			-- interface pins
			PARALLEL_RXFILLEDN: out std_logic;
			PARALLEL_TXENABLEDN: out std_logic;
			PARALLEL_DATA_IO: inout std_logic_vector(7 downto 0);
			-- interface data latch in / latch out control signals
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
	end component;  
	
	-- FIFO local data input, output and status signals
	signal RXData: std_logic_vector(7 downto 0); 
	signal TXData: std_logic_vector(7 downto 0);
	signal FIFOStatus: std_logic_vector(7 downto 0);

	-- spi_slave_top parameters 
	constant GPI_PORT_NUM : integer := 2;  
	constant GPI_DATA_WIDTH : integer := 8; 
	constant GPO_PORT_NUM : integer := 1;
	constant GPO_DATA_WIDTH : integer := 8; 
	constant MEM_ADDR_WIDTH : integer := 8; 
	constant IRQ_NUM : integer := 4;
	constant REVISION_ID : integer := 1;
	constant MAX_MEM_BURST_NUM : integer := 256;
	constant INTQ_OPENDRAIN : string := "ON";

	component spi_slave_top -- note Verilog case sensitivity (must match case)
	  generic(
			GPI_PORT_NUM : integer := GPI_PORT_NUM;   
			GPI_DATA_WIDTH : integer := GPI_DATA_WIDTH; 
			GPO_PORT_NUM : integer := GPO_PORT_NUM;
			GPO_DATA_WIDTH : integer := GPO_DATA_WIDTH; 
			MEM_ADDR_WIDTH : integer := MEM_ADDR_WIDTH; 
			IRQ_NUM : integer := IRQ_NUM;
			REVISION_ID : integer := REVISION_ID;
			MAX_MEM_BURST_NUM : integer := MAX_MEM_BURST_NUM;
			INTQ_OPENDRAIN : string := INTQ_OPENDRAIN	
			); 
		port (
		   CLK: in std_logic; -- System clock
		   RST_N: in std_logic; -- System asynchronouse reset (active low)
													   
		   CCLK: in std_logic; -- Hard SPI serial clock
		   SCSN: in std_logic; --  Hard SPI chip-select (active low)
		   SI: in std_logic; --  Hard SPI serial input data
		   SO: out std_logic; --  Hard SPI serial output data
		   
		   GPI_0: in std_logic_vector(GPI_DATA_WIDTH-1 downto 0);  -- General purpose input port 0  
		   GPI_1: in std_logic_vector(GPI_DATA_WIDTH-1 downto 0);  -- General purpose input port 1 
		   -- GPI_2: in std_logic_vector(GPI_DATA_WIDTH-1 downto 0);  -- General purpose input port 2 
		   -- GPI_3: in std_logic_vector(GPI_DATA_WIDTH-1 downto 0);  -- General purpose input port 3 
		   GPO_0: out std_logic_vector(GPO_DATA_WIDTH-1 downto 0); -- General purpose output port 0 
		   -- GPO_1: out std_logic_vector(GPO_DATA_WIDTH-1 downto 0); -- General purpose output port 1 
		   -- GPO_2: out std_logic_vector(GPO_DATA_WIDTH-1 downto 0); -- General purpose output port 2 
		   -- GPO_3: out std_logic_vector(GPO_DATA_WIDTH-1 downto 0); -- General purpose output port 3 
		   Enable: out std_logic; -- Genaral purpose enable
		   
		   MEM_CLK: out std_logic; -- Memory clock (copy of CLK)
		   MEM_WR: out std_logic;  -- Memory write enable
		   MEM_ADDR: out std_logic_vector(MEM_ADDR_WIDTH-1 downto 0); -- Memory address
		   MEM_WD: out std_logic_vector(7 downto 0); -- Memory write data
		   MEM_RD: in std_logic_vector(7 downto 0); -- Memory read data
		   MEM_RD_FIRST: out std_logic; -- toggles at address initialization during memory read sequence
		   MEM_RD_NEXT : out std_logic; -- toggles at subsequent address increments
		    
		   IRQ: in std_logic_vector(IRQ_NUM-1 downto 0); -- Interrupt requests (rising edge sensitive)       
		   INTQ: out std_logic -- External interrupt (active low) 			
		);
	end component; 
	
   signal GP_Enable: std_logic; 
   signal MEM_CLK: std_logic; -- Memory clock (copy of CLK)
   signal MEM_WR: std_logic;  -- Memory write enable  
   signal MEM_RD_FIRST : std_logic;
   signal MEM_RD_NEXT : std_logic;
   signal MEM_ADDR: std_logic_vector(MEM_ADDR_WIDTH-1 downto 0); -- Memory address

   signal IRQ: std_logic_vector(IRQ_NUM-1 downto 0); -- Interrupt requests (rising edge sensitive)       
   signal INTQ: std_logic; -- External interrupt (active low) 
	
	-- other signals 
	signal MAIN_CLK: std_logic := '0';
	signal RST_N : std_logic := '1';	
	signal POWERUP_RST: std_logic := '0'; 
	signal GPO_Reg : std_logic_vector(GPO_DATA_WIDTH-1 downto 0) := (others => '0');
	signal GPI_Reg : std_logic_vector(GPI_DATA_WIDTH-1 downto 0) := (others => '0');
	signal tmp_MEM_WR: std_logic := '0';
	signal CLKDIV: std_logic_vector(3 downto 0);
	signal RXFN_INHIBIT: std_logic := '1';
	-- signal DEBUG: std_logic_vector(1 downto 0) := (others => '0');
begin
	-- Inferred GSR  
	-- – In this case the software automatically determines which 
	-- reset signal has the highest fan-out (for either single or multiple reset 
	-- designs) and uses the GSR resource as the routing for that reset signal. 
	--
	--User-Specified Inferred GSR
	-- – This is the same as the Inferred GSR usage except that the reset signal that
	-- is specified in the preference (.lpf) file determines which signal uses the 
	-- GSR resource regardless of the fan- out of the signal. 
	
	-- see also
	-- http://www.latticesemi.com/~/media/LatticeSemi/Documents/UserManuals/EI/FPGALibrariesReferenceGuide31.pdf?document_id=50452
	-- http://www.latticesemi.com/~/media/LatticeSemi/Documents/UserManuals/EI/HowtouseGSRPURandTSALL.PDF?document_id=31408
	GSR_INST: GSR 
		port map (
			GSR => '1' -- set to '1' if unused
		);

	-- power up reset
	-- It is not necessary to connect signals for PUR to any register elements
	-- explicitly. The function will be implicitly connected globally.
	-- http://help.latticesemi.com/docs/webhelp/eng/index.htm#page/Reference%2520Guides/Hardware%2520How-To/How%2520to%2520Use%2520the%2520Global%2520Set/Reset%2520%28GSR%29%2520Signal.htm
	PUR_INST: PUR
		-- synthesis translate_off
		generic map (RST_PULSE => 100)
		-- synthesis translate_on
		port map (
			PUR => POWERUP_RST
		);
		
	RST_N <= not POWERUP_RST;

	-- create INT_OSC instance to use internal 266 MHz RC oscillator
	INT_OSC : OSCH
		-- synthesis translate_off
		generic map( NOM_FREQ =>  "33.25") -- "19.00" ) -- "2.08" )
		-- synthesis translate_on 
		port map (
			STDBY => '0',
			OSC => MAIN_CLK,
			SEDSTDBY => open 
		);
	
	process(MAIN_CLK)
	begin
		if falling_edge(MAIN_CLK) then
			CLKDIV <= CLKDIV + 1;
		end if;
		
		if rising_edge(MAIN_CLK) then
			CLK_OUT_SCALED <= CLKDIV(2);
		end if;
	end process;
	

	-- GPO_Reg(0): 0 = RXFN_INHIBIT automatically generated between detected MEM_WR transaction and CS release (DEFAULT)
	-- GPO_Reg(0): 1 = RXFN_INHIBIT manually controlled, RXFN_INHIBIT = GPO_Reg(1) 
	-- GPO_Reg(1): 0 = PARALLEL_RXFILLEDN only controlled by RXFIFO fill state (DEFAULT)
	-- GPO_Reg(1): 1 = PARALLEL_RXFILLEDN permanently inhibited
	-- GPO_Reg(7 downto 2): 
	--		implement on demand: RSTOUT, EECS, EECL, EEDA_OUT, EEDADIR for bit banging or to implement a full EEPROM interface
	-- 		implement on demand: will also require GPI use to read in RST, SIM, EEDA_IN, EE interface state.
	
	-- general design port to signal mapping
	PARALLEL_PWREN <= not GP_Enable;
	-- PARALLEL_RXFILLEDN is ORed with RXFN_INHIBIT so a logical '1' will inhibit
	RXFN_INHIBIT   <= (MEM_WR_ACTIVE and (not GPO_Reg(0))) or (GPO_Reg(1) and GPO_Reg(0)); -- was: not GP_Enable;-- to be changed to "inhibited when transfer in progress" if bit in CTRL reg set
	-- was: RXFN_INHIBIT <= not GP_Enable; 
	
	
	-- FIFO front end instance
	fifo_ctrl_inst : fifo_ctrl
		port map (
			-- interface pins 
			PARALLEL_RXFILLEDN=> PARALLEL_RXFILLEDN, 
			PARALLEL_TXENABLEDN=> PARALLEL_TXENABLEDN,
			PARALLEL_DATA_IO=> PARALLEL_DATA_IO,
			-- data latch in / latch out control signals
			PARALLEL_WR=> PARALLEL_WR,
			PARALLEL_RDN=> PARALLEL_RDN,
			-- internal interface
			RXFN_INHIBIT => RXFN_INHIBIT,
			CLOCK => MAIN_CLK,
			MEM_ADDR => MEM_ADDR,
			RST_N => RST_N,
			RXFIFO_DATA=> RXData, -- written by SPI
			RXFIFO_WR=> MEM_WR, 
			TXFIFO_DATA=> TXData, -- read by SPI
			TXFIFO_RD_FIRST => MEM_RD_FIRST,
			TXFIFO_RD_NEXT => MEM_RD_NEXT,
			STATUS => FIFOStatus,
			DEBUG_OUT => DEBUG_OUT 
	);
		
	-- Slave SPI interface instance
	spi_slave_top_inst : spi_slave_top 
		generic map( 
			GPI_PORT_NUM => GPI_PORT_NUM,
			GPI_DATA_WIDTH => GPI_DATA_WIDTH,  
			GPO_PORT_NUM => GPO_PORT_NUM,
			GPO_DATA_WIDTH => GPO_DATA_WIDTH, 
			MEM_ADDR_WIDTH => MEM_ADDR_WIDTH, 
			IRQ_NUM => IRQ_NUM,
			REVISION_ID => REVISION_ID,
			MAX_MEM_BURST_NUM => MAX_MEM_BURST_NUM, 
			INTQ_OPENDRAIN => INTQ_OPENDRAIN 	 
		)
		port map(
			CLK => MAIN_CLK,
			RST_N => RST_N,
			CCLK => SPI_CLK,
			SCSN => SPI_CSN,
			SI => SPI_SDI,
			SO => SPI_SDOZ,
			GPI_0 => FIFOStatus,
			GPI_1 => GPI_Reg,
			-- ...
			GPO_0 => GPO_Reg,
			-- ...
			Enable => GP_Enable, 
			MEM_CLK => MEM_CLK,
			MEM_WR => MEM_WR,
			MEM_ADDR => MEM_ADDR,
			MEM_WD => RXData,
			MEM_RD => TXData,
			IRQ => IRQ, 
			INTQ => INTQ,
			MEM_RD_FIRST => MEM_RD_FIRST, 
			MEM_RD_NEXT => MEM_RD_NEXT			
		); 
	
	IRQ <= (others => '0');
		
		
	-- with three external jumpers the hardened SPI is re-routed to FT2232 Port B pins (see constraints)
	SPI_CLK_ROUTE_o <= SPI_CLK_ROUTE_i;
	SPI_SDI_ROUTE_o <= SPI_SDI_ROUTE_i;
	SPI_SDO_ROUTE_o <= SPI_SDO_ROUTE_i;


	LED_ARRAY(7 downto 0) <= not FIFOStatus(7 downto 0); 
	-- LED_ARRAY(7 downto 0) <= not GPO_Reg;
end architecture main;
