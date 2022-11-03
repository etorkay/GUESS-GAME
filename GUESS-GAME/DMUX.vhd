----------------------------------------------------------------------------------
------------------------------------1 BY 4 DEMULTIPLEXER--------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity DMUX is
    port(
        --Input
        INPUT: IN STD_LOGIC_VECTOR(7 downto 0);

        --Select signal
        sel: IN STD_LOGIC_VECTOR(1 downto 0);

        --Output
        OUTPUT_0, OUTPUT_1, OUTPUT_2, OUTPUT_3: OUT STD_LOGIC_VECTOR(7 downto 0)
    );
end DMUX;

--architecture
architecture Behavioral of DMUX is

begin
    DMUX: process(INPUT,sel)
    begin
        case(sel) is
    
            when "00" =>
                OUTPUT_0 <= INPUT;
					 OUTPUT_1 <= "ZZZZZZZZ";
					 OUTPUT_2 <= "ZZZZZZZZ";
					 OUTPUT_3 <= "ZZZZZZZZ";
            
            when "01" =>
                OUTPUT_0 <= "ZZZZZZZZ";
					 OUTPUT_1 <= INPUT;
					 OUTPUT_2 <= "ZZZZZZZZ";
					 OUTPUT_3 <= "ZZZZZZZZ";
                
            when "10" =>
                OUTPUT_0 <= "ZZZZZZZZ";
					 OUTPUT_1 <= "ZZZZZZZZ";
					 OUTPUT_2 <= INPUT;
					 OUTPUT_3 <= "ZZZZZZZZ";    
        
            when "11" =>
                OUTPUT_0 <= "ZZZZZZZZ";
					 OUTPUT_1 <= "ZZZZZZZZ";
					 OUTPUT_2 <= "ZZZZZZZZ";
					 OUTPUT_3 <= INPUT; 
    
            when others =>
                OUTPUT_0 <= "ZZZZZZZZ";
					 OUTPUT_1 <= "ZZZZZZZZ";
					 OUTPUT_2 <= "ZZZZZZZZ";
					 OUTPUT_3 <= "ZZZZZZZZ";  
    
        end case ;
        
    end process ; -- DMUX


end Behavioral;

