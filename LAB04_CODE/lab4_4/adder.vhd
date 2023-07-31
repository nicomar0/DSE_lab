LIBRARY ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY adder is
PORT( A : IN unsigned(3 downto 0);
E: in unsigned(25 downto 0);
S: out unsigned (3 downto 0));
end adder;

ARCHITECTURE Behavior OF adder IS
begin
process(E,A)
begin


if (E = "10000000000000000000000000") then

S <= A+1;
else

S<= A;

end if;
end process;
end Behavior;
