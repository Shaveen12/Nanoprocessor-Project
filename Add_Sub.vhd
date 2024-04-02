


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add_Sub is
    Port ( A_in : in STD_LOGIC_VECTOR (3 downto 0);
           B_in : in STD_LOGIC_VECTOR (3 downto 0);
           Subtract : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (3 downto 0);
           Z : out STD_LOGIC;
           Overflow : out STD_LOGIC);
end Add_Sub;

architecture Behavioral of Add_Sub is

Component FA
port (
   A : in STD_LOGIC;
   B : in STD_LOGIC;
   C_in : in STD_LOGIC;
   S : out STD_LOGIC;
   C_out : out STD_LOGIC);
   
end component;

SIGNAL B_new : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C  : STD_LOGIC;
 
begin

B_new(0) <= B_in(0) XOR Subtract;
B_new(1) <= B_in(1) XOR Subtract;
B_new(2) <= B_in(2) XOR Subtract;
B_new(3) <= B_in(3) XOR Subtract;

FA_0 : FA
port map(
A => A_in(0),
B => B_new(0),
C_in => Subtract,
S => FA0_S,
C_out =>FA0_C);

FA_1 : FA
port map(
A => A_in(1),
B => B_new(1),
C_in => FA0_C,
S => FA1_S,
C_out =>FA1_C);

FA_2 :FA
port map(
A => A_in(2),
B => B_new(2),
C_in => FA1_C,
S => FA2_S,
C_out =>FA2_C);

FA_3 :FA
port map(
A => A_in(3),
B => B_new(3),
C_in => FA2_C,
S => FA3_S,
C_out =>FA3_C);

Output(0) <= FA0_S;
Output(1) <= FA1_S;
Output(2) <= FA2_S;
Output(3) <= FA3_S;

Z <= NOT (FA0_S OR FA1_S OR FA2_S OR FA3_S);
Overflow <= FA2_C XOR FA3_C;

end Behavioral;
