LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity RCA_16bit_whole is
PORT (SW : in std_logic_vector(31 downto 0);
KEY : in std_logic_vector(1 downto 0);
OVF : out std_logic);
end RCA_16bit_whole;

architecture structural of RCA_16bit_whole is
component regn
	GENERIC ( N : integer:=16);
	PORT (R : IN SIGNED(15 DOWNTO 0);
Clock, Resetn : IN STD_LOGIC;
Q : OUT SIGNED(15 DOWNTO 0));
END component;

component flipflop
PORT (D, Clock, Resetn : IN STD_LOGIC;
Q : OUT STD_LOGIC);
END component;

component signed_16bit_adder
PORT (Ain,Bin : in signed(15 downto 0);
Cin : in std_logic;
Sum : out signed(15 downto 0);
Cout : out std_logic);
end component;

component overflow_check
PORT( MSB_sum, sA,sB: in std_logic;
	  overfl : out std_logic);
end component;


signal A, B, S, S_out : signed(15 downto 0);
signal Carry_out, check_res : std_logic;
begin
RegA : regn PORT MAP(signed(SW(31 downto 16)), KEY(1), KEY(0), A);
RegB : regn PORT MAP(signed(SW(15 downto 0)), KEY(1), KEY(0), B);
ADD: signed_16bit_adder port map(A, B,'0', S, Carry_out);
CEK: overflow_check port map (std_logic(S(15)),std_logic(A(15)), std_logic(B(15)),check_res);
FF : flipflop port map(check_res, KEY(1), KEY(0), OVF);
RegS : regn PORT MAP(S,KEY(1), KEY(0), S_out);


end structural;