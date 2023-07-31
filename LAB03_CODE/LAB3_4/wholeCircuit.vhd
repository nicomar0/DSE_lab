LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity WholeCircuit is
port(signal SW : in std_logic_vector(7 downto 0); -- a : sw3 -> sw0, b: sw7 -> sw 4 
     signal HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(0 to 6));
end WholeCircuit;


architecture WholeCircuit_arc of WholeCircuit is

component Multiplier is
port(a, b: in std_logic_vector(3 downto 0);
      p: out std_logic_vector(7 downto 0));
end component;

component Decoder7_hex is
port(Cin : in std_logic_vector(3 downto 0);
     segment7: out std_logic_vector(0 to 6));
end component;



signal inDec_mid : std_logic_vector(7 downto 0);

begin

M : Multiplier port map( a => SW(3 downto 0), b=> SW(7 downto 4),
                         p(7 downto 4) => inDec_mid(7 downto 4), p(3 downto 0) => inDec_mid(3 downto 0)
                        );

D0: Decoder7_hex port map(Cin => SW(3 downto 0), segment7 => HEX0); -- a
D1: Decoder7_hex port map(Cin => SW(7 downto 4), segment7 => HEX1); -- b
D2: Decoder7_hex port map(Cin => inDec_mid(3 downto 0), segment7 => HEX2); -- p0
D3: Decoder7_hex port map(Cin => inDec_mid(7 downto 4), segment7 => HEX3); -- p1

end WholeCircuit_arc;

