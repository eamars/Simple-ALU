--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   10:02:02 06/03/2015
-- Design Name:
-- Module Name:   P:/courses/ENEL373/ALU/multiplexer16_tb.vhd
-- Project Name:  ALU
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: MUX16
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes:
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY multiplexer16_tb IS
END multiplexer16_tb;

ARCHITECTURE behavior OF multiplexer16_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT MUX16
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         SEL : IN  std_logic_vector(3 downto 0);
         RESULT : OUT  std_logic_vector(15 downto 0);
         O_FLAG : OUT  std_logic;
         N_FLAG : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal SEL : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal RESULT : std_logic_vector(15 downto 0);
   signal O_FLAG : std_logic;
   signal N_FLAG : std_logic;
   -- No clocks detected in port list. Replace <clock> below with
   -- appropriate port name


BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: MUX16 PORT MAP (
          A => A,
          B => B,
          SEL => SEL,
          RESULT => RESULT,
          O_FLAG => O_FLAG,
          N_FLAG => N_FLAG
        );

   -- Clock process definitions


   -- Stimulus process
   stim_proc: process
   begin
		A <= "1000100001001000";
		B <= "1010001000000011";
      -- add
		SEL <= "0000";
		wait for 2 ps;

		-- and
		SEL <= "0001";
		wait for 2 ps;

		-- xor
		SEL <= "0010";
		wait for 2 ps;

		-- or
		SEL <= "0011";
		wait for 2 ps;

		-- sub
		SEL <= "0100";
		wait for 2 ps;

      wait;
   end process;

END;
