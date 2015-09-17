----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:08:12 05/22/2015 
-- Design Name: 
-- Module Name:    FSM - Behavioral 
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

entity FSM is								-- FSM model
	port(
		CLK:			in std_logic;
		RST:			in std_logic;
		SIG_IN:		in std_logic;
		DATA_IN: 	in std_logic_vector (15 downto 0);  -- input operand
		OUT_LOGIC:	out std_logic_vector (3 downto 0);						-- output for operand
		OUT_OPERAND1:	out std_logic_vector (15 downto 0);
		OUT_OPERAND2:	out std_logic_vector (15 downto 0);
		OUT_RESULT:	out std_logic_vector (15 downto 0)
		
	);
end FSM;

architecture Behavioral of FSM is

	signal currentState,nextState: std_logic_vector(2 downto 0) := "000";
	signal S0: std_logic_vector(2 downto 0) := "000";
	signal S1: std_logic_vector(2 downto 0) := "001";
	signal S2: std_logic_vector(2 downto 0) := "010";
	signal S3: std_logic_vector(2 downto 0) := "011";
	signal REG0: std_logic_vector(3 downto 0) := "0000";
	signal REG1, REG2, REG3 : std_logic_vector(15 downto 0) := "0000000000000000";
	
	--declare component
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

	state_reg: process(CLK, RST,nextState)
		begin 
			if (RST = '1') then
				currentState <= S0;
			elsif(CLK'event and CLK = '1') then
				currentState <= nextState;
			end if;
	end process;
	
	
	comb_logic: process(currentState, SIG_IN)
		begin
			case currentState is
				when S0 => 
								REG0 <= DATA_IN(3 downto 0);
								if (SIG_IN = '0') then
									nextState <= S0;
								else
									nextState <= S1;
								end if;
				when S1 =>
								REG1 <= DATA_IN;
								if (SIG_IN = '0') then
									nextState <= S1;
								else
									nextState <= S2;
								end if;
				when S2 =>
								REG2 <= DATA_IN;
								if (SIG_IN = '0') then
									nextState <= S2;
								else
									nextState <= S3;
								end if;
				when S3 =>
								REG3 <= DATA_IN;
								if (SIG_IN = '0') then
									nextState <= S3;
								else
									nextState <= S0;
								end if;
				when others =>
								nextState <= S0;
			end case;
	end process;
	
	--asign the values to the corresponding registers
	R0: REG generic map (4)
	port map (
		CLK => CLK,
		RST => RST,
		LOAD => SIG_IN,
		REG_IN => REG0,
		REG_OUT => OUT_LOGIC
	);
	
	R1: REG generic map (16)
	port map (
		CLK => CLK,
		RST => RST,
		LOAD => SIG_IN,
		REG_IN => REG1,
		REG_OUT => OUT_OPERAND1
	);
	
	R2: REG generic map (16)
	port map (
		CLK => CLK,
		RST => RST,
		LOAD => SIG_IN,
		REG_IN => REG2,
		REG_OUT => OUT_OPERAND2
	);
	
	R3: REG generic map (16)
	port map (
		CLK => CLK,
		RST => RST,
		LOAD => SIG_IN,
		REG_IN => REG3,
		REG_OUT => OUT_RESULT
	);
	
								
								
								


end Behavioral;

