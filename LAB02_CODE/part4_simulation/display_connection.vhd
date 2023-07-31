LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity display_connection is
port(
SIGNAL SW : IN std_logic_vector(5 downto 0);
SIGNAL HEX0, HEX1: OUT std_logic_vector(6 downto 0));
END display_connection;

architecture display_arc of display_connection is
component converter is

PORT ( SW : IN UNSIGNED(5 DOWNTO 0);
bcd_1 : inout std_logic_vector (3 downto 0); --decimal
bcd_2 : out STD_LOGIC_vector (3 downto 0)); --unit

end component;


component decoder7
PORT (c : IN STD_LOGIC_VECTOR(3 downto 0);
	Display: OUT std_logic_vector(0 to 6));
end component;
SIGNAL displ_input1 ,displ_input2 : std_logic_vector(3 downto 0);

SIGNAL swu : unsigned (5 downto 0);

begin

swu <= unsigned(SW);
DEVICE : converter PORT MAP(swu, displ_input1 ,displ_input2);

DISP1 : decoder7 port map(c=> displ_input1, display=>HEX1);
DISP2 : decoder7 port map(c=> displ_input2, display=>HEX0);
end display_arc;