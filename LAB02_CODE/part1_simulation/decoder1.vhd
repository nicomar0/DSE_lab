LIBRARY ieee;
use ieee.std_logic_1164.all;

entity part1 is
	PORT (SW : IN STD_LOGIC_VECTOR(2 downto 0);
	HEX0: OUT std_logic_vector(0 to 6));
end part1;

architecture behavior of part1 is
SIGNAL c: STD_LOGIC_VECTOR(2 downto 0);
SIGNAL char: STD_LOGIC_VECTOR(0 to 7);
begin
	c<=SW(2 downto 0);
	char(0) <= (NOT(c(2)) AND NOT(c(1)) AND NOT (c(0)));
	char(1) <= (NOT(c(2)) AND NOT(c(1)) AND c(0));
	char(2) <= (NOT(c(2)) AND c(1) AND NOT (c(0)));
	char(3) <= (NOT(c(2)) AND c(1) AND c(0));
	char(4) <= (c(2) AND NOT(c(1)) AND NOT (c(0)));
	char(5) <= (c(2) AND NOT(c(1)) AND c(0));
	char(6) <= (c(2) AND c(1) AND NOT (c(0)));
	char(7) <= (c(2) AND c(1) AND c(0));

	HEX0(0) <= NOT (char(1) or char(3));
	HEX0(1) <= NOT (char(0) or char(3));
	HEX0(2) <= NOT(char(0) or char(3));
	HEX0(3) <= NOt(char(1) or char(2) or char(3));
	HEX0(4) <= NOT(char(0) or char(1) or char(2) or char(3));
	HEX0(5) <= NOT(char(0) or char(1) or char(2) or char(3));
	HEX0(6) <= NOt(char(0) or char(1));
	
end behavior;

