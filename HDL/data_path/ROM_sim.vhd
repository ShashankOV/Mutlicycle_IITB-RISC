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
begin
	data_out <= (others => '0');
end architecture;