----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:53:04 05/27/2015 
-- Design Name: 
-- Module Name:    Register - Behavioral 
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

entity REG is
	generic(n: positive);
	port (
		CLK:		in std_logic;
		RST:		in std_logic;
		LOAD: 	in std_logic;
		REG_IN:	in std_logic_vector(n - 1 downto 0);
		REG_OUT:	out std_logic_vector(n - 1 downto 0)
	);
end REG;

architecture Behavioral of REG  is

begin
	process(CLK, RST, LOAD, REG_IN)
	begin
		if RST = '1' then
			REG_OUT <= (REG_OUT'range => '0');
		elsif (CLK'event and CLK = '1') then
			if (LOAD = '1') then
				REG_OUT <= REG_IN;
			end if;
		end if;
	end process;

	
end Behavioral;

