library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
entity comparator is
port (
Vin : in unsigned (5 downto 0);
bcd_1 : out std_logic_vector (3 downto 0));
end entity comparator;

architecture behavior of
comparator is
begin
process (Vin) is

constant b : unsigned (5 downto 0) :="001010";
constant c : unsigned (5 downto 0) :="010100";
constant d : unsigned (5 downto 0) :="011110";
constant e : unsigned (5 downto 0) :="101000";
constant f : unsigned (5 downto 0) :="110010";
constant g : unsigned (5 downto 0) :="111100";

begin

if (Vin < b) then
bcd_1 <= "0000";

elsif (Vin >= b) and (Vin < c) then
bcd_1 <= "0001";

elsif (Vin >= c) and (Vin < d) then
bcd_1 <= "0010";

elsif (Vin >= d) and (Vin < e) then
bcd_1 <= "0011";

elsif (Vin >= e) and (Vin < f) then
bcd_1 <= "0100";

elsif (Vin >= f) and (Vin < g) then
bcd_1 <= "0101";

elsif (Vin >= g)  then
bcd_1 <= "0110";

end if;
end process;


end architecture behavior;
