LIBRARY ieee;
use ieee.std_logic_1164.all;

entity threebitmux is
	PORT (inmux : IN STD_LOGIC_VECTOR(6 downto 0);
	outmux: OUT std_logic_vector(2 downto 0));
end threebitmux;

architecture behavior of threebitmux is
SIGNAL X,Y: STD_LOGIC_VECTOR(2 downto 0);
SIGNAL s : STD_LOGIC;
begin
	outmux(0) <= (NOT (s) AND X(0)) OR (s AND Y(0));
	outmux(1) <= (NOT (s) AND X(1)) OR (s AND Y(1));
	outmux(2) <= (NOT (s) AND X(2)) OR (s AND Y(2));
	s<=inmux(6);
	X<=inmux(2 downto 0);
	Y<=inmux(5 downto 3);
end behavior;