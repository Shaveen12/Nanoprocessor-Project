----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 12:31:33 PM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_en : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Reg0 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg1 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg2 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg3 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg4 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg5 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg6 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg7 : out STD_LOGIC_VECTOR (3 downto 0));
end Register_Bank;

architecture Behavioral of Register_Bank is
Component Reg
Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Component;

Component Decoder_3_To_8 is
 Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
 EN : in STD_LOGIC;
 Y : out STD_LOGIC_VECTOR (7 downto 0));
end Component;

signal Y1 : STD_LOGIC_VECTOR (7 downto 0);
begin
Decoder_3_To_8_0 : Decoder_3_To_8
 port map(
 I => Reg_en,
 EN => '1',
 Y => Y1 );

Reg00 : Reg
port map (
    D => "0000",
    EN => Y1(0),
    Clk => Clk,
    Res => Res,
    Q => Reg0
);
Reg01 : Reg
port map (
    D => Input,
    EN => Y1(1),
    Clk => Clk,
    Res => Res,
    Q => Reg1
);
Reg02 : Reg
port map (
    D => Input,
    EN => Y1(2),
    Clk => Clk,
    Res => Res,
    Q => Reg2
);
Reg03 : Reg
port map (
    D => Input,
    EN => Y1(3),
    Clk => Clk,
    Res => Res,
    Q => Reg3
);
Reg04 : Reg
port map (
    D => Input,
    EN => Y1(4),
    Clk => Clk,
    Res => Res,
    Q => Reg4
);
Reg05 : Reg
port map (
    D => Input,
    EN => Y1(5),
    Clk => Clk,
    Res => Res,
    Q => Reg5
);
Reg06 : Reg
port map (
    D => Input,
    EN => Y1(6),
    Clk => Clk,
    Res => Res,
    Q => Reg6
);
Reg07 : Reg
port map (
    D => Input,
    EN => Y1(7),
    Clk => Clk,
    Res => Res,
    Q => Reg7
);

end Behavioral;
