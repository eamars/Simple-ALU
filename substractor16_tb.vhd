--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:20:38 05/15/2015
-- Design Name:   
-- Module Name:   P:/courses/ENEL373/ALU/substractor16_tb.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SUB16
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
 
ENTITY substractor16_tb IS
END substractor16_tb;
 
ARCHITECTURE behavior OF substractor16_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SUB16
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         SUM : OUT  std_logic_vector(15 downto 0);
         BOUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal SUM : std_logic_vector(15 downto 0);
   signal BOUT : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SUB16 PORT MAP (
          A => A,
          B => B,
          SUM => SUM,
          BOUT => BOUT
        );
 

   -- Stimulus process
   tb: process
	begin
		A <= "0000000000000000";
		B <= "0000000000000000";
		wait for 1 ps;
		
		A <= "0000000000000001";
		B <= "0000000000000000";
		wait for 1 ps;
		
		A <= "0000000000000000";
		B <= "0000000000000001";
		wait for 1 ps;
		
		A <= "0000000000000001";
		B <= "0000000000000001";
		wait for 1 ps;
		
		A <= "1111111111111111";
		B <= "0000000000000000";
		wait for 1 ps;
		
		A <= "1111111111111111";
		B <= "0000000000000001";
		wait for 1 ps;
		
		A <= "0000000000000001";
		B <= "0000000001000001";
		wait for 1 ps;
		
		
	end process;

END;
