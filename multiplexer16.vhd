----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    21:06:24 05/19/2015
-- Design Name:
-- Module Name:    multiplexer16 - Behavioral
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

entity MUX16 is
	port (
		A, B: in std_logic_vector(15 downto 0);
		SEL: in std_logic_vector(3 downto 0);
		RESULT: out std_logic_vector(15 downto 0);

		O_FLAG: out std_logic; -- overflow flag
		N_FLAG: out std_logic -- negative flag
	);
end MUX16;

architecture Behavioral of MUX16 is

	component FA16
		port (
			A: in std_logic_vector(15 downto 0);
			B: in std_logic_vector(15 downto 0);
			CIN: in std_logic;
			SUM: out std_logic_vector(15 downto 0);
			COUT: out std_logic
		);
	end component;

	component AND16
		port (
			A: in std_logic_vector(15 downto 0);
			B: in std_logic_vector(15 downto 0);
			RESULT: out std_logic_vector(15 downto 0)
		);
	end component;

	component XOR16
		port (
			A: in std_logic_vector(15 downto 0);
			B: in std_logic_vector(15 downto 0);
			RESULT: out std_logic_vector(15 downto 0)
		);
	end component;

	component OR16
		port (
			A: in std_logic_vector(15 downto 0);
			B: in std_logic_vector(15 downto 0);
			RESULT: out std_logic_vector(15 downto 0)
		);
	end component;

	component SUB16
		port (
			A: in std_logic_vector(15 downto 0);
			B: in std_logic_vector(15 downto 0);
			SUM: out std_logic_vector(15 downto 0);
			BOUT: out std_logic
		);
	end component;

signal RESULT_ADD, RESULT_AND, RESULT_OR, RESULT_XOR, RESULT_SUB: std_logic_vector(15 downto 0);
signal O_FLAG_RES: std_logic := '0';
signal N_FLAG_RES: std_logic := '0';

begin

FLAG_SEL: process(SEL, O_FLAG_RES, N_FLAG_RES)
	begin
		if SEL = "0000" then
			O_FLAG <= O_FLAG_RES;
		else
			O_FLAG <= '0';
		end if;
		
		if SEL = "0100" then
			N_FLAG <= N_FLAG_RES;
		else
			N_FLAG <= '0';
		end if;
	end process;

	P1: FA16
		port map (A => A, B => B, CIN => '0', SUM => RESULT_ADD, COUT => O_FLAG_RES);
	P2: AND16
		port map (A => A, B => B, RESULT => RESULT_AND);
	P3: XOR16
		port map (A => A, B => B, RESULT => RESULT_XOR);
	P4: OR16
		port map (A => A, B => B, RESULT => RESULT_OR);
	P5: SUB16
		port map (A => A, B => B, SUM => RESULT_SUB, BOUT => N_FLAG_RES);


	with SEL select
		RESULT <= RESULT_ADD when "0000",
				  RESULT_AND when "0001",
				  RESULT_XOR when "0010",
				  RESULT_OR  when "0011",
				  RESULT_SUB when "0100",
				  "0000000000000000" when others;

end Behavioral;

