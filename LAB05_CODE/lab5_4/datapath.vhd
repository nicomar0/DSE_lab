LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity datapath is
port(
rst : in std_logic;
clk, ld : in std_logic;
EN_reg : in std_logic_vector (5 downto 0);
HEXX0,HEXX1,HEXX2,HEXX3,HEXX4, HEXX5 : out std_logic_vector (0 to 6);
trig : out std_logic
);
end datapath;

architecture datapath_arch of datapath is
signal H,E,L,O : std_logic_vector (2 downto 0);


component regn
GENERIC ( N : integer := 3);
PORT (R : IN std_logic_vector(N-1 DOWNTO 0);
Clock, Resetn, EN : IN STD_LOGIC;
Q : OUT std_logic_vector(N-1 DOWNTO 0));
END component;

component mux_3bit
PORT(IN_0,IN_1 : in std_logic_vector(2 downto 0);
sel : in std_logic;
out_mux : out std_logic_vector (2 downto 0));
end component;

component decoder7
PORT (Cin : IN STD_LOGIC_VECTOR(2 downto 0);
Display: OUT std_logic_vector(0 to 6));
end component;

component counter50M
port( EN, CK, CLC : in std_logic;
START : out std_logic);
end component;

signal in_reg4, in_reg3, in_reg2, in_reg1, in_reg0 : std_logic_vector(2 downto 0);
signal out_reg5, out_reg4, out_reg3, out_reg2, out_reg1, out_reg0 : std_logic_vector(2 downto 0);


begin

COUNT : counter50M port map('1',clk,rst,trig);

H <= "110";
E <= "001";
L <= "010";
O <= "011";


REG5 : regn port map(out_reg4,clk,rst,EN_reg(5),out_reg5);
REG4 : regn port map(in_reg4,clk,rst,EN_reg(4),out_reg4);
REG3 : regn port map(in_reg3,clk,rst,EN_reg(3),out_reg3);
REG2 : regn port map(in_reg2,clk,rst,EN_reg(2),out_reg2);
REG1 : regn port map(in_reg1,clk,rst,EN_reg(1),out_reg1);
REG0 : regn port map(in_reg0,clk,rst,EN_reg(0),out_reg0);


MUX4 : mux_3bit port map(out_reg3, H, ld, in_reg4);
MUX3 : mux_3bit port map(out_reg2, E, ld, in_reg3);
MUX2 : mux_3bit port map(out_reg1, L, ld, in_reg2);
MUX1 : mux_3bit port map(out_reg0, L, ld, in_reg1);
MUX0 : mux_3bit port map(out_reg5, O, ld, in_reg0);

DEC5 : decoder7 port map(out_reg5, HEXX5);
DEC4 : decoder7 port map(out_reg4, HEXX4);
DEC3 : decoder7 port map(out_reg3, HEXX3);
DEC2 : decoder7 port map(out_reg2, HEXX2);
DEC1 : decoder7 port map(out_reg1, HEXX1);
DEC0 : decoder7 port map(out_reg0, HEXX0);



end datapath_arch;
