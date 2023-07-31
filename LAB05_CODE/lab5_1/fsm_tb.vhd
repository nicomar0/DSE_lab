LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity fsm_tb is
end fsm_tb;


architecture fsm_tb_arc of fsm_tb is
signal CLK, RST, w, z : std_logic;

component fsm_wrapper
port(SW : in std_logic_vector(1 downto 0);
     KEY : in std_logic_vector (0 downto 0);
	 LEDR : out std_logic_vector(0 downto 0));
end component;

begin

DUT : fsm_wrapper port map(SW(1) => w, SW(0) => RST, KEY(0) => CLK, LEDR(0) => z);

process
begin
CLK <= '1';
wait for 1 ms;
CLK <= '0';
wait for 1 ms;
end process;

process
begin
RST <= '0';
w<='1';
wait for 20 ms;
RST <= '1';
w <= '0';
wait for 100 ms;
w <= '1';
wait for 20 ms; 
w <= '0';
wait for 20 ms;
w <= '1';
wait for 20 ms;
RST<='0';
wait for 20 ms;
wait;
end process;

end fsm_tb_arc;