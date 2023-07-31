LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity block_4adders is
PORT ( Ain, Bin :  in std_logic_vector(3 downto 0);
Cin_block : in std_logic;
Sum : out std_logic_vector(3 downto 0);
Cout_block :  out  std_logic);
end block_4adders;

architecture structural of block_4adders is
component fulladder 
PORT( a, b, cin: in std_logic;
	  sum, cout: out std_logic);
end component;
signal c1, c2, c3 : std_logic;
signal Sum_tmp : std_logic_vector(7 downto 0);
begin
FA0 : fulladder port map(Ain(0), Bin(0), Cin_block, Sum(0),c1);
FA1 : fulladder port map(Ain(1), Bin(1), c1, sum(1), c2);
FA2 : fulladder port map(Ain(2), Bin(2), c2, sum(2), c3);
FA3 : fulladder port map(Ain(3), Bin(3), c3, sum(3), Cout_block);

end structural;
