library ieee;
use ieee.std_logic_1164.all;


entity segmentsolver is
		port(
		
		number: in STD_LOGIC_VECTOR(3 downto 0);
		HEX: out STD_LOGIC_VECTOR(7 downto 0) 	
		
		
		
		);

end segmentsolver;


architecture behavior of segmentsolver is 
begin

process(number)
begin 
	case number is
		when "0000" => HEX<= "11000000";
		when "0001" => HEX<= "11111001";
		when "0010" => HEX<= "10100100";
		when "0011" => HEX<= "10110000";
		when "0100" => HEX<= "10011001";
		when "0101" => HEX<= "10010010";
		when "0110" => HEX<= "10000010";
		when "0111" => HEX<= "11111000";
		when "1000" => HEX<= "10000000";
		when "1001" => HEX<= "10011000";
		when others => HEX<= "11000000";
	end case;


end process;

end architecture behavior; 
library ieee;
use ieee.std_logic_1164.all;


entity segmentsolverdec is
		port(
		
		number: in STD_LOGIC_VECTOR(3 downto 0);
		HEX: out STD_LOGIC_VECTOR(7 downto 0) 	

		
		);

end segmentsolverdec;


architecture behavior of segmentsolverdec is 
begin

process(number)
begin 
	case number is
		when "0000" => HEX<= "01000000";
		when "0001" => HEX<= "01111001";
		when "0010" => HEX<= "00100100";
		when "0011" => HEX<= "00110000";
		when "0100" => HEX<= "00011001";
		when "0101" => HEX<= "00010010";
		when "0110" => HEX<= "00000010";
		when "0111" => HEX<= "01111000";
		when "1000" => HEX<= "00000000";
		when "1001" => HEX<= "00011000";
		when others => HEX<= "01000000";
	end case;


end process;






end architecture behavior; 