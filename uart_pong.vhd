library ieee;
use ieee.std_logic_1164.all;


entity uart_pong is
	port(
			--Inputs
			clk: 		 in std_logic;
			rxReady:  in std_logic;
			rxData: 	 in std_logic_vector (7 downto 0);
			--Outputs
			paddle1Y: out Integer range 127 downto 0;
			paddle2Y: out Integer range 127 downto 0 );
end entity;

architecture arc of uart_pong is

	signal pad1Y: Integer  range 127 downto 0 := 0;
	signal pad2Y: Integer  range 127 downto 0 := 0;

begin
	
	process(clk) is
		variable buff: Integer range 255 downto 0 := 0;

	
	begin
		if rising_edge(clk) then
		
			if rxReady = '1' then
				--transform bit string in integer
				buff := 0;
				for i in 6 downto 0 loop
					if (rxData(i) = '1') then
						buff := buff + (2**i);
					end if;
				end loop;
			
				if(rxData(7) = '0') then --ID = paddle 1
					pad1Y <= buff;
				else -- ID = paddle 2
					pad2Y <= buff;
				end if;
			
			end if;
		
		end if;
	end process;

	paddle1Y <= pad1Y;
	paddle2Y <= pad2Y;

end architecture;