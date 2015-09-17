--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : Calculator_sch.vhf
-- /___/   /\     Timestamp : 06/17/2015 17:02:03
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl W:/Xilinx/ALU/Calculator_sch.vhf -w W:/Xilinx/ALU/Calculator_sch.sch
--Design Name: Calculator_sch
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Calculator_sch is
   port ( btnc   : in    std_logic; 
          btnd   : in    std_logic; 
          IN_CLK : in    std_logic; 
          SW_0   : in    std_logic; 
          SW_1   : in    std_logic; 
          SW_2   : in    std_logic; 
          SW_3   : in    std_logic; 
          SW_4   : in    std_logic; 
          SW_5   : in    std_logic; 
          SW_6   : in    std_logic; 
          SW_7   : in    std_logic; 
          SW_8   : in    std_logic; 
          SW_9   : in    std_logic; 
          SW_10  : in    std_logic; 
          SW_11  : in    std_logic; 
          SW_12  : in    std_logic; 
          SW_13  : in    std_logic; 
          SW_14  : in    std_logic; 
          SW_15  : in    std_logic; 
          AN0    : out   std_logic; 
          AN1    : out   std_logic; 
          AN2    : out   std_logic; 
          AN3    : out   std_logic; 
          AN4    : out   std_logic; 
          AN5    : out   std_logic; 
          AN6    : out   std_logic; 
          AN7    : out   std_logic; 
          CA     : out   std_logic; 
          CB     : out   std_logic; 
          CC     : out   std_logic; 
          CD     : out   std_logic; 
          CE     : out   std_logic; 
          CF     : out   std_logic; 
          CG     : out   std_logic; 
          LED1   : out   std_logic; 
          LED2   : out   std_logic; 
          LED3   : out   std_logic; 
          LED4   : out   std_logic);
end Calculator_sch;

architecture BEHAVIORAL of Calculator_sch is
   attribute IOSTANDARD   : string ;
   attribute CAPACITANCE  : string ;
   attribute SLEW         : string ;
   attribute DRIVE        : string ;
   attribute BOX_TYPE     : string ;
   attribute IBUF_LOW_PWR : string ;
   signal Bin      : std_logic_vector (15 downto 0);
   signal MUX      : std_logic_vector (7 downto 0);
   signal SEG      : std_logic_vector (1 to 7);
   signal XLXN_5   : std_logic;
   signal XLXN_6   : std_logic;
   signal XLXN_60  : std_logic_vector (15 downto 0);
   signal XLXN_151 : std_logic_vector (15 downto 0);
   signal XLXN_152 : std_logic_vector (3 downto 0);
   signal XLXN_153 : std_logic_vector (15 downto 0);
   signal XLXN_154 : std_logic_vector (15 downto 0);
   signal XLXN_155 : std_logic;
   signal XLXN_156 : std_logic_vector (1 downto 0);
   signal XLXN_157 : std_logic;
   signal XLXN_158 : std_logic;
   signal XLXN_159 : std_logic;
   signal XLXN_160 : std_logic;
   signal XLXN_163 : std_logic;
   signal XLXN_167 : std_logic;
   signal XLXN_168 : std_logic;
   signal XLXN_177 : std_logic;
   signal XLXN_179 : std_logic;
   signal XLXN_180 : std_logic;
   component DISP7SEG
      port ( O_FLAG : in    std_logic; 
             N_FLAG : in    std_logic; 
             CLK    : in    std_logic; 
             RST    : in    std_logic; 
             BIN    : in    std_logic_vector (15 downto 0); 
             SEG    : out   std_logic_vector (1 to 7); 
             MUX    : out   std_logic_vector (7 downto 0));
   end component;
   
   component MUX16
      port ( A      : in    std_logic_vector (15 downto 0); 
             B      : in    std_logic_vector (15 downto 0); 
             SEL    : in    std_logic_vector (3 downto 0); 
             O_FLAG : out   std_logic; 
             N_FLAG : out   std_logic; 
             RESULT : out   std_logic_vector (15 downto 0));
   end component;
   
   component controller
      port ( CLK           : in    std_logic; 
             RST           : in    std_logic; 
             BUTT_IN       : in    std_logic; 
             DATA_IN       : in    std_logic_vector (15 downto 0); 
             OPCODE_OUT    : out   std_logic_vector (3 downto 0); 
             OPERAND_1_OUT : out   std_logic_vector (15 downto 0); 
             OPERAND_2_OUT : out   std_logic_vector (15 downto 0); 
             SEL           : out   std_logic; 
             STATE         : out   std_logic_vector (1 downto 0));
   end component;
   
   component clock_divider_100M_to_480
      port ( in_clock  : in    std_logic; 
             enable    : in    std_logic; 
             out_clock : out   std_logic);
   end component;
   
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute CAPACITANCE of OBUF : component is "DONT_CARE";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute CAPACITANCE of IBUF : component is "DONT_CARE";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component IBUFG
      -- synopsys translate_off
      generic( IBUF_LOW_PWR : boolean :=  TRUE);
      -- synopsys translate_on
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUFG : component is "DEFAULT";
   attribute CAPACITANCE of IBUFG : component is "DONT_CARE";
   attribute IBUF_LOW_PWR of IBUFG : component is "TRUE";
   attribute BOX_TYPE of IBUFG : component is "BLACK_BOX";
   
   component state_decoder
      port ( STATE : in    std_logic_vector (1 downto 0); 
             LED1  : out   std_logic; 
             LED2  : out   std_logic; 
             LED3  : out   std_logic; 
             LED4  : out   std_logic);
   end component;
   
   component MUX_DISP
      port ( D0  : in    std_logic_vector (15 downto 0); 
             D1  : in    std_logic_vector (15 downto 0); 
             O   : out   std_logic_vector (15 downto 0); 
             SEL : in    std_logic);
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component debounce
      port ( clk    : in    std_logic; 
             button : in    std_logic; 
             result : out   std_logic);
   end component;
   
