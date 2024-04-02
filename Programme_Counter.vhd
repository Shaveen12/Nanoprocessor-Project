----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 03:13:26 PM
-- Design Name: 
-- Module Name: Programme_Counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Programme_Counter is
    Port ( Input : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (2 downto 0));
end Programme_Counter;

architecture Behavioral of Programme_Counter is

begin
    process(Clk) begin
        if (rising_edge(Clk)) then
            Output <= Input;
        end if;
    end process;
end Behavioral;
