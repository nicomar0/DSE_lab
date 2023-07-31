LIBRARY ieee;
use ieee.std_logic_1164.all;

entity decoder7 is
	PORT (c : IN STD_LOGIC_VECTOR(3 downto 0);
	Display: OUT std_logic_vector(0 to 6));
end decoder7;

architecture behavior of decoder7 is
SIGNAL char: STD_LOGIC_VECTOR(0 to 9);
begin
	char(0) <= (not(c(3)) and NOT(c(2)) AND NOT(c(1)) AND NOT (c(0)));
	char(1) <= (not(c(3)) and NOT(c(2)) AND NOT(c(1)) AND c(0));
	char(2) <= (not(c(3)) and NOT(c(2)) AND c(1) AND NOT (c(0)));
	char(3) <= (NOT(c(3)) and NOT(c(2)) AND c(1) AND c(0));
	char(4) <= (NOT(c(3)) and c(2) AND NOT(c(1)) AND NOT (c(0)));
	char(5) <= (NOT(c(3)) and c(2) AND NOT(c(1)) AND c(0));
	char(6) <= (NOT(c(3)) and c(2) AND c(1) AND NOT (c(0)));
	char(7) <= (NOT(c(3)) and c(2) AND c(1) AND c(0));
	char(8) <= (c(3) and NOT(c(2)) AND NOT(c(1)) AND NOT (c(0)));
	char(9) <= (c(3) and NOT(c(2)) AND NOT(c(1)) AND c(0));

	display(0) <= NOT(char(0) or char(2) or char(3) or char(5) or char(6) or char(7) or char(8) or char(9));
	display(1) <= NOT(char(0) or char(1) or char(2) or char(3) or char(4) or char(7) or char(8) or char(9));
	display(2) <= NOT(char(0) or char(1) or char(3) or char(4) or char(5) or char(6) or char(7) or char(8) or char(9)); 
	display(3) <= NOT(char(0) or char(2) or char(3) or char(5) or char(6) or char(8) or char(9));
	display(4) <= NOT(char(0) or char(2) or char(6) or char(8));
	display(5) <= NOT(char(0) or char(4) or char(5) or char(6) or char(8) or char(9));
	display(6) <= NOT(char(2) or char(3) or char(4) or char(5) or char(6) or char(8) or char(9));
	
end behavior;
