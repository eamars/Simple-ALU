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
entity SUB16 is
	port (
		A: in std_logic_vector(15 downto 0);
		B: in std_logic_vector(15 downto 0);
		SUM: out std_logic_vector(15 downto 0);
		BOUT: out std_logic
	);
end SUB16;

architecture Behavioral of SUB16 is
	-- declare component
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
	signal BOUT_INVERT: std_logic;
	
begin
BOUT <= NOT BOUT_INVERT;

	B0: full_adder
		port map (
			A => A(0),
			B => "NOT" (B(0)),
			CIN => '1',
			COUT => C(0),
			SUM => SUM(0)
		);
	
	B1: full_adder
		port map (
			A => A(1),
			B => "NOT" (B(1)),
			CIN => C(0),
			COUT => C(1),
			SUM => SUM(1)
		);
		
	B2: full_adder
		port map (
			A => A(2),
			B => "NOT" (B(2)),
			CIN => C(1),
			COUT => C(2),
			SUM => SUM(2)
		);
		
	B3: full_adder
		port map (
			A => A(3),
			B => "NOT" (B(3)),
			CIN => C(2),
			COUT => C(3),
			SUM => SUM(3)
		);
	
	B4: full_adder
		port map (
			A => A(4),
			B => "NOT" (B(4)),
			CIN => C(3),
			COUT => C(4),
			SUM => SUM(4)
		);
	
	B5: full_adder
		port map (
			A => A(5),
			B => "NOT" (B(5)),
			CIN => C(4),
			COUT => C(5),
			SUM => SUM(5)
		);
		
	B6: full_adder
		port map (
			A => A(6),
			B => "NOT" (B(6)),
			CIN => C(5),
			COUT => C(6),
			SUM => SUM(6)
		);
		
	B7: full_adder
		port map (
			A => A(7),
			B => "NOT" (B(7)),
			CIN => C(6),
			COUT => C(7),
			SUM => SUM(7)
		);
	
	B8: full_adder
		port map (
			A => A(8),
			B => "NOT" (B(8)),
			CIN => C(7),
			COUT => C(8),
			SUM => SUM(8)
		);
	
	B9: full_adder
		port map (
			A => A(9),
			B => "NOT" (B(9)),
			CIN => C(8),
			COUT => C(9),
			SUM => SUM(9)
		);
		
	B10: full_adder
		port map (
			A => A(10),
			B => "NOT" (B(10)),
			CIN => C(9),
			COUT => C(10),
			SUM => SUM(10)
		);
		
	B11: full_adder
		port map (
			A => A(11),
			B => "NOT" (B(11)),
			CIN => C(10),
			COUT => C(11),
			SUM => SUM(11)
		);
	
	B12: full_adder
		port map (
			A => A(12),
			B => "NOT" (B(12)),
			CIN => C(11),
			COUT => C(12),
			SUM => SUM(12)
		);
	
	B13: full_adder
		port map (
			A => A(13),
			B => "NOT" (B(13)),
			CIN => C(12),
			COUT => C(13),
			SUM => SUM(13)
		);
		
	B14: full_adder
		port map (
			A => A(14),
			B => "NOT" (B(14)),
			CIN => C(13),
			COUT => C(14),
			SUM => SUM(14)
		);
		
	B15: full_adder
		port map (
			A => A(15),
			B => "NOT" (B(15)),
			CIN => C(14),
			COUT => BOUT_INVERT,
			SUM => SUM(15)
		);
	
end Behavioral;


