LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- 8 bit Carry skip adder

entity CSA_unit is
port(a_csa, b_csa : in std_logic_vector(7 downto 0);
     c0_csa : in std_logic;
     c_csa : out std_logic;
	 s_csa : out std_logic_vector(7 downto 0));
end CSA_unit;

architecture csa_unit_arc of CSA_unit is

component unitBlock is
port( a_UB, b_UB : in std_logic_vector(3 downto 0);
      s_UB : out std_logic_vector(4 downto 0);
	  c0_UB : in std_logic);
end component;

component mux is 
PORT (inMUX0, inMUX1: IN STD_LOGIC;
s : IN std_logic;
z : OUT STD_LOGIC);
end component;

signal p : std_logic_vector(7 downto 0);
signal s_mid : std_logic_vector(1 downto 0);
signal c_mid : std_logic_vector(2 downto 0);

begin

p <= a_csa and b_csa;
s_mid <= (p(7) and p(6) and p(5) and p(4)) & (p(3) and p(2) and p(1) and p(0));

UB0 : unitBlock port map(a_UB => a_csa(3 downto 0), b_UB => b_csa(3 downto 0), c0_UB => c0_csa, s_UB(3 downto 0) => s_csa(3 downto 0), s_UB(4) => c_mid(0));
UB1 : unitBlock port map(a_UB => a_csa(7 downto 4), b_UB => b_csa(7 downto 4), c0_UB => c_mid(1), s_UB(3 downto 0) => s_csa(7 downto 4), s_UB(4) => c_mid(2));

M0 : mux port map(inMUX0 => c_mid(0), inMUX1 => c0_csa, s => s_mid(0), z => c_mid(1)); 
M1 : mux port map(inMUX0 => c_mid(2), inMUX1 => c_mid(1), s => s_mid(1), z => c_csa);

end csa_unit_arc;


