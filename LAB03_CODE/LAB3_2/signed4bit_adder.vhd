LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity signed4bit_adder is
PORT (Ain,Bin : in signed(3 downto 0);
Cin : in std_logic;
Sum : out signed(3 downto 0);
Cout : out std_logic);
end signed4bit_adder;
 
architecture structural of signed4bit_adder is
component fulladder 
PORT( a, b, cin: in std_logic;
	  sum, cout: out std_logic);
end component;
signal  c1, c2, c3 : std_logic;
signal A, B, Sum_tmp : std_logic_vector(3 downto 0);
begin


A <= std_logic_vector(Ain);
B <= std_logic_vector(Bin);
Sum <=signed(Sum_tmp);
FA0 : fulladder port map(Ain(0), Bin(0), Cin, Sum_tmp(0),c1);
FA1 : fulladder port map(Ain(1), Bin(1), c1, sum_tmp(1), c2);
FA2 : fulladder port map(Ain(2), Bin(2), c2, sum_tmp(2), c3);
FA3 : fulladder port map(Ain(3), Bin(3), c3, sum_tmp(3), Cout);
end structural;