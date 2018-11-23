Author	: OV Shashank
Date	: 05-11-2016

Files:
- bootload.vhd		(MAIN COMPONENT)
- basic.vhd			(REGISTER CMP)
- uart_receive.vhd	(UART RECEIVE CMP)

Functions:
The booload component when correctly
integrated with IITB-RISC processor, will make it
compatible with the bootloader software to allow burning
of any code using UART. This folder conatins its Hardware component.
Software component can be found in the other folder.

How to use the component:
	component bootload is 
		port(
			start, clk, reset, RX: in std_logic;
			address: out std_logic_vector(15 downto 0);
			data: out std_logic_vector(15 downto 0);
			enable, finish: out std_logic);
	end component;

	Inputs
	-start	: Making it high for a clock cycle initiates the bootloader
	-clk	: Input clock
	-reset	: Resets the bootloader
	-RX		: UART receive pin
	-reset	: Resets eveything to 0

	Outputs
	-address	: Address to be sent to the memory
	-data		: The data to be written
	-enable		: Write Enable Signal for the memory(Generated when the data and address are proper)
	-finish		: Bootload Complete Signal
	
	Timing
	-Enable is generated and maintained only for one clock cycle
		When enable is high the address and data are stable till another UART Receive occurs
		Withhold enable for a longer duration if memory is slow
	-Finish signal remains high for one clock cycle only
	-Start needs to be high only for one clock cycle
	-UART Receive is hard-coded for ~9600 baud rate