LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity fsm is
port(RST : in std_logic;
     CLK : in std_logic;
     w : in std_logic;
	 z : out std_logic);
end fsm;

architecture fsm_arc of fsm is

signal A_in, B_in, C_in, D_in, E_in, F_in, G_in, H_in, I_in : std_logic;
signal A_out, B_out, C_out, D_out, E_out, F_out, G_out, H_out, I_out : std_logic;
signal FF_RST : std_logic;

component flipflop
PORT (D, Clock, Resetn : IN STD_LOGIC;
Q : OUT STD_LOGIC);
end component; 
begin


A_in <= (B_out OR C_out OR D_out or E_out or F_out or G_out or H_out or I_out) and RST;
B_in <= (not(A_out) or F_out or G_out or H_out or I_out) and not(w) and RST;
C_in <= B_out and not(w) and RST;
D_in <= C_out and not(w) and RST; 
E_in <= (E_out or D_out) and not(w) and RST;
F_in <= (not(A_out) or B_out or C_out or D_out or E_out) and w and RST;
G_in <= F_out and w and RST;
H_in <= G_out and w and RST;
I_in <= (I_out or H_out) and w and RST;

FF_RST <= '1';

FFA : flipflop port map(A_in, CLK, FF_RST, A_out);
FFB : flipflop port map(B_in, CLK, FF_RST, B_out);
FFC : flipflop port map(C_in, CLK, FF_RST, C_out);
FFD : flipflop port map(D_in, CLK, FF_RST, D_out);
FFE : flipflop port map(E_in, CLK, FF_RST, E_out);
FFF : flipflop port map(F_in, CLK, FF_RST, F_out);
FFG : flipflop port map(G_in, CLK, FF_RST, G_out);
FFH : flipflop port map(H_in, CLK, FF_RST, H_out);
FFI : flipflop port map(I_in, CLK, FF_RST, I_out);

z <= (E_out or I_out) and A_out;

end fsm_arc;
