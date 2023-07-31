LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;

entity circuitA is
	PORT (v : IN unsigned(2 downto 0);
	q: OUT std_logic_vector(2 downto 0));
end circuita;

architecture behavior of circuita is
BEGIN
with v SELECT q<=
	"000" when "010",
	"001" when "011",
	"010" when "100",
	"011" when "101",
	"100" when "110",
	"101" when "111",
	"111" when others;	-- default, will not appear
end behavior;
