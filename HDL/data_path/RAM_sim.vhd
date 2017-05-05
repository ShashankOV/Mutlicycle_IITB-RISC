library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

library work;
use work.basic.all;

entity RAM_SIM is
	generic(
		word_length: integer := 16;
		num_words: integer := 65536);
		
	port(
		data_in: in std_logic_vector(word_length-1 downto 0);
		data_out : out std_logic_vector(word_length-1 downto 0);
		address: in std_logic_vector(integer(ceil(log2(real(num_words))))-1 downto 0);
		clk, wr_ena, rd_ena, reset: in std_logic);
		
end entity;

architecture struct of RAM_SIM is
begin
	data_out <= (others => '0');	
end architecture;