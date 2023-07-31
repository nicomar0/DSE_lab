LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity counter_4bit is
port( enable, clear, clock: in std_logic;
OUTblock_and : out std_logic;
Q4 : inout std_logic_vector (3 downto 0));
end counter_4bit;

architecture arch_4bitcounter of counter_4bit is
component block_TFF 
port( EN, CK, CLC : in std_logic;
	Q : inout std_logic;
	OUTand : out std_logic);
end component;
signal mid01, mid12, mid23: std_logic;
begin
B0 : block_TFF port map(enable, clock, clear, Q4(0),mid01);
B1 : block_TFF port map(mid01, clock, clear, Q4(1),mid12);
B2 : block_TFF port map(mid12, clock, clear, Q4(2),mid23);
B3 : block_TFF port map(mid23, clock, clear, Q4(3),OUTblock_and);

end arch_4bitcounter;