LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity part2_whole_tb is
end part2_whole_tb;

architecture part2_whole_tb_arch of part2_whole_tb is
component part2_whole
port(KEY : in std_logic_vector(0 downto 0);
SW : in std_logic_vector(1 downto 0);
HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(6 downto 0));
end component;
signal en, clc: std_logic;
signal clk : std_logic_vector(0 downto 0);
signal H0, H1, H2, H3: std_logic_vector(0 to 6);
begin
DUT : part2_whole port map (KEY=>clk, SW(1)=>en, SW(0)=>clc,HEX0=>H0, HEX1=>H1, HEX2=>H2, HEX3=>H3 );
process
begin
	en<='1';
	clc<='0';
	clk(0)<='0';
	wait for 5 ms;
	clk(0)<='1';
	clc<='1';
	wait for 5 ms;
	clk(0)<='0';
	wait for 5 ms;
	clk(0)<='1';
	wait for 5 ms;
	clk(0)<='0';
	wait for 5 ms;
	clk(0)<='1';
	wait for 5 ms;
	clk(0)<='0';
	wait for 5 ms;
	clk(0)<='1';
	wait for 5 ms;
	clk(0)<='0';
	wait for 5 ms;
	clk(0)<='1';
	wait for 5 ms;
	clk(0)<='0';
	wait for 5 ms;
	clk(0)<='1';
	wait for 5 ms;
	clk(0)<='0';
	wait for 5 ms;
	clk(0)<='1';
	wait for 5 ms;
	clk(0)<='0';
	wait for 5 ms;
	clk(0)<='1';
	wait for 5 ms;
	
	en<='0';
	clk(0)<='0';
	wait for 5 ms;
	clk(0)<='1';
	wait for 5 ms;
	clk(0)<='0';
	clc<='0';
	wait for 5 ms;
	clk(0)<='1';
	wait for 5 ms;
	wait;
end process;
end part2_whole_tb_arch;
