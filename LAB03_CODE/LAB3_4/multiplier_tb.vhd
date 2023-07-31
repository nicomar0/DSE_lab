LIBRARY ieee;
USE ieee.std_logic_1164.all;


entity multiplier_tb is
end multiplier_tb;

architecture multiplier_tb_arc of multiplier_tb is

component wholeCircuit is 
port (SW : in std_logic_vector(7 downto 0);
      HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(6 downto 0));
end component;

signal A, B : std_logic_vector(3 downto 0);
signal HEXX0, HEXX1, HEXX2, HEXX3 : std_logic_vector(6 downto 0);

begin

DUT : wholeCircuit port map(SW(7 downto 4) => B, SW(3 downto 0) => A,
                            HEX0 => HEXX0, HEX1 => HEXX1, HEX2 => HEXX2, HEX3 => HEXX3
                            );

process
begin

A <= "1100"; -- 12
B <= "1011"; -- 11

wait for 10 ms;

A <= "1101"; -- 13
B <= "1000"; -- 8
             -- 104 -> 0110 1000 -> HEX : 68

wait for 10 ms;

A <= "1100"; -- 12
B <= "1110"; -- 14
             -- 168 -> 1010 1000 -> HEX : A8
wait for 10 ms;

wait;
end process;

end multiplier_tb_arc;

