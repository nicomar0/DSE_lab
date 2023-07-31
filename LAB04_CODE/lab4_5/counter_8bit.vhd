LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity counter_8bit is
PORT (ENABLE, CLEAR,  CLOCK: in std_logic;
Q : inout std_logic_vector(7 downto 0));
end counter_8bit;


architecture structural of counter_8bit is
component counter_4bit
port( enable, clear, clock: in std_logic;
OUTblock_and : out std_logic;
Q4 : inout std_logic_vector (3 downto 0));
end component;
signal outand01, outand12: std_logic;
begin
C03 : counter_4bit port map(ENABLE, CLEAR, CLOCK, outand01,Q(3 downto 0));
C47 : counter_4bit port map(outand01, CLEAR, CLOCK, outand12,Q(7 downto 4));
end structural;