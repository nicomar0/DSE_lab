LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity HELLO_fsm_tb is
end HELLO_fsm_tb;


architecture fsm_tb_arc of HELLO_fsm_tb is

signal CLK : std_logic;
signal RST : std_logic_vector (0 downto 0);
signal HEXX5, HEXX4, HEXX3, HEXX2, HEXX1, HEXX0 : std_logic_vector(6 downto 0);

component HELLO_fsm 
PORT ( KEY : in std_logic_vector (0 downto 0);
CLOCK_50 : in std_logic;
HEX5, HEX4, HEX3, HEX2, HEX1, HEX0 : out STD_LOGIC_VECTOR(0 to 6)
);

END component;


begin

DUT : HELLO_fsm port map(RST, Clk, HEXX5, HEXX4, HEXX3, HEXX2, HEXX1, HEXX0);

process
begin
CLK <= '1';
wait for 10 ns;
CLK <= '0';
wait for 10 ns;
end process;

process
begin
RST(0) <= '0';
wait for 19 ms;
RST(0) <= '1';
wait for 13 sec;
RST(0) <= '0';
wait;
end process;

end fsm_tb_arc;
