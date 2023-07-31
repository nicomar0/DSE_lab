LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity CSA_4bit_module is
PORT( ain_mod, bin_mod : in std_logic_vector(3 downto 0);
	  c_in_module : in std_logic;
	  sout_mod :  out std_logic_vector(3 downto 0);
	  c_out_module : out std_logic);
end CSA_4bit_module;

architecture structural of CSA_4bit_module is
component mux
PORT (inMUX0, inMUX1: IN STD_LOGIC;
s : IN std_logic;
z : OUT STD_LOGIC);
end component;
component block_4adders is
PORT ( Ain, Bin :  in std_logic_vector(3 downto 0);
Cin_block : in std_logic;
Sum : out std_logic_vector(3 downto 0);
Cout_block :  out  std_logic);
end component;
signal sum_0c, sum_1c : std_logic_vector(3 downto 0);
signal carry_0c, carry_1c : std_logic;
begin
C0 : block_4adders PORT map(ain_mod, bin_mod,'0', sum_0c, carry_0c);
C1 : block_4adders port map(ain_mod, bin_mod,'1', sum_1c, carry_1c);

-- 4 bit multiplexer
MUX0 : mux port map(sum_0c(0), sum_1c(0),c_in_module, sout_mod(0));
MUX1 : mux port map(sum_0c(1), sum_1c(1),c_in_module, sout_mod(1));
MUX2 : mux port map(sum_0c(2), sum_1c(2),c_in_module, sout_mod(2));
MUX3 : mux port map(sum_0c(3), sum_1c(3),c_in_module, sout_mod(3));
MUXC : mux port map(carry_0c, carry_1c, c_in_module, c_out_module);

end structural;
