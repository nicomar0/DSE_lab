LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity initial_timer_circuit is
port(KEY0, CLK : in std_logic;
	SW: in std_logic_vector(7 downto 0);
	START : inout std_logic);
end initial_timer_circuit;

architecture structural of initial_timer_circuit is

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

component counter_8bit 
PORT (ENABLE, CLEAR,  CLOCK: in std_logic;
Q : inout std_logic_vector(7 downto 0));
end component;

component comparator_8bit
port( input1, input2 : in std_logic_vector(7 downto 0);
	  equal_check : out std_logic);
end component;

signal out25k : std_logic_vector(0 downto 0);
signal out25k_reg : std_logic_vector(0 downto 0);
signal out8bit : std_logic_vector(7 downto 0);
signal out8bit_reg: std_logic_vector(7 downto 0);
signal enable: std_logic;
begin 
enable <= not(START) and KEY0;
CNT25k : Counter25k port map(enable, CLK,KEY0,out25k(0));
RG1 : regn generic map(1)
			port map(out25k, CLK, KEY0,out25k_reg);
CNT8bit : counter_8bit port map(out25k_reg(0), KEY0,CLK,out8bit);
RG2 : regn generic map(8)
			port map(out8bit, CLK, KEY0, out8bit_reg);
CMP : comparator_8bit port map(SW, out8bit_reg,START);

end structural;