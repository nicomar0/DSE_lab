LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity sr_latch_tb is
end sr_latch_tb;

architecture sr_latch_arch of sr_latch_tb is

component part1
PORT( Clk, R, S : IN STD_LOGIC;
Q : OUT STD_LOGIC);
end component;

signal R,S,CK,Q: std_logic;

begin
DUT : part1 PORT MAP(CK,R,S,Q);
 process
begin
CK <= '1';
R <= '1';
S <= '0';

wait for 20 ms;

S <= '1';
R <= '0';

wait for 20 ms;

CK <= '0';

wait for 5 ms;

R <= '1';
S <= '0';

wait for 20 ms;

CK <= '1';

wait for 5 ms;
R <= '1';
S <= '1';
wait for 20 ms;
wait;


end process;
end sr_latch_arch;



