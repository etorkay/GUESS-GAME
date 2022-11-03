----------------------------------------------------------------------------------
-------------------------------------ADDER 8 BIT----------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


--entity
entity ADDER is
    port(
        INPUT_0, INPUT_1: IN STD_LOGIC_VECTOR(7 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(7 downto 0)
    );
end ADDER;

--architecture
architecture Behavioral of ADDER is

begin
    OUTPUT <= (INPUT_0 + INPUT_1) when (INPUT_0 OR INPUT_1) /= "UUUUUUUU" else "00000000";

end Behavioral;

