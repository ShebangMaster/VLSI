library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity circuit_1 is
    Port ( reset : in STD_LOGIC;
           input : in STD_LOGIC;
           clock : in STD_LOGIC
           );
end circuit_1;

architecture Behavioral of circuit_1 is

signal sig1: std_logic:='0';
signal sig2: std_logic:='0';
signal sig3: std_logic:='0';
signal pulse: std_logic:='0';
--Expend count to 100
signal count: std_logic_vector(7 downto 0):= (others=>'0');

begin

--Sync circuit           
process(clock)
begin
    if rising_edge(clock)then
         if reset ='1' then
            sig1<='0';
            sig2 <='0';
            sig3 <='0';
            pulse <='0';
        else
            sig1<=input;
            sig2<=sig1;
            sig3<=sig2;
--Differentiator
            pulse<=sig2 and not sig3;            
        end if;
    end if;
end process;

---------
--counter
---------
process(clock)
begin
    if rising_edge(clock) then
        if (reset ='1') then
            count <=(others=>'0');         
        elsif pulse='1' and count < 100 then
            count <= count + 1;
        else
            count <= count;
        end if;
    end if;
end process;
            
end Behavioral;
