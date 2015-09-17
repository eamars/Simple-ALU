----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:59:32 05/19/2015 
-- Design Name: 
-- Module Name:    bitwise_xor16 - Behavioral 
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

entity XOR16 is
	port (
		A: in std_logic_vector(15 downto 0);
		B: in std_logic_vector(15 downto 0);
		RESULT: out std_logic_vector(15 downto 0)
	);
end XOR16;

architecture Behavioral of XOR16 is
begin
	process(A, B)
		begin
		for i in 15 downto 0 loop
			RESULT(i) <= A(i) XOR B(i);
		end loop;
	end process;


end Behavioral;

