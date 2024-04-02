library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Adder_3_bit is
    Port ( A_in : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (2 downto 0));
end Adder_3_bit;

architecture Behavioral of Adder_3_bit is
Component FA
Port (
A : in STD_LOGIC;
B : in STD_LOGIC;
C_in : in STD_LOGIC;
S : out STD_LOGIC;
C_out : out STD_LOGIC);
end component;

SIGNAL FA0_C, FA1_C, FA2_C  : std_logic;

begin
 FA_0 : FA
 port map (
 A => '1',
 B => A_in(0),
 C_in => '0', -- Set to ground
 S => O(0),
 C_Out => FA0_C);
 
 FA_1 : FA
 port map (
 A => '0',
 B => A_in(1),
 C_in => FA0_C,
 S => O(1),
 C_Out => FA1_C);
 
 FA_2 : FA
 port map (
 A => '0',
 B => A_in(2),
 C_in => FA1_C,
 S => O(2),
 C_Out => FA2_C);

end Behavioral;
