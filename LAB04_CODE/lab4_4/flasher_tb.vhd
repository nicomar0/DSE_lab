LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

entity flasher_tb is
end flasher_tb;

architecture flasher_tb_arc of flasher_tb is

component flasher
PORT ( CLOCK_50 : IN std_logic;
SW: IN std_logic_vector(0 downto 0);
KEY : IN std_logic_vector(0 downto 0); 
HEX0: OUT std_logic_vector(0 to 6));
END component;

signal CLOCK_50_mid: std_logic;
signal SW_mid, KEY_mid : std_logic_vector (0 downto 0);
signal HEX0_mid : std_logic_vector(0 to 6);

begin
DUT : flasher port map (CLOCK_50 => CLOCK_50_mid, SW(0) => SW_mid(0), KEY(0) => KEY_mid(0), HEX0 => HEX0_mid);

process  -- clk 
begin

CLOCK_50_mid <= '0';

wait for 10 ns;

CLOCK_50_mid <= '1';

wait for 10 ns;
end process;

process
begin

 SW_mid(0) <= '1';
 
 wait for 100 ns;
 
 KEY_mid(0) <= '0';
 
 wait for 100 ns;

 KEY_mid(0) <= '1';

wait for 100 ns;
wait;
end process;
end flasher_tb_arc;