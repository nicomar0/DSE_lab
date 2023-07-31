LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Multiplier is 
port (a, b: in std_logic_vector(3 downto 0);
       p: out std_logic_vector(7 downto 0));
end Multiplier;


architecture Multiplier_arc of Multiplier is 

component Unitblock is
port ( a_UB, b_UB : in std_logic_vector(3 downto 0);
       s_UB : out std_logic_vector(4 downto 0));
end component;


signal s_mid : std_logic_vector(7 downto 0);
signal a_mid : std_logic_vector(3 downto 0);
signal b_mid : std_logic_vector(11 downto 0);

begin

a_mid(0) <= a(0) AND b(0);
a_mid(1) <= a(1) AND b(0);
a_mid(2) <= a(2) AND b(0);
a_mid(3) <= a(3) AND b(0);

b_mid(0) <= a(0) AND b(1);
b_mid(1) <= a(1) AND b(1);
b_mid(2) <= a(2) AND b(1);
b_mid(3) <= a(3) AND b(1);

b_mid(4) <= a(0) AND b(2);
b_mid(5) <= a(1) AND b(2);
b_mid(6) <= a(2) AND b(2);
b_mid(7) <= a(3) AND b(2);

b_mid(8) <= a(0) AND b(3);
b_mid(9) <= a(1) AND b(3);
b_mid(10) <= a(2) AND b(3);
b_mid(11) <= a(3) AND b(3);


p(0) <= a_mid(0);

UB0 : Unitblock port map(a_UB(3) => '0', a_UB(2) => a_mid(3), a_UB(1) => a_mid(2), a_UB(0) => a_mid(1),
                         b_UB(3) => b_mid(3), b_UB(2) => b_mid(2), b_UB(1) => b_mid(1), b_UB(0) => b_mid(0),
			 s_UB(4) => s_mid(3), s_UB(3) => s_mid(2), s_UB(2) => s_mid(1), s_UB(1) => s_mid(0), s_UB(0) => p(1)
			);
						 
UB1 : Unitblock port map(a_UB(3) => s_mid(3), a_UB(2) => s_mid(2), a_UB(1) => s_mid(1), a_UB(0) => s_mid(0),
                         b_UB(3) => b_mid(7), b_UB(2) => b_mid(6), b_UB(1) => b_mid(5), b_UB(0) => b_mid(4),
                         s_UB(4) => s_mid(7), s_UB(3) => s_mid(6), s_UB(2) => s_mid(5), s_UB(1) => s_mid(4), s_UB(0) => p(2)
                         );

						 
UB2 : Unitblock port map(a_UB(3) => s_mid(7), a_UB(2) => s_mid(6), a_UB(1) => s_mid(5), a_UB(0) => s_mid(4),
                         b_UB(3) => b_mid(11), b_UB(2) => b_mid(10), b_UB(1) => b_mid(9), b_UB(0) => b_mid(8),
                         s_UB(4) => p(7), s_UB(3) => p(6), s_UB(2) => p(5), s_UB(1) => p(4), s_UB(0) => p(3)		                   
                         );

end Multiplier_arc;



