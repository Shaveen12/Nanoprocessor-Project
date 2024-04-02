----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 05:00:17 PM
-- Design Name: 
-- Module Name: Programme_ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Programme_ROM is
    Port ( Input : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end Programme_ROM;

architecture Behavioral of Programme_ROM is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
-- HardCode 8 instructions which are 12 bits long
signal programme_ROM : rom_type := (
    "000000000001", 
    "000000000010", 
    "000000000100", 
    "000000001000", 
    "000000010000", 
    "000000100000", 
    "000001000000", 
    "000010000000" 
);

begin

Instruction <= programme_ROM(to_integer(unsigned(Input)));

end Behavioral;
