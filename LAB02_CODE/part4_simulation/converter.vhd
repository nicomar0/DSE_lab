LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY converter IS
PORT ( SW : IN UNSIGNED(5 DOWNTO 0);
bcd_1 : inout std_logic_vector (3 downto 0); --decimal
bcd_2 : out STD_LOGIC_vector (3 downto 0)); --unit
END converter;


architecture structural of converter is

component comparator  is
port (
Vin : in unsigned (5 downto 0);
bcd_1 : out std_logic_vector (3 downto 0));
end component;

component subtractor is
port (
bcd_1 : in std_logic_vector (3 downto 0);
vin : in unsigned (5 downto 0);
bcd_2 : out std_logic_vector(3 downto 0));

end component;

begin


COMP : comparator PORT MAP(SW,bcd_1);
SUB : subtractor PORT MAP(bcd_1, SW, bcd_2);


end structural;
