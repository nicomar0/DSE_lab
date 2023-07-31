LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity RCA_4bit_tb is
end RCA_4bit_tb;

architecture tb_RCA of RCA_4bit_tb is
component RCA_4bit_whole
PORT (SW : in std_logic_vector(7 downto 0);
KEY : in std_logic_vector(1 downto 0);
LEDR : out std_logic_vector (9 downto 9);
HEX0, HEX1, HEX2 : out std_logic_vector(6 downto 0));
end component;
signal A, B : std_logic_vector(3 downto 0);
signal CLK, RST : std_logic; -- key(1) clk, key(2) reset
signal OVF_tb : std_logic_vector(0 downto 0);
signal HEXX0, HEXX1, HEXX2: std_logic_vector(6 downto 0);
begin

DUT : RCA_4bit_whole 
		port map( SW(7 downto 4)=>B, SW(3 downto 0)=>A, 
					KEY(1)=>CLK, KEY(0)=>RST, ledr=>OVF_tb,
						HEX0=>HEXX0, HEX1=>HEXX1, HEX2=>HEXX2);
process
	begin
	A<="0000";
	B<="0000";
	CLK<='1';
	RST<='1';
	
	wait for 10 ms;
	RST<='0';
	wait for 10 ms;
	RST<='1';
	wait for 10 ms;
	
	A<="1001"; --  -7
	B<="0101"; --   5
	
	wait for 20 ms;
	clk<='0';
	wait for 10 ms;
	clk<='1';
	wait for 20 ms;
	
	A<="1100"; --  -4
	B<="0100"; --  4 = 1110
	
	wait for 20 ms;
	clk<='0';
	wait for 10 ms;
	clk<='1';
	wait for 20 ms;
	
	-- overflow case, result (1001)
	A<="0101"; --  5
	B<="0100"; --  4 =  1001 
	
	wait for 20 ms;
	clk<='0';
	wait for 10 ms;
	clk<='1';
	wait for 20 ms;
	
	A<="1100"; --  -4
	B<="1111"; --  -1  =1011
	
	wait for 20 ms;
	clk<='0';
	wait for 10 ms;
	clk<='1';
	wait for 20 ms;
	
	-- overflow case, result (0011)
	A<="1001"; --  -7
	B<="1010"; --  -6 
	
	wait for 20 ms;
	clk<='0';
	wait for 10 ms;
	clk<='1';
	wait for 20 ms;
	
	A<="0011"; --  3
	B<="0100"; --  4 = 0111
	
	wait for 20 ms;
	clk<='0';
	wait for 10 ms;
	clk<='1';
	wait for 20 ms;
	
	wait for 10 ms;
	RST<='0';
	wait for 10 ms;
	RST<='1';
	wait for 10 ms;
	
	wait;
end process;


end tb_RCA;
