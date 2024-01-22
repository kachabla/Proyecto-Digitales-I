--Proyecto del componente práctico de sistemas digitales I
--Sistema contador de puntos para juego de basket
--Par: 112
--Integrantes: Kenny Chabla Franco
--             Mauro Vega Jacome
--Entrega de avance: 24/12/2023

--Librerias

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Contador de 4 bits de 0 a 9

entity contador_nbcd is
	port(
		reloj, reset: in std_logic;
		cuenta_final: in std_logic_vector(3 downto 0);
		cuenta: out std_logic_vector(3 downto 0)
		);
end contador_nbcd;


architecture cuenta_ascendente of contador_nbcd is
signal Qp, Qn: std_logic_vector(3 downto 0);
begin
	process(cuenta_final,Qp)
	begin
		if cuenta_final = Qp then
			Qn <= (others => '0');
		else
			Qn <= std_logic_vector(unsigned(Qp)+1);
		end if;
		end process;
	Qp <= (others =>'0') when reset = '1' else Qn when rising_edge(reloj);
	cuenta <= Qp;
end cuenta_ascendente;
			
	