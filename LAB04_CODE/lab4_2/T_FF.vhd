LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity T_FF is
port(T, CK, RST: in std_logic;
Q : inout std_logic);
end T_FF;

architecture T_FF_arch of T_FF is
begin
process(CK, RST)
begin
	if(RST='0') then
		Q<='0';
	elsif (CK='1' and ck'event and T='1') then
		Q<=not(Q);
	end if;
end process;
end T_FF_arch;