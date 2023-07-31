LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity block_4_module_10 is
POrt ( unit, RST, CLK : in std_logic;
	 output_4BCD : out std_logic_vector(15 downto 0));
end block_4_module_10;

architecture structural of block_4_module_10 is
component module_10 
port(in_mod, reset, CK : in std_logic;
	count_mod : out unsigned(3 downto 0);
	carry_mod : out std_logic);
end component;

component regn
GENERIC ( N : integer);
PORT (R : IN STD_LOGIC_Vector(N-1 DOWNTO 0);
Clock, Resetn : IN STD_LOGIC;
Q : OUT std_logic_vector(N-1 DOWNTO 0));
END component;

signal carry32, carry21, carry10, carry33 : std_logic;
signal mid10, mid21, mid32: std_logic;
signal out3, out2, out1, out0 : unsigned(3 downto 0);
begin

M0 : module_10 port map(unit, RST, CLK, out0, carry10);
mid10<=(carry10 and unit);
M1 : module_10 port map(mid10, RST, CLK, out1, carry21);
mid21<=mid10 and carry21;
M2 : module_10 port map(mid21, RST, CLK, out2, carry32);
mid32<=mid21 and carry32;
M3 : module_10 port map(mid32, RST, CLK, out3, carry33);

R0 : regn generic map(4)
		  port map(std_logic_vector(out0),CLK, RST, output_4BCD(3 downto 0));
R1 : regn generic map(4)
		  port map(std_logic_vector(out1),CLK, RST, output_4BCD(7 downto 4));
R2 : regn generic map(4)
		  port map(std_logic_vector(out2),CLK, RST, output_4BCD(11 downto 8));
R3 : regn generic map(4)
		  port map(std_logic_vector(out3),CLK, RST, output_4BCD(15 downto 12));
end structural;