----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:35:18 05/13/2015 
-- Design Name: 
-- Module Name:    full_adder16 - Behavioral 
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


-- 16 bit full adder
entity FA16 is
	port (
		A: in std_logic_vector(15 downto 0);
		B: in std_logic_vector(15 downto 0);
		CIN: in std_logic;
		SUM: out std_logic_vector(15 downto 0);
		COUT: out std_logic
	);
end FA16;

architecture Behavioral of FA16 is
	-- declear component
	component full_adder
		port ( 
			A: in std_logic;
			B: in std_logic;
			CIN: in std_logic;
			SUM: out std_logic;
			COUT: out std_logic
		);
	end component;

	-- define internal carry
	signal C: std_logic_vector(14 downto 0);
	
begin
	B0: full_adder
		port map (
			A => A(0),
			B => B(0),
			CIN => CIN,
			COUT => C(0),
			SUM => SUM(0)
		);
	
	B1: full_adder
		port map (
			A => A(1),
			B => B(1),
			CIN => C(0),
			COUT => C(1),
			SUM => SUM(1)
		);
		
	B2: full_adder
		port map (
			A => A(2),
			B => B(2),
			CIN => C(1),
			COUT => C(2),
			SUM => SUM(2)
		);
		
	B3: full_adder
		port map (
			A => A(3),
			B => B(3),
			CIN => C(2),
			COUT => C(3),
			SUM => SUM(3)
		);
	
	B4: full_adder
		port map (
			A => A(4),
			B => B(4),
			CIN => C(3),
			COUT => C(4),
			SUM => SUM(4)
		);
	
	B5: full_adder
		port map (
			A => A(5),
			B => B(5),
			CIN => C(4),
			COUT => C(5),
			SUM => SUM(5)
		);
		
	B6: full_adder
		port map (
			A => A(6),
			B => B(6),
			CIN => C(5),
			COUT => C(6),
			SUM => SUM(6)
		);
		
	B7: full_adder
		port map (
			A => A(7),
			B => B(7),
			CIN => C(6),
			COUT => C(7),
			SUM => SUM(7)
		);
	
	B8: full_adder
		port map (
			A => A(8),
			B => B(8),
			CIN => C(7),
			COUT => C(8),
			SUM => SUM(8)
		);
	
	B9: full_adder
		port map (
			A => A(9),
			B => B(9),
			CIN => C(8),
			COUT => C(9),
			SUM => SUM(9)
		);
		
	B10: full_adder
		port map (
			A => A(10),
			B => B(10),
			CIN => C(9),
			COUT => C(10),
			SUM => SUM(10)
		);
		
	B11: full_adder
		port map (
			A => A(11),
			B => B(11),
			CIN => C(10),
			COUT => C(11),
			SUM => SUM(11)
		);
	
	B12: full_adder
		port map (
			A => A(12),
			B => B(12),
			CIN => C(11),
			COUT => C(12),
			SUM => SUM(12)
		);
	
	B13: full_adder
		port map (
			A => A(13),
			B => B(13),
			CIN => C(12),
			COUT => C(13),
			SUM => SUM(13)
		);
		
	B14: full_adder
		port map (
			A => A(14),
			B => B(14),
			CIN => C(13),
			COUT => C(14),
			SUM => SUM(14)
		);
		
	B15: full_adder
		port map (
			A => A(15),
			B => B(15),
			CIN => C(14),
			COUT => COUT,
			SUM => SUM(15)
		);
	
end Behavioral;


