--Proyecto del componente práctico de sistemas digitales I
--Sistema contador de puntos para juego de basket
--Par: 112
--Integrantes: Kenny Chabla Franco
--             Mauro Vega Jacome
--Entrega de avance: 24/12/2023

--Librerias

library ieee;
use ieee.std_logic_1164.all;

--Decodificador para display de 7 segmentos

entity dec7seg is
	port(bcd: in std_logic_vector(3 downto 0);
		  leds: out std_logic_vector(1 to 7) 
			);
end dec7seg;

architecture dec of dec7seg is
begin
	process(bcd)
	begin
		case bcd is 
		                         --abcdefg     
			when "0000" => leds <= "1111110";
		   when "0001" => leds <= "0110000";  
		   when "0010" => leds <= "1101101";
			when "0011" => leds <= "1111001";
			when "0100" => leds <= "0110011";
			when "0101" => leds <= "1011011";
			when "0110" => leds <= "1011111";
			when "0111" => leds <= "1110000";
			when "1000" => leds <= "1111111";
			when "1001" => leds <= "1111011";
			when others => leds <= "1111110";
		end case;
	end process;
end dec;
		