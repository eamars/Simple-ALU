----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:36:17 06/03/2015 
-- Design Name: 
-- Module Name:    state_decoder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity state_decoder is
	port ( 
		STATE: in std_logic_vector(1 downto 0);
		LED1: out std_logic;
		LED2: out std_logic;
		LED3: out std_logic;
		LED4: out std_logic
	);
end state_decoder;

architecture Behavioral of state_decoder is

begin

decoder: process(STATE)
	begin
	case STATE is
		when "00" =>
			LED1 <= '1';
			LED2 <= '0';
			LED3 <= '0';
			LED4 <= '0';
		when "01" =>
			LED1 <= '0';
			LED2 <= '1';
			LED3 <= '0';
			LED4 <= '0';
		when "10" =>
			LED1 <= '0';
			LED2 <= '0';
			LED3 <= '1';
			LED4 <= '0';
		when "11" =>
			LED1 <= '0';
			LED2 <= '0';
			LED3 <= '0';
			LED4 <= '1';
		when others =>
			LED1 <= '0';
			LED2 <= '0';
			LED3 <= '0';
			LED4 <= '0';
		end case;
end process;


end Behavioral;

