LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

entity tb_counter is
end tb_counter;

architecture tb_counter_arc of tb_counter is

component Counter
port( EN, CK, CLC : in std_logic;
Q : inout unsigned(15 downto 0)
);
end component;

signal EN_mid, CK_mid, CLC_mid: std_logic;
signal Q_mid : unsigned(15 downto 0);

begin
DUT : Counter port map(EN => EN_mid, CK => CK_mid , CLC => CLC_mid, Q => Q_mid);
process
begin







    CK_mid <= '0';
	CLC_mid <= '0';
	EN_mid <= '1';
	wait for 5 ms;
	CK_mid <= '1';
	CLC_mid <= '1';
	wait for 5 ms;
	CK_mid <= '0';
	wait for 5 ms;
	CK_mid <= '1';
	wait for 5 ms;
	CK_mid <= '0';
	--EN_mid <= '0';
	wait for 5 ms;
	CK_mid <= '1';
	wait for 5 ms;
	CK_mid <= '0';
	wait for 5 ms;
	CK_mid <= '1';
	wait for 5 ms;
	CK_mid <= '0';
	wait for 5 ms;
	CK_mid <= '1';
	CLC_mid <= '0';
	wait for 5 ms;
	CK_mid <= '0';
	--EN_mid <= '1';
	CLC_mid <='1';
	wait for 5 ms;
	CK_mid <= '1';
	wait for 5 ms;
	CK_mid <= '0';
	wait for 5 ms;
wait;
end process;
end tb_counter_arc;