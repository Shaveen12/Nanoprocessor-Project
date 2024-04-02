----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 12:16:00 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           RegSelect1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSelect2 : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSelect : out STD_LOGIC;
           ImmediateVal : out STD_LOGIC_VECTOR (3 downto 0);
           AddSubSel : out STD_LOGIC;
           RegisterEn : out STD_LOGIC_VECTOR(2 downto 0);
           JumpF : out STD_LOGIC;
           JumpAddr : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

component Decoder_2_to_4
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

-- 00 is ADD
-- 01 is NEG
-- 11 is JZR
-- 10 is MOVI

signal OpCode : std_logic_vector(1 downto 0);
signal Enabler : std_logic_vector(3 downto 0);

-- this val is used for JZR and MOV
signal Val : std_logic_vector(3 downto 0);


begin
-- based on the instruction set the addrs of registers
OpCode <= Instruction(11 downto 10);
RegSelect1 <= Instruction(9 downto 7);
RegSelect2 <= Instruction(6 downto 4);
Val <= Instruction(3 downto 0);
-- jump is case
-- JumpToVal <= "0001" OR Instruction(3 downto 0); 

-- Decoder is always enabled to decode the instruction
OpCodeDec2to4 : Decoder_2_to_4
    port map(
        I => OpCode,
        EN => '1',
        Y => Enabler
    );

-- only enable sub in NEG which happens when "01..." in the instruction bits
AddSubSel <= Enabler(1);

end Behavioral;
