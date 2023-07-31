LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity block_TFF is
port( EN, CK, CLC : in std_logic;
Q : inout std_logic;
OUTand : out std_logic);
end block_TFF;

architecture block_TFF_arch of block_TFF is
component T_FF
port(T, CK, RST: in std_logic;
Q : inout std_logic);
end component;
begin
TFF :  T_FF port map(EN, CK, CLC, Q);
OUTand<=(Q and EN);
end block_TFF_arch;