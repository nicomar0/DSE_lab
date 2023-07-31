LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity RCA_16bit_tb is
end RCA_16bit_tb;

architecture tb_RCA of RCA_16bit_tb is
component RCA_16bit_whole
PORT (SW : in std_logic_vector(31 downto 0);
KEY : in std_logic_vector(1 downto 0);
OVF : out std_logic);
end component;
signal A, B : std_logic_vector(15 downto 0);
signal CLK, RST : std_logic; -- key(1) clk, key(2) reset
signal OVF_tb : std_logic;
begin
DUT : RCA_16bit_whole
		port map( SW(31 downto 16)=>B, SW(15 downto 0)=>A,
					KEY(1)=>CLK, KEY(0)=>RST, OVF=>OVF_tb);
process
	begin
	A<="0000000000000000";
	B<="0000000000000000";
	CLK<='1';
	RST<='1';

	wait for 10 ms;
	RST<='0';
	wait for 10 ms;
	RST<='1';
	wait for 10 ms;

	A<="0000000000000001";
	B<="1111111111111111";

	wait for 20 ms;
	clk<='0';
	wait for 10 ms;
	clk<='1';
	wait for 20 ms;

	clk<='0';
	wait for 10 ms;
	clk<='1';
	wait for 20 ms;


	A<="0111111111111111"; --   1
	B<="0000000000000001"; --  32767 overflow

	wait for 20 ms;
	clk<='0';
	wait for 10 ms;
	clk<='1';

	wait for 10 ms;
	clk<='0';
	wait for 10 ms;
	clk<='1';
	wait for 20 ms;

	-- overflow case
	A<="0110101101100001"; --  27489
	B<="0010010011011111"; --   9439


	wait for 20 ms;
	clk<='0';
	wait for 10 ms;
	clk<='1';
	wait for 10 ms;

	clk<='0';
	wait for 10 ms;
	clk<='1';
	wait for 20 ms;

	-- overflow case

	A<="1111111110011100"; --  -100
	B<="1111111100111000"; --  -200 -> -300 = 1111111011010100

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
