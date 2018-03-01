library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g10_MAC	is
	port (x : in std_logic_vector(9 downto 0) ; --first input
			y : in std_logic_vector(9 downto 0) ; -- second input
			N : in std_logic_vector(9 downto 0) ; -- total number of inputs 
			clk : in std_logic; -- clock
			rst : in std_logic; -- asynchronous active−high	reset
			mac : out std_logic_vector(20 downto 0) ; -- output of MAC unit. This is found using formulas on slide 13 of lab
			ready : out std_logic); -- denotes the validity of the mac signal
end g10_MAC;


architecture MAC of g10_MAC is
signal acc : std_logic_vector(20 downto 0);
signal counter : std_logic_vector(9 downto 0);
begin
	process(clk)
		variable counter :
			integer range 0 to 1000;
	begin
		--counter := to_integer(unsigned(N));
		counter := 1000;
		for idx in 0 to counter loop
			if rising_edge(clk) then
				if rst = '1' then
					acc <= (others => '0');
				else
					acc <= std_logic_vector(signed(acc) + signed(x) * signed(y));
				end if;
			end if;
		end loop;
	end process;
	ready <= '1';
	mac <= acc;
end MAC;