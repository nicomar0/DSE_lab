LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

entity Counter25k is
GENERIC ( N : integer:=16);
port( EN, CK, CLC : in std_logic;
START : out std_logic);
end Counter25k;


architecture Counter_arch of Counter25k is
signal Q : unsigned(N-1 downto 0);
begin
process(CK, EN, CLC)
begin

if(CLC = '0') then
    Q <= (others => '0');
elsif (CK = '1' and CK'event and EN = '1') then
  if (Q <49999) then
	Q<=Q+1;
  else 
    Q <= (others => '0');
  end if;
end if;
end process;

process(Q)
begin
if(Q=49999) then
START<='1';
else
START<='0';
end if;
end process;

end Counter_arch;
