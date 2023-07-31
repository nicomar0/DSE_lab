LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY shifter IS
PORT ( input : IN STD_LOGIC_VECTOR(14 downto 0);
sel: IN STD_LOGIC_VECTOR(2 downto 0);
output : OUT STD_LOGIC_VECTOR(14 downto 0));
END shifter;
ARCHITECTURE Behavior OF shifter IS
SIGNAL s0,s1,s2,s3,s4 : std_logic_vector(2 downto 0);
BEGIN
s0<=input(14 downto 12);
s1<=input(11 downto 9);
s2<=input(8 downto 6);
s3<=input(5 downto 3);
s4<=input(2 downto 0);

with sel SELECT output<=
	s0 & s1 & s2 & s3 & s4 when "000",
	s1 & s2 & s3 & s4 & s0 when "001",
	s2 & s3 & s4 & s0 & s1 when "010",
	s3 & s4 & s0 & s1 & s2 when "011",
	s4 & s0 & s1 & s2 & s3 when "100",
	s0 & s0 & s0 & s0 & s0 when others;
END Behavior;
