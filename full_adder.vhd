----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:41:43 05/13/2015 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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

-- 1 bit full adder
entity full_adder is
	port ( 
		A: in std_logic;
		B: in std_logic;
		CIN: in std_logic;
		COUT: out std_logic;
		SUM: out std_logic
	);
end full_adder;

architecture Behavioral of full_adder is
begin
	-- parallel process
	SUM <= (A XOR B) XOR CIN;
	COUT <= ((A XOR B) AND CIN) OR (A AND B);
	
end Behavioral;


