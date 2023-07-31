LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity RCA_4bit_whole is
PORT (SW : in std_logic_vector(8 downto 0);
KEY : in std_logic_vector(1 downto 0); 
LEDR : out std_logic_vector (9 downto 9);
HEX0, HEX1, HEX2 : out std_logic_vector(0 to 6));
end RCA_4bit_whole;

architecture structural of RCA_4bit_whole is
component regn
	GENERIC ( N : integer:=4);
	PORT (R : IN SIGNED(N-1 DOWNTO 0);
Clock, Resetn : IN STD_LOGIC;
Q : OUT SIGNED(N-1 DOWNTO 0));
END component;

component flipflop
PORT (D, Clock, Resetn : IN STD_LOGIC;
Q : OUT STD_LOGIC);
END component;

component signed4bit_adder
PORT (Ain,Bin : in signed(3 downto 0);
Cin : in std_logic;
Sum : out signed(3 downto 0);
Cout : out std_logic);
end component;

component overflow_check
PORT( MSB_sum, sA,sB: in std_logic;
	  overfl : out std_logic);
end component;
component decoder7_hex
PORT (Cin : IN STD_LOGIC_VECTOR(3 downto 0);
	segment7: OUT std_logic_vector(0 to 6));
end component;

component subtractor 

PORT ( S : in std_logic;
B_sub_in : in signed (3 downto 0); 
B_sub_out : out signed(3 downto 0));
end component;


signal A, B_in, B_out ,S, S_out : signed(3 downto 0);
signal Carry_out, check_res ,OVF: std_logic;
begin
LEDR(9) <= OVF; 
RegA : regn PORT MAP(signed(SW(3 downto 0)), KEY(1), KEY(0), A);
RegB : regn PORT MAP(signed(SW(7 downto 4)), KEY(1), KEY(0), B_in);
SUB : subtractor PORT MAP (SW(8),B_in,B_out);
ADD: signed4bit_adder port map(A, B_out,'0', S, Carry_out);
CEK: overflow_check port map (std_logic(S(3)),std_logic(A(3)), std_logic(B_out(3)),check_res);
FF : flipflop port map(check_res, KEY(1), KEY(0), OVF);
RegS : regn PORT MAP(S,KEY(1), KEY(0), S_out);
DCDA : decoder7_hex port map(SW(3 downto 0), HEX2);
DCDB : decoder7_hex port map(SW(7 downto 4), HEX1);
DCDSum : decoder7_hex port map (std_logic_vector(S_out), HEX0);

end structural;
