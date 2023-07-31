LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity part3_tb is
end part3_tb;


architecture part3_arc of part3_tb is
signal CLK, RST, w, z : std_logic;

component part3
port(KEY : in std_logic_vector (0 downto 0);
SW : in std_logic_vector (1 downto 0);
LEDR : out std_logic_vector (0 downto 0));
end component;

begin

DUT : part3 port map(KEY(0) => CLK,SW(1) => w, SW(0) => RST,  LEDR(0) => z);

process
begin
CLK <= '1';
wait for 2 ms;
CLK <= '0';
wait for 2 ms;
end process;

process
begin
RST <= '0';
w<='1';
wait for 20 ms;
RST <= '1';
w <= '0';
wait for 80 ms;
w <= '1';
wait for 20 ms; 
w <= '0';
wait for 20 ms;
w <= '1';
wait for 20 ms;
RST <='0';
wait;
end process;

end part3_arc;
