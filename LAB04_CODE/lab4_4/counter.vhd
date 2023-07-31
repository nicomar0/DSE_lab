LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

entity Counter is
port( EN, CK, CLC : in std_logic;
Q : inout unsigned(25 downto 0));
end Counter;


architecture Counter_arch of Counter is
begin
process(CK, EN, CLC)
begin

if(CLC = '0') then
    Q <= "00000000000000000000000000";
elsif (CK = '1' and CK'event and EN = '1') then
    Q <= Q + 1;
end if;
end process;

end Counter_arch;