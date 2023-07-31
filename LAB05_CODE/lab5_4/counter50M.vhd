LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

entity Counter50M is
GENERIC ( N : integer:=26);
port( EN, CK, CLC : in std_logic;
START : out std_logic);
end Counter50M;


architecture Counter_arch of Counter50M is
signal Q : unsigned(N-1 downto 0);
begin
process(CK, EN, CLC)
begin

if(CLC = '0') then
    Q <= (others => '0');
elsif (CK = '1' and CK'event and EN = '1') then
  if (Q <49999999) then
	Q<=Q+1;
  else 
    Q <= (others => '0');
  end if;
end if;
end process;

process(Q)
begin
if(Q=49999999) then
START<='1';
else
START<='0';
end if;
end process;

end Counter_arch;
