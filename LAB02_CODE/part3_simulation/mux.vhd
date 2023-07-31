LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;

entity mux is
	PORT (input : IN STD_LOGIC_VECTOR(1 downto 0);
	s : IN std_logic;
	output: OUT std_logic);
end mux;

architecture behavior of mux is
begin
	output <= (NOT (s) AND input(0)) OR (s AND input(1));
end behavior;
