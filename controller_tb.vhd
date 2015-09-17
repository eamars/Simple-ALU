--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:32:31 05/27/2015
-- Design Name:   
-- Module Name:   W:/Xilinx/adder_practise/controller_tb.vhd
-- Project Name:  adder_practise
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: controller
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
 
ENTITY controller_tb IS
END controller_tb;
 
ARCHITECTURE behavior OF controller_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT controller
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         BUTT_IN : IN  std_logic;
         DATA_IN : IN  std_logic_vector(15 downto 0);
         OPCODE_OUT : OUT  std_logic_vector(3 downto 0);
         OPERAND_1_OUT : OUT  std_logic_vector(15 downto 0);
         OPERAND_2_OUT : OUT  std_logic_vector(15 downto 0);
         SEL : OUT  std_logic;
			STATE: out std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal BUTT_IN : std_logic := '0';
   signal DATA_IN : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal OPCODE_OUT : std_logic_vector(3 downto 0);
   signal OPERAND_1_OUT : std_logic_vector(15 downto 0);
   signal OPERAND_2_OUT : std_logic_vector(15 downto 0);
   signal SEL : std_logic;
	signal STATE: std_logic_vector(1 downto 0);
   -- Clock period definitions
   constant CLK_period : time := 2 ps;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: controller PORT MAP (
          CLK => CLK,
          RST => RST,
          BUTT_IN => BUTT_IN,
          DATA_IN => DATA_IN,
          OPCODE_OUT => OPCODE_OUT,
          OPERAND_1_OUT => OPERAND_1_OUT,
          OPERAND_2_OUT => OPERAND_2_OUT,
          SEL => SEL,
			 STATE => STATE
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		RST <= '0';
		BUTT_IN <= '1';
		DATA_IN <= "0000000000000101";
		
		wait for 4 ps;
		BUTT_IN <= '0';
		
		wait for 4 ps;
		BUTT_IN <= '1';
		DATA_IN <= "0000001110000111";
		
		wait for 4 ps;
		BUTT_IN <= '0';
	
		wait for 4 ps;
		BUTT_IN <= '1';
		DATA_IN <= "1111111111111111";
		
		wait for 4 ps;
		BUTT_IN <= '0';
		
		DATA_IN <= "0000000000000000";

      -- insert stimulus here 

      wait;
   end process;

END;
