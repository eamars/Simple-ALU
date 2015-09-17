----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    17:26:12 05/25/2015
-- Design Name:
-- Module Name:    display_driver - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DISP7SEG is
	port (
		-- input binary
		BIN: in std_logic_vector(15 downto 0);

		O_FLAG: in std_logic; -- overflow flag
		N_FLAG: in std_logic; -- negative flag

		CLK: in std_logic;
		RST: in std_logic;

		SEG: out std_logic_vector(1 to 7);
		MUX: out std_logic_vector(7 downto 0)
	);
end DISP7SEG;

architecture Behavioral of DISP7SEG is

	component BIN2BCD16
		port ( binIN : in  STD_LOGIC_VECTOR (15 downto 0);
		   ones : out  STD_LOGIC_VECTOR (3 downto 0);
		   tens : out  STD_LOGIC_VECTOR (3 downto 0);
		   hundreds : out  STD_LOGIC_VECTOR (3 downto 0);
		   thousands : out  STD_LOGIC_VECTOR (3 downto 0);
		   ten_thousands: out STD_LOGIC_VECTOR (3 downto 0)
		  );
	end component;

	component BCD_to_7SEG
		Port ( bcd_in: in std_logic_vector (3 downto 0);	-- Input BCD vector
    			leds_out: out	std_logic_vector (1 to 7));		-- Output 7-Seg vector
	end component;


	signal CNT: std_logic_vector(2 downto 0) := "000";
	signal DEC0, DEC1, DEC2, DEC3, DEC4: std_logic_vector(3 downto 0) := "0000";
	signal SEG0, SEG1, SEG2, SEG3, SEG4, SEG5, SEG6, SEG7: std_logic_vector(1 to 7) := "0000000";
	signal O_FLAG_VECTOR, N_FLAG_VECTOR: std_logic_vector(3 downto 0) := "0000";

begin

-- create o flag and n flag
O_FLAG_VECTOR <= "000" & O_FLAG;
N_FLAG_VECTOR <= "000" & N_FLAG;

multiplexer: process(CLK, RST)
	begin
	if RST = '1' then
		CNT <= "000";

	-- on raising edge of clock
	elsif (CLK'event AND CLK = '1') then
		-- select which pin to active low
		case CNT is
			when "000" =>
				MUX <= "11111110";
				SEG <= SEG0;
			when "001" =>
				MUX <= "11111101";
				SEG <= SEG1;
			when "010" =>
				MUX <= "11111011";
				SEG <= SEG2;
			when "011" =>
				MUX <= "11110111";
				SEG <= SEG3;
			when "100" =>
				MUX <= "11101111";
				SEG <= SEG4;
			when "101" =>
				MUX <= "11011111";
				SEG <= SEG5;
			when "110" =>
				MUX <= "10111111";
				SEG <= SEG6;
			when "111" =>
				MUX <= "01111111";
				SEG <= SEG7;
			when others =>
				MUX <= "11111111";
				SEG <= "-------";
		end case;

		-- increase counter
		if CNT = "111" then
			CNT <= "000";
		else
			CNT <= CNT + 1;
		end if;

	end if;
end process;

-- bind decode from binary to digital
bcd: BIN2BCD16
port map (
	binIN => BIN,
	ones => DEC0,
	tens => DEC1,
	hundreds => DEC2,
	thousands => DEC3,
	ten_thousands => DEC4
);

-- binary to 7 segment display
seg_0: BCD_to_7SEG
port map(
	bcd_in => DEC0,
	leds_out => SEG0
);

seg_1: BCD_to_7SEG
port map(
	bcd_in => DEC1,
	leds_out => SEG1
);

seg_2: BCD_to_7SEG
port map(
	bcd_in => DEC2,
	leds_out => SEG2
);

seg_3: BCD_to_7SEG
port map(
	bcd_in => DEC3,
	leds_out => SEG3
);

seg_4: BCD_to_7SEG
port map(
	bcd_in => DEC4,
	leds_out => SEG4
);

seg_5: BCD_to_7SEG
port map(
	bcd_in => "0000",
	leds_out => SEG5
);

seg_6: BCD_to_7SEG
port map(
	bcd_in => O_FLAG_VECTOR,
	leds_out => SEG6
);

seg_7: BCD_to_7SEG
port map(
	bcd_in => N_FLAG_VECTOR,
	leds_out => SEG7
);

end Behavioral;

