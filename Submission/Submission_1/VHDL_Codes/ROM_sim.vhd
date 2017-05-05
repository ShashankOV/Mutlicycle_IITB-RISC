library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM_SIM is
	generic(num_words: integer := 256;
		word_length: integer := 16);
	port(
		address: in std_logic_vector(15 downto 0);
		data_out: out std_logic_vector(word_length-1 downto 0);
		rd_ena ,clk : in std_logic);
end entity;

architecture behave of ROM_SIM is
	type int_array is array (0 to num_words-1) of integer;
	signal data: std_logic_vector(word_length-1 downto 0);
	signal memory: int_array;
begin

	process(rd_ena, memory, address)
	begin
		data <= std_logic_vector(to_unsigned(memory(to_integer(unsigned(address))),word_length));
		data_out <= (others => 'Z');
		if(rd_ena = '1') then
				data_out <= data;
		end if;
	end process;

	memory(0) <= 0;
	memory(1) <= 0;	memory(2) <= 0;	memory(3) <= 0;	memory(4) <= 0;
	memory(5) <= 0;	memory(6) <= 0;	memory(7) <= 0;	memory(8) <= 0;
	memory(9) <= 0;	memory(10) <= 0;	memory(11) <= 0;	memory(12) <= 0;
	memory(13) <= 0;	memory(14) <= 0;	memory(15) <= 0;	memory(16) <= 0;
	memory(17) <= 0;	memory(18) <= 0;	memory(19) <= 0;	memory(20) <= 0;
	memory(21) <= 0;	memory(22) <= 0;	memory(23) <= 0;	memory(24) <= 0;
	memory(25) <= 0;	memory(26) <= 0;	memory(27) <= 0;	memory(28) <= 0;
	memory(29) <= 0;	memory(30) <= 0;	memory(31) <= 0;	memory(32) <= 0;
	memory(33) <= 0;	memory(34) <= 0;	memory(35) <= 0;	memory(36) <= 0;
	memory(37) <= 0;	memory(38) <= 0;	memory(39) <= 0;	memory(40) <= 0;
	memory(41) <= 0;	memory(42) <= 0;	memory(43) <= 0;	memory(44) <= 0;
	memory(45) <= 0;	memory(46) <= 0;	memory(47) <= 0;	memory(48) <= 0;
	memory(49) <= 0;	memory(50) <= 0;	memory(51) <= 0;	memory(52) <= 0;
	memory(53) <= 0;	memory(54) <= 0;	memory(55) <= 0;	memory(56) <= 0;
	memory(57) <= 0;	memory(58) <= 0;	memory(59) <= 0;	memory(60) <= 0;
	memory(61) <= 0;	memory(62) <= 0;	memory(63) <= 0;	memory(64) <= 0;
	memory(65) <= 0;	memory(66) <= 0;	memory(67) <= 0;	memory(68) <= 0;
	memory(69) <= 0;	memory(70) <= 0;	memory(71) <= 0;	memory(72) <= 0;
	memory(73) <= 0;	memory(74) <= 0;	memory(75) <= 0;	memory(76) <= 0;
	memory(77) <= 0;	memory(78) <= 0;	memory(79) <= 0;	memory(80) <= 0;
	memory(81) <= 0;	memory(82) <= 0;	memory(83) <= 0;	memory(84) <= 0;
	memory(85) <= 0;	memory(86) <= 0;	memory(87) <= 0;	memory(88) <= 0;
	memory(89) <= 0;	memory(90) <= 0;	memory(91) <= 0;	memory(92) <= 0;
	memory(93) <= 0;	memory(94) <= 0;	memory(95) <= 0;	memory(96) <= 0;
	memory(97) <= 0;	memory(98) <= 0;	memory(99) <= 0;	memory(100) <= 0;
	memory(101) <= 0;	memory(102) <= 0;	memory(103) <= 0;	memory(104) <= 0;
	memory(105) <= 0;	memory(106) <= 0;	memory(107) <= 0;	memory(108) <= 0;
	memory(109) <= 0;	memory(110) <= 0;	memory(111) <= 0;	memory(112) <= 0;
	memory(113) <= 0;	memory(114) <= 0;	memory(115) <= 0;	memory(116) <= 0;
	memory(117) <= 0;	memory(118) <= 0;	memory(119) <= 0;	memory(120) <= 0;
	memory(121) <= 0;	memory(122) <= 0;	memory(123) <= 0;	memory(124) <= 0;
	memory(125) <= 0;	memory(126) <= 0;	memory(127) <= 0;	memory(128) <= 0;
	memory(129) <= 0;	memory(130) <= 0;	memory(131) <= 0;	memory(132) <= 0;
	memory(133) <= 0;	memory(134) <= 0;	memory(135) <= 0;	memory(136) <= 0;
	memory(137) <= 0;	memory(138) <= 0;	memory(139) <= 0;	memory(140) <= 0;
	memory(141) <= 0;	memory(142) <= 0;	memory(143) <= 0;	memory(144) <= 0;
	memory(145) <= 0;	memory(146) <= 0;	memory(147) <= 0;	memory(148) <= 0;
	memory(149) <= 0;	memory(150) <= 0;	memory(151) <= 0;	memory(152) <= 0;
	memory(153) <= 0;	memory(154) <= 0;	memory(155) <= 0;	memory(156) <= 0;
	memory(157) <= 0;	memory(158) <= 0;	memory(159) <= 0;	memory(160) <= 0;
	memory(161) <= 0;	memory(162) <= 0;	memory(163) <= 0;	memory(164) <= 0;
	memory(165) <= 0;	memory(166) <= 0;	memory(167) <= 0;	memory(168) <= 0;
	memory(169) <= 0;	memory(170) <= 0;	memory(171) <= 0;	memory(172) <= 0;
	memory(173) <= 0;	memory(174) <= 0;	memory(175) <= 0;	memory(176) <= 0;
	memory(177) <= 0;	memory(178) <= 0;	memory(179) <= 0;	memory(180) <= 0;
	memory(181) <= 0;	memory(182) <= 0;	memory(183) <= 0;	memory(184) <= 0;
	memory(185) <= 0;	memory(186) <= 0;	memory(187) <= 0;	memory(188) <= 0;
	memory(189) <= 0;	memory(190) <= 0;	memory(191) <= 0;	memory(192) <= 0;
	memory(193) <= 0;	memory(194) <= 0;	memory(195) <= 0;	memory(196) <= 0;
	memory(197) <= 0;	memory(198) <= 0;	memory(199) <= 0;	memory(200) <= 0;
	memory(201) <= 0;	memory(202) <= 0;	memory(203) <= 0;	memory(204) <= 0;
	memory(205) <= 0;	memory(206) <= 0;	memory(207) <= 0;	memory(208) <= 0;
	memory(209) <= 0;	memory(210) <= 0;	memory(211) <= 0;	memory(212) <= 0;
	memory(213) <= 0;	memory(214) <= 0;	memory(215) <= 0;	memory(216) <= 0;
	memory(217) <= 0;	memory(218) <= 0;	memory(219) <= 0;	memory(220) <= 0;
	memory(221) <= 0;	memory(222) <= 0;	memory(223) <= 0;	memory(224) <= 0;
	memory(225) <= 0;	memory(226) <= 0;	memory(227) <= 0;	memory(228) <= 0;
	memory(229) <= 0;	memory(230) <= 0;	memory(231) <= 0;	memory(232) <= 0;
	memory(233) <= 0;	memory(234) <= 0;	memory(235) <= 0;	memory(236) <= 0;
	memory(237) <= 0;	memory(238) <= 0;	memory(239) <= 0;	memory(240) <= 255;
	memory(241) <= 0;	memory(242) <= 0;	memory(243) <= 0;	memory(244) <= 255;
	memory(245) <= 0;	memory(246) <= 0;	memory(247) <= 0;	memory(248) <= 0;
	memory(249) <= 0;	memory(250) <= 0;	memory(251) <= 0;	memory(252) <= 0;
	memory(253) <= 0;	memory(254) <= 0;	memory(255) <= 0;
end architecture;