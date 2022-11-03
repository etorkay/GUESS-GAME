----------------------------------------------------------------------------------
-----------------------------------------DIVIDE BY 2------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity
entity DIVIDER is
    port(
        INPUT: IN STD_LOGIC_VECTOR(7 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0)
    );
end DIVIDER;

--architecture
architecture Behavioral of DIVIDER is
    --internal signal

begin
    OUTPUT <= '0' & INPUT(7 downto 1);

end Behavioral;

