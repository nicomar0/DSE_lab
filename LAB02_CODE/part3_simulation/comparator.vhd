library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
entity comparator is
port (
Vin : in unsigned (3 downto 0);
greater : out std_logic);
end entity comparator;

architecture behavior of
comparator is
begin
process (Vin) is
constant b : unsigned (3 downto 0) :="1001";
begin
if (Vin > b) then
greater <= '1';
else 
greater <= '0';
end if;
end process;
end architecture behavior;
