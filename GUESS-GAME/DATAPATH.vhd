----------------------------------------------------------------------------------
--------------------------------GUESS GAME DATAPATH-------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity DATAPATH is
    port(
        --CONTROL SIGNALS
        CLK: IN STD_LOGIC;
        LSel, HSel, OUTPUT_CTRL: IN STD_LOGIC;
        LO_HI_SIG: IN STD_LOGIC_VECTOR(1 downto 0);
        HIGH_L, LOW_L, GUESS_L: IN STD_LOGIC;
        HIGH_C, LOW_C, GUESS_C: IN STD_LOGIC;

        --STATUS SIGNALS
        REPEAT: OUT STD_LOGIC;

        --OUTPUT
        GUESS_OUTPUT: OUT STD_LOGIC_VECTOR( 7 downto 0)
         
    );
end DATAPATH;

--architecture
architecture Structural of DATAPATH is
    --internal signals
    signal LOW_Q, HIGH_Q, GUESS_Q, SUM, QUOTIENT, DM00, DM01, DM10, DM11: STD_LOGIC_VECTOR(7 downto 0);
    signal LOW_D, HIGH_D: STD_LOGIC_VECTOR(7 downto 0);
    --component declaration
    component D_FLIPFLOP
        port(
            CLK, LOAD, CLEAR: IN STD_LOGIC;
            D: IN STD_LOGIC_VECTOR(7 downto 0);
            Q: OUT STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component ADDER
        port(
            INPUT_0, INPUT_1: IN STD_LOGIC_VECTOR(7 downto 0);
            OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component DIVIDER
        port(
            INPUT: IN STD_LOGIC_VECTOR(7 downto 0);
            OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component DMUX
        port(
            
            INPUT: IN STD_LOGIC_VECTOR(7 downto 0); --Input
            sel: IN STD_LOGIC_VECTOR(1 downto 0); --Select signal
            OUTPUT_0, OUTPUT_1, OUTPUT_2, OUTPUT_3: OUT STD_LOGIC_VECTOR(7 downto 0) --Output
        );
    end component;

    component MUX
        port(
            
            INPUT_0, INPUT_1: IN STD_LOGIC_VECTOR(7 downto 0); --INPUT
            sel: IN STD_LOGIC; --SEL SIGNAL
            OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0) --OUTPUT

        );
    end component;


begin
	 --DFF
    LOW: D_FLIPFLOP port map(
		CLK => CLK,
        LOAD => LOW_L,
        CLEAR => LOW_C,
		D => LOW_D,
		Q => LOW_Q
	 
	 );
    HIGH: D_FLIPFLOP port map(
		CLK => CLK,
        LOAD => HIGH_L,
        CLEAR => HIGH_C,
		D => HIGH_D,
		Q => HIGH_Q
	 
	 );
    GUESS: D_FLIPFLOP port map(
		CLK => CLK,
        LOAD => GUESS_L,
        CLEAR => GUESS_C,
		D => QUOTIENT,
		Q => GUESS_Q
	 
	 );
	 
	 --ADDER
	ADD: ADDER port map(
        INPUT_0 => LOW_Q, 
        INPUT_1 => HIGH_Q,
        OUTPUT => SUM
	 
	 );
	 
	 
	 --DIVIDER
	DIV: DIVIDER port map(
        INPUT => SUM,
        OUTPUT => QUOTIENT
	 
	 );
	 
	 --DMUX
	 DMUX0: DMUX port map(
        INPUT => GUESS_Q,
        sel => LO_HI_SIG,
        OUTPUT_0 => DM00, 
        OUTPUT_1 => DM01, 
        OUTPUT_2 => DM10, 
        OUTPUT_3 => DM11
	 
	 );
	 
	 
	 --MUX
	 MUX0: MUX port map(
        INPUT_0 => DM01,
        INPUT_1 => "01100100", --100 as input
        sel => HSel,
        OUTPUT => HIGH_D
		
	 );
	 MUX1: MUX port map(
        INPUT_0 => DM10,
        INPUT_1 => "00000000", --0 as input
        sel => LSel,
        OUTPUT => LOW_D
	 
	 );



     REPEAT <= '0' when (LO_HI_SIG = "11") else '1';

     GUESS_OUTPUT <= DM00 when OUTPUT_CTRL = '1' else "ZZZZZZZZ";

end Structural;
