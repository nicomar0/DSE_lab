LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
ENTITY converter IS
PORT ( SW : IN UNSIGNED(3 DOWNTO 0);
m : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
z : inout STD_LOGIC);
END converter;

architecture structural of converter is
component mux is
PORT ( s: IN std_logic;
	input: IN std_logic_vector(1 downto 0);
	output: out std_logic);
end component;

component circuitA is
PORT (v: IN UNSigned(2 downto 0);
	q: OUT std_logic_vector(2 downto 0));
end component;

component comparator  is
Port(Vin : in unsigned (3 downto 0);
	greater : out std_logic);
end component;

component circuitB is
PORT (z : IN STD_logic;
	display : OUT std_logic_vector(0 to 6));
end component;

component decoder7 is
	PORT (c : IN STD_LOGIC_VECTOR(3 downto 0);
	Display: OUT std_logic_vector(0 to 6));
end component;
signal cA: std_logic_vector(2 downto 0);
begin
COMP : comparator PORT MAP(SW,z);
CirA : circuitA PORT MAP(SW(2 downto 0), cA(2 downto 0));
MUX3 : mux PORT MAP(input(1)=>'0', input(0)=>std_logic(SW(3)),s=>z, output=>m(3));
MUX2 : mux PORT MAP(input(1)=>cA(2), input(0)=>std_logic(SW(2)),s=>z,output=>m(2));
MUX1 : mux PORT MAP(input(1)=>cA(1), input(0)=>std_logic(SW(1)),s=>z,output=>m(1));
MUX0 : mux PORT MAP(input(1)=>cA(0), input(0)=>std_logic(SW(0)),s=>z,output=>m(0));

end structural;
