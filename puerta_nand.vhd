--Proyecto del componente práctico de sistemas digitales I
--Sistema contador de puntos para juego de basket
--Par: 112
--Integrantes: Kenny Chabla Franco
--             Mauro Vega Jacome
--Entrega de avance: 24/12/2023

library ieee;
use ieee.std_logic_1164.all;

entity puerta_nand is

    port(I1 : in std_logic;     
         I2 : in std_logic;      
         O : out std_logic); 

end puerta_nand;

architecture archnand of puerta_nand is

 begin
    
    O <= I1 nand I2;

end archnand;