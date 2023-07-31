LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity part2 is
PORT (ENABLE, CLEAR,  CLOCK: in std_logic;
Q : inout std_logic_vector(15 downto 0));
end part2;


architecture structural of part2 is
component counter_4bit
port( enable, clear, clock: in std_logic;
OUTblock_and : out std_logic;
Q4 : inout std_logic_vector (3 downto 0));
end component;
signal outand01, outand12, outand23, outand34 : std_logic;
begin
C03 : counter_4bit port map(ENABLE, CLEAR, CLOCK, outand01,Q(3 downto 0));
C47 : counter_4bit port map(outand01, CLEAR, CLOCK, outand12,Q(7 downto 4));
C811 : counter_4bit port map(outand12, CLEAR, CLOCK, outand23,Q(11 downto 8));
C1215 : counter_4bit port map(outand23, CLEAR, CLOCK, outand34,Q(15 downto 12));
end structural;