begin
   XLXI_1 : DISP7SEG
      port map (BIN(15 downto 0)=>XLXN_60(15 downto 0),
                CLK=>XLXN_180,
                N_FLAG=>XLXN_6,
                O_FLAG=>XLXN_5,
                RST=>XLXN_163,
                MUX(7 downto 0)=>MUX(7 downto 0),
                SEG(1 to 7)=>SEG(1 to 7));
   
   XLXI_2 : MUX16
      port map (A(15 downto 0)=>XLXN_153(15 downto 0),
                B(15 downto 0)=>XLXN_154(15 downto 0),
                SEL(3 downto 0)=>XLXN_152(3 downto 0),
                N_FLAG=>XLXN_6,
                O_FLAG=>XLXN_5,
                RESULT(15 downto 0)=>XLXN_151(15 downto 0));
   
   XLXI_3 : controller
      port map (BUTT_IN=>XLXN_168,
                CLK=>XLXN_180,
                DATA_IN(15 downto 0)=>Bin(15 downto 0),
                RST=>XLXN_163,
                OPCODE_OUT(3 downto 0)=>XLXN_152(3 downto 0),
                OPERAND_1_OUT(15 downto 0)=>XLXN_153(15 downto 0),
                OPERAND_2_OUT(15 downto 0)=>XLXN_154(15 downto 0),
                SEL=>XLXN_155,
                STATE(1 downto 0)=>XLXN_156(1 downto 0));
   
   XLXI_4 : clock_divider_100M_to_480
      port map (enable=>XLXN_177,
                in_clock=>XLXN_179,
                out_clock=>XLXN_180);
   
   XLXI_5 : OBUF
      port map (I=>SEG(1),
                O=>CA);
   
   XLXI_6 : OBUF
      port map (I=>SEG(2),
                O=>CB);
   
   XLXI_7 : OBUF
      port map (I=>SEG(3),
                O=>CC);
   
   XLXI_8 : OBUF
      port map (I=>SEG(4),
                O=>CD);
   
   XLXI_9 : OBUF
      port map (I=>SEG(5),
                O=>CE);
   
   XLXI_10 : OBUF
      port map (I=>SEG(6),
                O=>CF);
   
   XLXI_11 : OBUF
      port map (I=>SEG(7),
                O=>CG);
   
   XLXI_12 : OBUF
      port map (I=>MUX(0),
                O=>AN0);
   
   XLXI_13 : OBUF
      port map (I=>MUX(1),
                O=>AN1);
   
   XLXI_14 : OBUF
      port map (I=>MUX(2),
                O=>AN2);
   
   XLXI_15 : OBUF
      port map (I=>MUX(3),
                O=>AN3);
   
   XLXI_16 : OBUF
      port map (I=>MUX(4),
                O=>AN4);
   
   XLXI_17 : OBUF
      port map (I=>MUX(5),
                O=>AN5);
   
   XLXI_18 : OBUF
      port map (I=>MUX(6),
                O=>AN6);
   
   XLXI_19 : OBUF
      port map (I=>MUX(7),
                O=>AN7);
   
   XLXI_20 : IBUF
      port map (I=>SW_0,
                O=>Bin(0));
   
   XLXI_21 : IBUF
      port map (I=>SW_1,
                O=>Bin(1));
   
   XLXI_22 : IBUF
      port map (I=>SW_2,
                O=>Bin(2));
   
   XLXI_23 : IBUF
      port map (I=>SW_3,
                O=>Bin(3));
   
   XLXI_24 : IBUF
      port map (I=>SW_4,
                O=>Bin(4));
   
   XLXI_25 : IBUF
      port map (I=>SW_5,
                O=>Bin(5));
   
   XLXI_26 : IBUF
      port map (I=>SW_6,
                O=>Bin(6));
   
   XLXI_27 : IBUF
      port map (I=>SW_7,
                O=>Bin(7));
   
   XLXI_28 : IBUF
      port map (I=>SW_8,
                O=>Bin(8));
   
   XLXI_29 : IBUF
      port map (I=>SW_9,
                O=>Bin(9));
   
   XLXI_30 : IBUF
      port map (I=>SW_10,
                O=>Bin(10));
   
   XLXI_31 : IBUF
      port map (I=>SW_11,
                O=>Bin(11));
   
   XLXI_32 : IBUF
      port map (I=>SW_12,
                O=>Bin(12));
   
   XLXI_33 : IBUF
      port map (I=>SW_13,
                O=>Bin(13));
   
   XLXI_34 : IBUF
      port map (I=>SW_14,
                O=>Bin(14));
   
   XLXI_35 : IBUF
      port map (I=>SW_15,
                O=>Bin(15));
   
   XLXI_73 : IBUFG
      port map (I=>IN_CLK,
                O=>XLXN_179);
   
   XLXI_74 : state_decoder
      port map (STATE(1 downto 0)=>XLXN_156(1 downto 0),
                LED1=>XLXN_157,
                LED2=>XLXN_158,
                LED3=>XLXN_159,
                LED4=>XLXN_160);
   
   XLXI_75 : OBUF
      port map (I=>XLXN_157,
                O=>LED1);
   
   XLXI_76 : OBUF
      port map (I=>XLXN_158,
                O=>LED2);
   
   XLXI_77 : OBUF
      port map (I=>XLXN_159,
                O=>LED3);
   
   XLXI_78 : OBUF
      port map (I=>XLXN_160,
                O=>LED4);
   
   XLXI_80 : MUX_DISP
      port map (D0(15 downto 0)=>Bin(15 downto 0),
                D1(15 downto 0)=>XLXN_151(15 downto 0),
                SEL=>XLXN_155,
                O(15 downto 0)=>XLXN_60(15 downto 0));
   
   XLXI_81 : IBUF
      port map (I=>btnc,
                O=>XLXN_163);
   
   XLXI_83 : VCC
      port map (P=>XLXN_177);
   
   XLXI_84 : debounce
      port map (button=>XLXN_167,
                clk=>XLXN_179,
                result=>XLXN_168);
   
   XLXI_85 : IBUF
      port map (I=>btnd,
                O=>XLXN_167);
   
end BEHAVIORAL;


