LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity part2_whole is
port(KEY : in std_logic_vector(0 downto 0);
SW : in std_logic_vector(1 downto 0);
HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(0 to 6));
end part2_whole;

architecture structural of part2_whole is

component part2
PORT (ENABLE, CLEAR,  CLOCK: in std_logic;
Q : inout std_logic_vector(15 downto 0));
end component;

component decoder7_hex
	PORT (Cin : IN STD_LOGIC_VECTOR(3 downto 0);
	segment7: OUT std_logic_vector(0 to 6));
end component;

signal Qhex : std_logic_vector(15 downto 0);
begin

CIR : part2 port map (ENABLE=>SW(1), CLEAR => SW(0), CLOCK=>KEY(0),Q=>Qhex);
H0 : decoder7_hex port map(Qhex(3 downto 0), HEX0);
H1 : decoder7_hex port map(Qhex(7 downto 4), HEX1);
H2 : decoder7_hex port map(Qhex(11 downto 8), HEX2);
H3 : decoder7_hex port map(Qhex(15 downto 12), HEX3);

end structural;