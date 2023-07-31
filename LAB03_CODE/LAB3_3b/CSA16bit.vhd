LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity CSA16bit is
port(a, b : in signed(15 downto 0);
     c0 : in std_logic;
     c : out std_logic;
	 s : out signed(15 downto 0));
end CSA16bit; 


architecture CSA16bit_arc of CSA16bit is

component CSA_unit is 
port(a_csa, b_csa : in std_logic_vector(7 downto 0);
     c0_csa : in std_logic;
     c_csa : out std_logic;
	 s_csa : out std_logic_vector(7 downto 0));
end component;


signal c_mid : std_logic;
signal a_mid, b_mid, s_mid : std_logic_vector(15 downto 0);


begin

a_mid <= std_logic_vector(a);
b_mid <= std_logic_vector(b);
s <= signed(s_mid);


CSA_unit0 : CSA_unit port map(a_csa => a_mid(7 downto 0), b_csa => b_mid(7 downto 0), c0_csa => c0, c_csa => c_mid, s_csa => s_mid(7 downto 0));
CSA_unit1 : CSA_unit port map(a_csa => a_mid(15 downto 8), b_csa => b_mid(15 downto 8), c0_csa => c_mid, c_csa => c, s_csa => s_mid(15 downto 8));

end CSA16bit_arc;