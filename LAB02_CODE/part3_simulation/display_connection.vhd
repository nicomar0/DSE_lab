LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity display_connection is
port(
SIGNAL SW : IN std_logic_vector(3 downto 0);
SIGNAL HEX0, HEX1: OUT std_logic_vector(6 downto 0));
END display_connection;

architecture display_arc of display_connection is
component converter is
PORT ( SW : IN unsigned(3 DOWNTO 0);
m : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
z : inout STD_LOGIC);
end component;

component circuitB 
PORT (z : IN STD_logic;
	display : OUT std_logic_vector(6 downto 0));
end component;


component decoder7
PORT (c : IN STD_LOGIC_VECTOR(3 downto 0);
	Display: OUT std_logic_vector(0 to 6));
end component;
SIGNAL displ_input : std_logic_vector(4 downto 0);
SIGNAL SW_unsigned : unsigned(3 downto 0);
begin

SW_unsigned <= unsigned(SW);

DEVICE : converter PORT MAP(SW=>SW_unsigned, m=>displ_input(3 downto 0), z=>displ_input(4));
DISP1 : circuitB port map(z=>displ_input(4), display=>HEX1);
DISP2 : decoder7 port map(c=> displ_input(3 downto 0), display=>HEX0);
end display_arc;