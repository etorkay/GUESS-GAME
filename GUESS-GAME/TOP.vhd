----------------------------------------------------------------------------------
-----------------------------CU and DP CONNECTED----------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity TOP is
    port(
        LO_HI_USER_INPUT: IN STD_LOGIC_VECTOR(1 downto 0);
        CLK, CLR: IN STD_LOGIC;
        OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0)
    );
end TOP;

--architecture
architecture Structural of TOP is
    --internal signals
    signal sel, lohisignal: STD_LOGIC_VECTOR(1 downto 0);
    signal load: STD_LOGIC_VECTOR(2 downto 0);
    signal clear: STD_LOGIC_VECTOR(2 downto 0);
    signal outctrl, rpt: STD_LOGIC;

    --component decalration
    component CONTROLUNIT
        port(
            CLK, CLR: IN STD_LOGIC;

        --CONTROL SIGNALS
        LSel, HSel, OUTPUT_CTRL: OUT STD_LOGIC;
        LO_HI_SIG: OUT STD_LOGIC_VECTOR(1 downto 0);
        HIGH_L, LOW_L, GUESS_L: OUT STD_LOGIC;
        HIGH_C, LOW_C, GUESS_C: OUT STD_LOGIC;

        --STATUS SIGNALS FROM DATAPATH
        REPEAT: IN STD_LOGIC;

        --input from user
        LO_HI_USER: IN STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    component DATAPATH
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
    end component;

begin
    --bundle signals assignment



    DP: DATAPATH port map(
        CLK => CLK,
        LSel => sel(1),
        HSel => sel(0),

        OUTPUT_CTRL => outctrl,

        LO_HI_SIG => lohisignal,

        HIGH_L => load(2),
        LOW_L => load(1),
        GUESS_L => load(0),

        HIGH_C => clear(2),
        LOW_C => clear(1),
        GUESS_C => clear(0),

        --STATUS SIGNALS
        REPEAT => rpt, 

        --OUTPUT
        GUESS_OUTPUT => OUTPUT

    );

    CU: CONTROLUNIT port map(
        CLK => CLK,
        CLR => CLR,

        --CONTROL SIGNALS
        LSel => sel(1),
        HSel => sel(0),

        OUTPUT_CTRL => outctrl,
        LO_HI_SIG => lohisignal,

        HIGH_L => load(2),
        LOW_L => load(1),
        GUESS_L => load(0),

        HIGH_C => clear(2),
        LOW_C => clear(1),
        GUESS_C => clear(0),

        --STATUS SIGNALS FROM DATAPATH
        REPEAT => rpt,

        --input from user
        LO_HI_USER => LO_HI_USER_INPUT

    );


end Structural;

