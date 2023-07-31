LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity timer_ms is
port( enable, reset, clock: in std_logic;
out4bcd :  out std_logic_vector(15 downto 0));
end timer_ms;

architecture structural of timer_ms is
component Counter25k
GENERIC ( N : integer:=16);
port( EN, CK, CLC : in std_logic;
START : out std_logic);
end component;

component regn
GENERIC ( N : integer);
PORT (R : IN std_logic_vector(N-1 DOWNTO 0);
Clock, Resetn : IN STD_LOGIC;
Q : OUT std_logic_vector(N-1 DOWNTO 0));
END component;

component block_4_module_10
POrt ( unit, RST, CLK : in std_logic;
	 output_4BCD : out std_logic_vector(15 downto 0));
end component;

signal plusone : std_logic;
signal count : std_logic_vector(15 downto 0);
begin

CNT : counter25k port map(enable, clock, reset, plusone);
CNTBCD : block_4_module_10 port map(plusone, reset, clock, count);
REG_BCD : regn generic map(16)
				port map(count, clock, reset, out4bcd);

end structural;