-- VHDL module instantiation generated by SCUBA Diamond (64-bit) 3.4.1.213
-- Module  Version: 6.4
-- Sun Aug 16 21:01:39 2015

-- parameterized module component declaration
component ram_dp
    port (WrAddress: in  std_logic_vector(5 downto 0); 
        RdAddress: in  std_logic_vector(5 downto 0); 
        Data: in  std_logic_vector(7 downto 0); WE: in  std_logic; 
        RdClock: in  std_logic; RdClockEn: in  std_logic; 
        Reset: in  std_logic; WrClock: in  std_logic; 
        WrClockEn: in  std_logic; Q: out  std_logic_vector(7 downto 0));
end component;

-- parameterized module component instance
__ : ram_dp
    port map (WrAddress(5 downto 0)=>__, RdAddress(5 downto 0)=>__, Data(7 downto 0)=>__, 
        WE=>__, RdClock=>__, RdClockEn=>__, Reset=>__, WrClock=>__, 
        WrClockEn=>__, Q(7 downto 0)=>__);
