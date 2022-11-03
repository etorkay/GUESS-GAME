----------------------------------------------------------------------------------
-----------------------------------VANILLA D FLIP FLOP----------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity D_FLIPFLOP is
    port(
        CLK, LOAD, CLEAR: IN STD_LOGIC;
        D: IN STD_LOGIC_VECTOR(7 downto 0);
        Q: OUT STD_LOGIC_VECTOR(7 downto 0)
    );
end D_FLIPFLOP;

--architecture
architecture Behavioral of D_FLIPFLOP is
    --internal signal
    signal tmpD: STD_LOGIC_VECTOR(7 downto 0);

begin
    DFF : process(CLK, tmpD)
    begin
        if (RISING_EDGE(CLK)) then

            if (CLEAR = '1') then
                tmpD <= "00000000";
                
            elsif(LOAD = '1') then
                tmpD <= D;
            
            else
                tmpD <= tmpD;
                
            end if ;
            
        end if ;
        Q <= tmpD;
    end process ; -- DFF


end Behavioral;

