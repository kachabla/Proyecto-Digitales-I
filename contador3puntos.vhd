--Proyecto del componente práctico de sistemas digitales I
--Sistema contador de puntos para juego de basket
--Par: 112
--Integrantes: Kenny Chabla Franco
--             Mauro Vega Jacome
--Entrega de avance: 24/12/2023

library IEEE; 
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador3puntos is
	port ( reloj, reloj_en, reset : in  std_logic;
				output : out std_logic_vector (9 downto 0);
				 carry : out std_logic);
end contador3puntos;

architecture salida_ascendente of contador3puntos is
	signal out_vector : std_logic_vector (9 downto 0) := "0000000001";
	signal carry_signal : std_logic := '1';
begin
	process (reloj, reset)
	begin
		if reset = '1' then
			out_vector <= "0000000001";
		elsif rising_edge(reloj) then
			if reloj_en = '0' then
				out_vector <= to_stdlogicvector(to_bitvector(out_vector) rol 1);
				if to_integer(unsigned(to_stdlogicvector(to_bitvector(out_vector) rol 1))) < 32 then
					carry_signal <= '1';
				else
					carry_signal <= '0';
				end if;
			end if;
		end if;
	end process;

	output <= out_vector;
	carry  <= carry_signal;
end salida_ascendente;