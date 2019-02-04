----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2017 11:30:32 PM
-- Design Name: 
-- Module Name: Test - Behavioral
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


package mypackage is    
type Plate_number is record
Place : integer;
Number : integer range 0 to 99999;
end record;

type My_Array is array (0 to 99) of Plate_number;
type five_dig is array (0 to 4) of integer range 0 to 9;
type two_dig is array (0 to 1) of integer range 0 to 9;
end mypackage;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL; 
use work.mypackage.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Test is
end Test;

architecture Behavioral of Test is

component Smart_Parking is
Port ( clk,rst,ready : in std_logic;
      Insertion_Command : in STD_LOGIC_VECTOR (31 downto 0);
      Plate : in five_dig;
      Lamps : out STD_LOGIC_VECTOR (5 downto 0));
end component;

signal clk,rst,ready:std_logic:='0';
signal Insertion_Command: STD_LOGIC_VECTOR (31 downto 0):=(others => '0');
signal lamps: STD_LOGIC_VECTOR (5 downto 0):=(others => '0');

signal Plate : five_dig;
begin

SP : Smart_Parking port map (clk,rst,ready,Insertion_Command,Plate,Lamps);

clock_process :process
begin
clk <= '0';
wait for 50 ns;
clk <= '1';
wait for 50 ns;
end process;
 

stim_proc: process
begin

rst <= '1';
wait for 20 ns;
rst <= '0';
wait for 25 ns;
--#42564*34#
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('4'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('3'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('*'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('4'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('6'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('5'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('2'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('4'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Insertion_Command'length-1));
wait for 100 ns;
--#32564*12#
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('2'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('*'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('4'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('6'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('5'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('2'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('3'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Insertion_Command'length-1));
wait for 100 ns;
--#32864*89#
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('9'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('8'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('*'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('4'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('6'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('8'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('2'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('3'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Insertion_Command'length-1));
wait for 100 ns;
--#17653*45#
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('5'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('4'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('*'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('3'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('5'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('6'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('7'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Insertion_Command'length-1));
wait for 100 ns;
--#23595*96#
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('6'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('9'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('*'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('5'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('9'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('5'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('3'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='0';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('2'), Insertion_Command'length-1));
wait for 100 ns;
Insertion_Command(0)<='1';
Insertion_Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Insertion_Command'length-1));
wait for 100 ns;
Plate(0) <= 4;
Plate(1) <= 6;
Plate(2) <= 8;
Plate(3) <= 2;
Plate(4) <= 3;
ready <= '1';
wait for 100 ns;
ready <= '0';
wait for 300 ns;
Plate(0) <= 3;
Plate(1) <= 5;
Plate(2) <= 6;
Plate(3) <= 7;
Plate(4) <= 1;
ready <= '1';
wait for 100 ns;
ready <= '0';
wait;
end process;

end Behavioral;
