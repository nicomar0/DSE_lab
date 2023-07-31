LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity module_10 is
port(in_mod, reset, CK : in std_logic;
	count_mod : out unsigned(3 downto 0);
	carry_mod : out std_logic);
end module_10;

architecture behavior of module_10 is

signal Q : unsigned(3 downto 0);

begin
count_mod<=Q;
process (CK, reset, in_mod)
begin
	if(reset='0') then
		Q<="0000";
	elsif (CK='1' and CK'event and in_mod='1') then
		if(Q<9) then
		Q<=Q+1;
		else
		Q<=(others=>'0');
		end if;
	end if;
end process;

process(Q)
begin 
if(Q=9) then
carry_mod<='1';
else
carry_mod<='0';
end if;
end process;
end behavior;
