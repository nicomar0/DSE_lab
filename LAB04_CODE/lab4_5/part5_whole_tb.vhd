LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

entity part5_whole_tb is
end part5_whole_tb;

architecture arch_tb of part5_whole_tb is
component part5_whole 
port(SW : in std_logic_vector(7 downto 0);
CLOCK_50 : in std_logic;
KEY : in std_logic_vector(3 downto 0);
HEX3, HEX2, HEX1, HEX0 : out std_logic_vector(0 to 6);
LEDR: out std_logic_vector(0 downto 0));
end component;

signal KEY0, KEY1, KEY2, KEY3, CLK, LEDR0: std_logic;
signal HEXX3, HEXX2, HEXX1, HEXX0 : std_logic_vector(6 downto 0); --occhio!
signal SWW : std_logic_vector(7 downto 0);

begin
KEY1<='1';
KEY2<='1';

DUT: part5_whole port map(SW=>SWW, CLOCK_50=>CLK, KEY(3)=>KEY3, KEY(2)=>KEY2, KEY(1)=>KEY1, KEY(0)=>KEY0, HEX3=>HEXX3, HEX2=>HEXX2, HEX1=>HEXX1, HEX0=>HEXX0, LEDR(0)=>LEDR0);

PROCESS
BEGIN 
 CLK <= '0';
WAIT FOR 10 ns; 
 CLK <= '1'; 
 WAIT FOR 10 ns; 
END PROCESS; 

PROCess
begin
wait for 2 ms;
KEY0<='0';
KEY3<='1';
SWW<= "00110010"; --50 ms
wait for 5 ms;
KEY0<='1';
wait for 235 ms;
KEY3<='0';
wait for 50ms;
KEY3<='1';
wait for 10 ms;
KEY0<='0';
wait for 5 ms;
wait;
end process;

end arch_tb;