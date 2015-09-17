--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:04:15 05/25/2015
-- Design Name:   
-- Module Name:   W:/Xilinx/adder_practise/display_tb.vhd
-- Project Name:  adder_practise
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DISP7SEG
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
 
ENTITY display_tb IS
END display_tb;
 
ARCHITECTURE behavior OF display_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DISP7SEG
    PORT(
         BIN : IN  std_logic_vector(15 downto 0);
         O_FLAG : IN  std_logic;
         N_FLAG : IN  std_logic;
         CLK : IN  std_logic;
         RST : IN  std_logic;
         SEG : OUT  std_logic_vector(1 to 7);
         MUX : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal BIN : std_logic_vector(15 downto 0) := (others => '0');
   signal N_FLAG : std_logic := '0';
   signal O_FLAG : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal SEG : std_logic_vector(1 to 7);
   signal MUX : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 100 ps;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DISP7SEG PORT MAP (
          BIN => BIN,
          O_FLAG => O_FLAG,
          N_FLAG => N_FLAG,
          CLK => CLK,
          RST => RST,
          SEG => SEG,
          MUX => MUX
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
      wait for 100 ns;	

      BIN <= "0000000000000111";
	  N_FLAG <= '1';
	  O_FLAG <= '1';
	  RST <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
