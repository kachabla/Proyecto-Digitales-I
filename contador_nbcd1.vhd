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
entity contador_nbcd1 is
	port(
		reloj, reset: in std_logic;
		cuenta_final: in std_logic_vector(3 downto 0);
		cuenta: out std_logic_vector(3 downto 0);
		salidaalcontador: out std_logic
		);
end contador_nbcd1;
architecture cuenta_ascendente1 of contador_nbcd1 is
signal Qp, Qn: std_logic_vector(3 downto 0);
signal Qc: std_logic;
begin
	process(cuenta_final,Qp)
	begin
		if cuenta_final = Qp then
			Qn <= (others => '0');
		else
			Qn <= std_logic_vector(unsigned(Qp)+1); 
		end if;
		if "0101" = Qp then
			salidaalcontador <= '0';
		end if;	
		if "0000" = Qp then
			salidaalcontador <= '1';
		end if;
	end process;
	Qp <= (others =>'0') when reset = '1' else Qn when rising_edge(reloj);
	cuenta <= Qp;
end cuenta_ascendente1;