----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    00:00:10 05/22/2015
-- Design Name:
-- Module Name:    register16 - Behavioral
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

entity REG16 is
	port (
		D: in std_logic_vector(15 downto 0);
		CLK, RST: in std_logic;
		Q: out std_logic_vector(15 downto 0)
	);
end REG16;

architecture Behavioral of REG16 is
begin
process(CLK, RST)
	begin
	if (RST = '1') then
		Q <= "0000000000000000";
	elsif (CLK'event and CLK = '1') then -- raising edge
		Q <= D;
	end if;
end process;

end Behavioral;

