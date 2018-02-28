library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gNN_MAC	is
port (x : in std_logic_vector(9 downto 0) ; --first input
      y : in std_logic_vector(9 downto 0) ; -- second input
      N : in std_logic_vector(9 downto 0) ; -- t o t a l number of inputs 
		clk : in std_logic; -- clock
		rst : in std_logic; -- asynchronous active−high	r e s e t
		mac : in std_logic_vector(9 downto 0) ; -- ?? output of MAC unit 
		ready : in std_logic); -- denotes the v a l i d i t y of the mac s i g n a l
end gNN_MAC;


architecture MAC of gNN_MAX is
signal acc : std_logic_vector(9 downto 0);

begin
	N <= "1111101000" --1000
	process(clk)
	begin
		while(N != '0000000000') loop
		if rising_edge(clk) then
			if rst = '1' then
				acc <= (others => '0')
			else
				acc <= std_logic_vector(unsigned (acc) + unsigned(x) * unsigned(y));
			end if;
			N <= N - 1;
		end if;
		end loop;
	end process;
	ready <= '1'
	mac <= acc;
end MAC;