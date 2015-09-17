----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    21:41:23 05/27/2015
-- Design Name:
-- Module Name:    controller - Behavioral
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

entity controller is
	port (
		CLK: in std_logic;
		RST: in std_logic;
		BUTT_IN: in std_logic; -- input from button
		DATA_IN: in std_logic_vector(15 downto 0); -- input from switch

		OPCODE_OUT: out std_logic_vector(3 downto 0);
		OPERAND_1_OUT: out std_logic_vector(15 downto 0);
		OPERAND_2_OUT: out std_logic_vector(15 downto 0);

		SEL: out std_logic;
		STATE: out std_logic_vector(1 downto 0)
	);
end controller;

architecture Behavioral of controller is
	signal current_state: std_logic_vector(1 downto 0) := "00";
	signal next_state: std_logic_vector(1 downto 0) := "00"; -- state for FSM
	signal opcode_s, operand_1_s, operand_2_s: std_logic := '1'; -- state for each FF

	-- generic register
	component REG
		generic(n: positive);
		port(
			CLK:		in std_logic;
			RST:		in std_logic;
			LOAD: 	in std_logic;
			REG_IN:	in std_logic_vector(n - 1 downto 0);
			REG_OUT:	out std_logic_vector(n - 1 downto 0)
		);
	end component;

begin

STATE <= current_state;

clock_event: process(CLK)
	begin
		if rising_edge(CLK) then
			current_state <= next_state;
		end if;
	end process;
	
button_event: process(RST, BUTT_IN, current_state)
	begin
		if RST = '1' then
			next_state <= "00";
		
		elsif rising_edge(BUTT_IN) then
			case current_state is
				when "00" => next_state <= "01";
				when "01" => next_state <= "10";
				when "10" => next_state <= "11";
				when "11" => next_state <= "00";
				when others => next_state <= "00";
			end case;
		end if;
	end process;

comb_logic: process(current_state)
	begin
		case current_state is
			when "00" =>
				-- at state 00, store opcode
				opcode_s <= '1';
				operand_1_s <= '0';
				operand_2_s <= '0';
				SEL <= '0';
			
			when "01" =>
				-- at state 01, store operand 1
				opcode_s <= '0';
				operand_1_s <= '1';
				operand_2_s <= '0';
				SEL <= '0';

			when "10" =>
				-- at state 10, store operand 2
				opcode_s <= '0';
				operand_1_s <= '0';
				operand_2_s <= '1';
				SEL <= '0';

			when "11" =>
				-- at state 11, disable any input
				opcode_s <= '0';
				operand_1_s <= '0';
				operand_2_s <= '0';
				SEL <= '1';
				
			when others =>
				opcode_s <= '0';
				operand_1_s <= '0';
				operand_2_s <= '0';
				SEL <= '0';

		end case;
end process;


OPCODE_STORE: REG generic map(4)
	port map (
		CLK => CLK,
		RST => RST,
		LOAD => opcode_s,
		REG_IN => DATA_IN(3 downto 0),
		REG_OUT => OPCODE_OUT
	);

OPERAND1_STORE: REG generic map(16)
	port map (
		CLK => CLK,
		RST => RST,
		LOAD => operand_1_s,
		REG_IN => DATA_IN,
		REG_OUT => OPERAND_1_OUT
	);

OPERAND2_STORE: REG generic map(16)
	port map (
		CLK => CLK,
		RST => RST,
		LOAD => operand_2_s,
		REG_IN => DATA_IN,
		REG_OUT => OPERAND_2_OUT
	);

end Behavioral;













