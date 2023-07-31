LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY mux IS
PORT ( sel: IN STD_LOGIC_VECTOR(1 downto 0);
output : OUT STD_LOGIC_VECTOR(14 downto 0));
END mux;
ARCHITECTURE Behavior OF mux IS
SIGNAL  U, V, W, X : STD_LOGIC_VECTOR(14 downto 0);
BEGIN
U<="000001010010011";
V<="100001101101011";
W<="100001010010011";
X<="111001101101011";
mux : PROCESS (sel)
begin
if (sel(1)='0' and sel(0)='0') then
	output<=U;
elsif (sel(1)='0' and sel(0)='1') then
	output<=V;
elsif (sel(1)='1' and sel(0)='0') then
	output<=W;
else
	output<=X;
end if;
end process mux;
END Behavior;

