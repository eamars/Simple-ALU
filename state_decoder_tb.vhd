--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:23:08 06/04/2015
-- Design Name:   
-- Module Name:   P:/courses/ENEL373/ALU/state_decoder_tb.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: state_decoder
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
 
ENTITY state_decoder_tb IS
END state_decoder_tb;
 
ARCHITECTURE behavior OF state_decoder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT state_decoder
    PORT(
         STATE : IN  std_logic_vector(1 downto 0);
         LED1 : OUT  std_logic;
         LED2 : OUT  std_logic;
         LED3 : OUT  std_logic;
         LED4 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal STATE : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal LED1 : std_logic;
   signal LED2 : std_logic;
   signal LED3 : std_logic;
   signal LED4 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: state_decoder PORT MAP (
          STATE => STATE,
          LED1 => LED1,
          LED2 => LED2,
          LED3 => LED3,
          LED4 => LED4
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

      STATE <= "00";
		wait for 2 ps;
		STATE <= "01";
		wait for 2 ps;
		STATE <= "10";
		wait for 2 ps;
		STATE <= "11";
		wait for 2 ps;

      -- insert stimulus here 

      wait;
   end process;

END;
