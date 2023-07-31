LIBRARY ieee;
use ieee.std_logic_1164.all;

entity fourbitmux is
	PORT (SW : IN STD_LOGIC_VECTOR(8 downto 0);
	LEDR: OUT std_logic_vector(3 downto 0));
end fourbitmux;

architecture behavior of fourbitmux is
SIGNAL X,Y: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL s : STD_LOGIC;
begin
	LEDR(0) <= (NOT (s) AND X(0)) OR (s AND Y(0));
	LEDR(1) <= (NOT (s) AND X(1)) OR (s AND Y(1));
	LEDR(2) <= (NOT (s) AND X(2)) OR (s AND Y(2));
	LEDR(3) <= (NOT (s) AND X(3)) OR (s AND Y(3));	
	s<=SW(8);
	X<=SW(3 downto 0);
	Y<=SW(7 downto 4);
end behavior;
