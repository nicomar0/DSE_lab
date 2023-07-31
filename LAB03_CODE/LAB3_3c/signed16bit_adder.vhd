LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity signed16bit_adder is
PORT (Ain : in signed(15 downto 0);
Bin : in signed(15 downto 0);
Cin : in std_logic;
Sum : out signed(15 downto 0);
Cout : out std_logic);
end signed16bit_adder;
 
architecture structural of signed16bit_adder is

component CSA_4bit_module
PORT( ain_mod, bin_mod : in std_logic_vector(3 downto 0);
	  c_in_module : in std_logic;
	  sout_mod :  out std_logic_vector(3 downto 0);
	  c_out_module :  out std_logic);
end component;

signal c01, c12, c23: std_logic;
signal Ain_tmp, Bin_tmp,sum_tmp : std_logic_vector(15 downto 0);
begin

Sum <= signed(sum_tmp);
Ain_tmp<=std_logic_vector(Ain);
Bin_tmp<=std_logic_vector(Bin);
B03 : CSA_4bit_module port map (Ain_tmp(3 downto 0), Bin_tmp(3 downto 0), Cin, Sum_tmp(3 downto 0), c01);
B47 : CSA_4bit_module port map (Ain_tmp(7 downto 4), Bin_tmp(7 downto 4), c01, Sum_tmp(7 downto 4), c12);
B811 : CSA_4bit_module port map (Ain_tmp(11 downto 8), Bin_tmp(11 downto 8), c12, Sum_tmp(11 downto 8), c23);
B1215 : CSA_4bit_module port map (Ain_tmp(15 downto 12), Bin_tmp(15 downto 12), c23, Sum_tmp(15 downto 12), Cout);
end structural;