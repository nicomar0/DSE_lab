LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity part5_whole is
port(SW : in std_logic_vector(7 downto 0);
CLOCK_50 : in std_logic;
KEY : in std_logic_vector(3 downto 0);
HEX3, HEX2, HEX1, HEX0 : out std_logic_vector(0 to 6);
LEDR: out std_logic_vector(0 downto 0));
end part5_whole;

architecture structural of part5_whole is
component initial_timer_circuit 
port(KEY0, CLK : in std_logic;
	SW: in std_logic_vector(7 downto 0);
	START : inout std_logic);
end component;

component timer_ms 
port( enable, reset, clock: in std_logic;
out4bcd :  out std_logic_vector(15 downto 0));
end component;

component decoder7_hex
	PORT (Cin : IN STD_LOGIC_VECTOR(3 downto 0);
	segment7: OUT std_logic_vector(0 to 6));
end component;

signal starter, enable_timer : std_logic;
signal in_decoder : std_logic_vector(15 downto 0);

begin

IN_TIM : initial_timer_circuit port map (KEY(0), CLOCK_50, SW, starter);
enable_timer <= starter and key(3);
LEDR(0)<=enable_timer;
TIM_disp : timer_ms port map(enable_timer, KEY(0), CLOCK_50, in_decoder);
H3 : decoder7_hex port map(in_decoder(15 downto 12), HEX3);
H2 : decoder7_hex port map(in_decoder(11 downto 8), HEX2);
H1 : decoder7_hex port map(in_decoder(7 downto 4), HEX1);
H0 : decoder7_hex port map(in_decoder(3 downto 0), HEX0);
end structural;

