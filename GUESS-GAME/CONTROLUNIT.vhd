----------------------------------------------------------------------------------
-----------------------------------GUESS GAME CONTROL UNIT------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity CONTROLUNIT is
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
end CONTROLUNIT;

--architecture
architecture Structural of CONTROLUNIT is
    type state_type is (ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, ST8);
    signal PS, NS: state_type;
    signal controls: STD_LOGIC_VECTOR(10 downto 0);

begin
    --control signal assignment to controls
    LO_HI_SIG <= controls(10 downto 9);
    LSel <= controls(8); 
    HSel <= controls(7); 
    OUTPUT_CTRL <= controls(6);
    HIGH_L <= controls(5); 
    LOW_L <= controls(4); 
    GUESS_L <= controls(3);
    HIGH_C <= controls(2); 
    LOW_C <= controls(1);
    GUESS_C <= controls(0);


    --synchrounous process
    sync_proc : process(CLK, CLR, NS)
    begin

        --async input
        if (CLR = '1') then
            PS <= ST0;
        elsif(RISING_EDGE(CLK)) then
            PS <= NS;
        end if ;
        
    end process ; -- sync_proc

    
    --combiniatory process
    comb_proc : process(PS, REPEAT, CLR, LO_HI_USER)
    begin
        case(PS) is
        
            when ST0 =>
                controls <= "-----------";
                if (CLR = '0') then
                    NS <= ST1;
                else
                    NS <= ST0;
                    controls(2 downto 0) <= "111";
                end if ;

            when ST1 =>
                controls <= "--110110000";
                NS <= ST2;

            when ST2 =>
                controls <= "----0001000";
                NS <= ST3;

            when ST3 =>
                controls <= "00--1000000";
                NS <= ST4;

            when ST4 =>
                controls <= "-----------";
                if (LO_HI_USER = "11") then
                    NS <= ST7;
                    --controls(10 downto 9) <= 

                elsif (LO_HI_USER = "10") then
                    NS <= ST5;


                elsif (LO_HI_USER = "01") then
                    NS <= ST6;

                elsif (LO_HI_USER = "00") then
                    NS <= ST8;

                else
                    NS <= ST0; --TEST
                    
                        
                end if ;

            when ST5 =>
                controls <= "100-0010000";
                NS <= ST7;

            when ST6 =>
                controls <= "01-00100000";
                NS <= ST7;
                

            when ST7 =>
                controls <= "-----------";
                    if (REPEAT = '1') then
                        NS <= ST2;
                    else
                        NS <= ST8;
                    end if ;

            when ST8 =>
                controls <= "00--1000000";
                NS <= ST8;
                        
            when others =>
                controls <= "00000000000";
                NS <= ST0;
        
        end case ;
        
    end process ; -- comb_proc


end Structural;

