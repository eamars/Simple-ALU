--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:04:35 05/14/2015
-- Design Name:   
-- Module Name:   W:/Xilinx/adder_practise/full_adder_tb.vhd
-- Project Name:  adder_practise
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FA16
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
 
ENTITY full_adder_tb IS
END full_adder_tb;
 
ARCHITECTURE behavior OF full_adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FA16
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         CIN : IN  std_logic;
         SUM : OUT  std_logic_vector(15 downto 0);
         COUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal CIN : std_logic := '0';

 	--Outputs
   signal SUM : std_logic_vector(15 downto 0);
   signal COUT : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	uut: FA16 PORT MAP (
          A => A,
          B => B,
          CIN => CIN,
          SUM => SUM,
          COUT => COUT
        );

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
		
	end process;


END;
