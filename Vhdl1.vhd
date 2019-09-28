library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity Clock_Divider is
	port 
		(
			MAX10_CLK1_50: in STD_LOGIC;
			KEY : in STD_LOGIC_VECTOR(1 downto 0);
			LEDR: out STD_LOGIC_VECTOR(9 downto 0);
			HEX0: out STD_LOGIC_VECTOR(7 downto 0); 
			HEX1: out STD_LOGIC_VECTOR(7 downto 0); 
			HEX2: out STD_LOGIC_VECTOR(7 downto 0); 
			HEX3: out STD_LOGIC_VECTOR(7 downto 0); 
			HEX4: out STD_LOGIC_VECTOR(7 downto 0); 
			HEX5: out STD_LOGIC_VECTOR(7 downto 0) 
			
		);
end entity;
		
			





architecture behavior  of Clock_divider is

	component segmentsolver
	port(
	number: in STD_LOGIC_VECTOR(3 downto 0);
		HEX: out STD_LOGIC_VECTOR(7 downto 0) 	
	);
	end component;
	
	component segmentsolverdec
	port(
	number: in STD_LOGIC_VECTOR(3 downto 0);
		HEX: out STD_LOGIC_VECTOR(7 downto 0) 	
	);

end component;
	signal prescalecount: STD_LOGIC_VECTOR(18 downto 0) := (others => '0');
	signal prescalevalue: STD_LOGIC_VECTOR (18 downto 0) := "1111010000100100000";
	signal ledmask: STD_LOGIC_VECTOR(9 downto 0) := (others => '1');
	signal ledout: STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
	signal hhl: STD_LOGIC_VECTOR(3 downto 0):= "0001";
	signal hhh: STD_LOGIC_VECTOR(3 downto 0):= "0001";
	signal ssl: STD_LOGIC_VECTOR(3 downto 0):= "0001";
	signal ssh: STD_LOGIC_VECTOR(3 downto 0):= (others => '0');
	signal mml: STD_LOGIC_VECTOR(3 downto 0):= (others => '0');
	signal mmh: STD_LOGIC_VECTOR(3 downto 0):= (others => '0');
	
begin
	
	
	seg0: segmentsolver PORT MAP (
	number => hhl,
	HEX => HEX0
	);
	seg1: segmentsolver PORT MAP (
	number => hhh,
	HEX => HEX1
	);
	seg2: segmentsolverdec PORT MAP (
	number => ssl,
	HEX => HEX2
	);
	seg3: segmentsolver PORT MAP (
	number => ssh,
	HEX => HEX3
	);
	seg4: segmentsolverdec PORT MAP (
	number => mml,
	HEX => HEX4
	);
	seg5: segmentsolver PORT MAP (
	number => mmh,
	HEX => HEX5
	);
	
	
	
	process (MAX10_CLK1_50, KEY)
		begin
			
			
			if KEY(0) = '0' then
					
					hhl <= (others => '0');
					hhh <= (others => '0');
					ssl <= (others => '0');
					ssh <= (others => '0');
					mml <= (others => '0');
					mmh <= (others => '0');
			elsif rising_edge(MAX10_CLK1_50) then
					
				if KEY(1) = '0'	 then
					prescalecount <= prescalecount + 1;
					if (prescalecount = prescalevalue) then
						prescalecount <= (others => '0');
						if (hhl = "1001") then
						hhl<= (others => '0');
							if (hhh = "1001") then
							hhh<= (others => '0');
								if (ssl = "1001") then
								ssl<= (others => '0');
									if (ssh = "0101") then
									ssh<= (others => '0');
										if (mml = "0101") then
										mml<= (others => '0');
										mmh<=mmh+1;
										else 
										mml<=mml+1;
										end if;
											
									else
									ssh<=ssh+1;
										
									end if;
								else
								ssl<=ssl+1;
								end if;
							else
							hhh<=hhh+1;
							end if;
						else
						hhl<= hhl+1;
						end if;
						
						
						end if;
					
					
				end if;
			
			
			
			
					
						
				
			end if;
		 end process;
		 
		 
		 
		
		 


		 
end architecture behavior;
