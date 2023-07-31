LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity mux_3bit is

port(
IN_0,IN_1 : in std_logic_vector(2 downto 0);
sel : in std_logic;
out_mux : out std_logic_vector (2 downto 0)
);
end mux_3bit;

architecture behaviour of mux_3bit is
begin
process (sel,in_0,in_1)
begin

 if (sel = '0') then
out_mux <= in_0;
else
out_mux <= in_1;
end if;

end process;
end behaviour;
