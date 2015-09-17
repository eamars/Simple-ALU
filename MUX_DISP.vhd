----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:51:17 06/03/2015 
-- Design Name: 
-- Module Name:    MUX_DISP - Behavioral 
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

entity MUX_DISP is
	port(
		D0,D1:in std_logic_vector(15 downto 0);
		SEL: in std_logic;
		O: out std_logic_vector(15 downto 0)
	);

end MUX_DISP;

architecture Behavioral of MUX_DISP is
		
begin

	process(SEL, D0, D1)
		begin
			case SEL is
				when '0' =>
					O <= D0;
				when '1' =>
					O <= D1;
				when others =>
					O <= "0000000000000000";
			end case;
	end process;
				


end Behavioral;

