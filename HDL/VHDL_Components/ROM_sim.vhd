library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM_SIM is
	generic(num_words: integer := 65536;
		word_length: integer := 16);
	port(
		address: in std_logic_vector(15 downto 0);
		data_out: out std_logic_vector(word_length-1 downto 0);
		rd_ena ,clk : in std_logic);
end entity;

architecture behave of ROM_SIM is
	type int_array is array (0 to num_words-1) of integer;
	signal memory: int_array := (others => 0);
begin

	process(rd_ena, address)
	begin
		data_out <= (others => 'Z');
		if(rd_ena = '1') then
			data_out <= std_logic_vector(to_unsigned(memory(to_integer(unsigned(address))),word_length));
		end if;
	end process;

	memory(0) <= 33392;
	memory(112) <= 13313;	memory(113) <= 38528;	memory(2048) <= 2976;	memory(2049) <= 8865;

end architecture;