LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity signed_16bit_adder is
PORT (Ain,Bin : in signed(15 downto 0);
Cin : in std_logic;
Sum : out signed(15 downto 0);
Cout : out std_logic);
end signed_16bit_adder;
 
architecture structural of signed_16bit_adder is
component fulladder 
PORT( a, b, cin: in std_logic;
	  sum, cout: out std_logic);
end component;
signal c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15 : std_logic;
signal A, B, Sum_tmp : std_logic_vector(15 downto 0);
begin
A <= std_logic_vector(Ain);
B <= std_logic_vector(Bin);
Sum <=signed(Sum_tmp);
FA0 : fulladder port map(Ain(0), Bin(0), Cin, Sum_tmp(0),c1);
FA1 : fulladder port map(Ain(1), Bin(1), c1, sum_tmp(1), c2);
FA2 : fulladder port map(Ain(2), Bin(2), c2, sum_tmp(2), c3);
FA3 : fulladder port map(Ain(3), Bin(3), c3, sum_tmp(3), c4);
FA4 : fulladder port map(Ain(4), Bin(4), c4, sum_tmp(4), c5);
FA5 : fulladder port map(Ain(5), Bin(5), c5, sum_tmp(5), c6);
FA6 : fulladder port map(Ain(6), Bin(6), c6, sum_tmp(6), c7);
FA7 : fulladder port map(Ain(7), Bin(7), c7, sum_tmp(7), c8);
FA8 : fulladder port map(Ain(8), Bin(8), c8, sum_tmp(8), c9);
FA9 : fulladder port map(Ain(9), Bin(9), c9, sum_tmp(9), c10);
FA10 : fulladder port map(Ain(10), Bin(10), c10, sum_tmp(10), c11);
FA11 : fulladder port map(Ain(11), Bin(11), c11, sum_tmp(11), c12);
FA12 : fulladder port map(Ain(12), Bin(12), c12, sum_tmp(12), c13);
FA13 : fulladder port map(Ain(13), Bin(13), c13, sum_tmp(13), c14);
FA14 : fulladder port map(Ain(14), Bin(14), c14, sum_tmp(14), c15);
FA15 : fulladder port map(Ain(15), Bin(15), c15, sum_tmp(15), cout);
end structural;