library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
entity subtractor is
port (
bcd_1 : in std_logic_vector (3 downto 0);
vin : in unsigned (5 downto 0);
bcd_2 : out std_logic_vector(3 downto 0));

end entity subtractor;

architecture behavior of subtractor is

signal tmp: std_logic_vector (5 downto 0);

signal tmp2: unsigned (7 downto 0);

begin

tmp2 <= 10*unsigned(bcd_1);

tmp <= std_logic_vector((vin) - tmp2(5 downto 0));

bcd_2 <= tmp(3 downto 0);

end behavior;