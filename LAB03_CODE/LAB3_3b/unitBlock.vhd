LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity unitBlock is
port( a_UB, b_UB : in std_logic_vector(3 downto 0);
      s_UB : out std_logic_vector(4 downto 0);
	  c0_UB : in std_logic);
end unitBlock;


architecture unitBlock_arc of unitBlock is

component FullAdder is
port ( a_FA, b_FA, c_in : in std_logic;
       sum, c_out : out std_logic); 
 end component;
 
 signal c_mid : std_logic_vector(2 downto 0);
 
 begin
 
 -- The carry bit of the last FA is set to s_UB(4)
 
 FA0 : FullAdder port map(c_in => c0_UB, c_out => c_mid(0), sum => s_UB(0), a_FA => a_UB(0), b_FA => b_UB(0));
 FA1 : FullAdder port map(c_in => c_mid(0), c_out => c_mid(1), sum => s_UB(1), a_FA => a_UB(1), b_FA => b_UB(1));
 FA2 : FullAdder port map(c_in => c_mid(1), c_out => c_mid(2), sum => s_UB(2), a_FA => a_UB(2), b_FA => b_UB(2));
 FA3 : FullAdder port map(c_in => c_mid(2), c_out => s_UB(4), sum => s_UB(3), a_FA => a_UB(3), b_FA => b_UB(3));
 
 end unitBlock_arc;