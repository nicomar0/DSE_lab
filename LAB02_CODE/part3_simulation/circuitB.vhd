LIBRARY ieee;
use ieee.std_logic_1164.all;

entity circuitB is
	PORT (z : IN STD_logic;
	display : OUT std_logic_vector(6 downto 0));
end circuitB;

architecture behavior of circuitB is
BEGIN
	display(0)<= z;
	display(1)<='0';
	display(2)<='0';
	display(3)<= z;
	display(4)<= z;
	display(5)<= z;
	display(6)<='1';
end behavior;