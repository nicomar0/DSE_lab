LIBRARY ieee;
use ieee.std_logic_1164.all;

entity decoder7 is
	PORT (Cin : IN STD_LOGIC_VECTOR(2 downto 0);
	Display: OUT std_logic_vector(6 downto 0));
end decoder7;

architecture behavior of decoder7 is
SIGNAL c: STD_LOGIC_VECTOR(2 downto 0);
SIGNAL char: STD_LOGIC_VECTOR(0 to 7);
begin
	c<=Cin(2 downto 0);
	char(0) <= (NOT(c(2)) AND NOT(c(1)) AND NOT (c(0)));
	char(1) <= (NOT(c(2)) AND NOT(c(1)) AND c(0));
	char(2) <= (NOT(c(2)) AND c(1) AND NOT (c(0)));
	char(3) <= (NOT(c(2)) AND c(1) AND c(0));
	char(4) <= (c(2) AND NOT(c(1)) AND NOT (c(0)));
	char(5) <= (c(2) AND NOT(c(1)) AND c(0));
	char(6) <= (c(2) AND c(1) AND NOT (c(0))); -- blank not used 
	char(7) <= (c(2) AND c(1) AND c(0));

	display(0) <= not (char(1) or char(3) or char(4) or char(5) or char(7));
	display(1) <= not(char(0) or char(3) or char(5));
	display(2) <= not(char(0) or char(3));
	display(3) <= not(char(1) or char(2) or char(3) or char(4));
	display(4) <= not(char(0) or char(1) or char(2) or char(3) or char(4) or char(5) or char(7));
	display(5) <= not(char(0) or char(1) or char(2) or char(3) or char(4) or char(5) or char(7));
	display(6) <= not(char(0) or char(1) or char(5) or char(7));
	
end behavior;