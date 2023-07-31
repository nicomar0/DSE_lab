LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity CselA_16bit_tb is
end CselA_16bit_tb;

architecture tb_RCA of CselA_16bit_tb is
component CselA_16bit_whole
PORT (SW : in std_logic_vector(31 downto 0);
KEY : in std_logic_vector(1 downto 0);
OVF : out std_logic;
Sum_res : out std_logic_vector(15 downto 0));
end component;
signal A, B, SUM_AB: std_logic_vector(15 downto 0);
signal A_signed, B_signed, SUM_AB_signed : signed(15 downto 0);
signal CLK, RST : std_logic; -- key(1) clk, key(2) reset
signal OVF_tb : std_logic;
begin
SUM_AB_signed<=signed(SUM_AB);
A_signed<=signed(A);
B_signed<=signed(B);
DUT : CselA_16bit_whole 
		port map( SW(31 downto 16)=>B, SW(15 downto 0)=>A, 
					KEY(1)=>CLK, KEY(0)=>RST, OVF=>OVF_tb,Sum_res=>SUM_AB);
process
	begin
	A<= x"0000";
	B<= x"0000";
	CLK<='1';
	RST<='1';
	
	wait for 10 ms;
	RST<='0';
	wait for 10 ms;
	RST<='1';
	wait for 10 ms;
	
	A<= x"1001"; --  ....
	B<= x"0101"; --   257 = 1102
	
	wait for 20 ms;
	clk<='0';
	wait for 5 ms;
	clk<='1';
	wait for 5 ms;
	clk<='0';
	wait for 5 ms;
	clk<='1';
	wait for 20 ms;
	
	A<= x"8000";
	B<= x"8001";
	
	wait for 20 ms;
	clk<='0';
	wait for 5 ms;
	clk<='1';
	wait for 5 ms;
	clk<='0';
	wait for 5 ms;
	clk<='1';
	wait for 20 ms;
	
	-- overflow case, result (1001)
	A<= x"0101"; --  5
	B<= x"0100"; --  4 =  1001 
	
	wait for 20 ms;
	clk<='0';
	wait for 5 ms;
	clk<='1';
	wait for 5 ms;
	clk<='0';
	wait for 5 ms;
	clk<='1';
	wait for 20 ms;
	
	A<= x"1100"; --  -4
	B<= x"1111"; --  -1  =1011
	
	wait for 20 ms;
	clk<='0';
	wait for 5 ms;
	clk<='1';
	wait for 5 ms;
	clk<='0';
	wait for 5 ms;
	clk<='1';
	wait for 20 ms;
	
	-- overflow case, result (0011)
	A<= x"1001"; --  -7
	B<= x"1010"; --  -6 
	
	wait for 20 ms;
	clk<='0';
	wait for 5 ms;
	clk<='1';
	wait for 5 ms;
	clk<='0';
	wait for 5 ms;
	clk<='1';
	wait for 20 ms;
	
	A<= x"0011"; --  3
	B<= x"0100"; --  4 = 0111
	
	wait for 20 ms;
	clk<='0';
	wait for 5 ms;
	clk<='1';
	wait for 5 ms;
	clk<='0';
	wait for 5 ms;
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
