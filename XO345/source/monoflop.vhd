library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;
use IEEE.numeric_std.all;


entity mono is
	-- design ports to be mapped to pins
	port( 	
		CLOCK : in std_logic;
		RST_N : in std_logic;
		INP : in std_logic;
		Q : out std_logic
	);
end entity mono;


-- rising edge triggered monoflop: WR_busy
architecture simplemonoflop_inv of mono is
	constant log2_max : integer := 5;
	signal counter: std_logic_vector(log2_max downto 0) := ('1', others => '0');
	signal delayed_inp : std_logic := '0';
begin
	process(CLOCK, INP)	
	begin
		if RST_N = '1' then
			if rising_edge (CLOCK) then
				if (INP = '0') and (delayed_inp = '1') and (counter(log2_max) = '1') then 
					-- INP _/ detected and trigger allowed 
					counter <= ( others => '0');  
				else
					if counter(log2_max) = '0' then 
						-- log2_max = 2: count from 000 to 100
						counter <= counter + 1;
					end if;
				end if;	
				delayed_inp <= INP;
			end if;
			
			if falling_edge (CLOCK) then
				if (INP = '0') and (delayed_inp = '1') and (counter(log2_max) = '1') then 
					counter <= ( others => '0'); 
				end if;
				delayed_inp <= INP;
			end if;
		else
			delayed_inp <= INP;
			counter(log2_max) <= '1';
		end if;
	
		
	end process; 
	
	Q <= not counter(log2_max);
end architecture simplemonoflop_inv;


--falling edge triggered monoflop : RD_Busy
architecture simplemonoflop of mono is
	constant log2_max : integer := 3;
	signal counter: std_logic_vector(log2_max downto 0) := ('1', others => '0');
	signal delayed_inp : std_logic := '1';
begin
	process(CLOCK, INP)	
	begin
		if rising_edge(CLOCK) then
			if (INP = '1') and (delayed_inp = '0') and (counter(log2_max) = '1') then 
				-- INP _/ detected and trigger allowed 
				counter <= (1=> '0', 0=>'0', others => '0'); 
			else
				if counter(log2_max) = '0' then 
					-- log2_max = 2: count from 000 to 100
					counter <= counter + 1;
				end if;
			end if;	
			delayed_inp <= INP;
		end if;
		
		if falling_edge(CLOCK) then
			if (INP = '1') and (delayed_inp = '0') and (counter(log2_max) = '1') then 
				counter <= (1=> '0', 0=>'0', others => '0');
			end if;	
			delayed_inp <= INP;
		end if;
	end process; 
	
	Q <= not counter(log2_max);
end architecture simplemonoflop;