 ----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2017 06:54:08 PM
-- Design Name: 
-- Module Name: Smart_Parking - Behavioral
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

     

entity Smart_Parking is
Port ( clk,rst,ready : in std_logic;
   Insertion_Command : in STD_LOGIC_VECTOR (31 downto 0);
   Plate : in five_dig;
   Lamps : out STD_LOGIC_VECTOR (5 downto 0));
end Smart_Parking;

architecture Behavioral of Smart_Parking is

function Char_To_Int (ch : integer) 
         return integer is
begin
 if (ch=character'pos('0')) then 
     return 0;
 elsif (ch=character'pos('1')) then    
     return 1;
 elsif (ch=character'pos('2')) then    
     return 2;
 elsif (ch=character'pos('3')) then    
     return 3;
 elsif (ch=character'pos('4')) then    
     return 4;
 elsif (ch=character'pos('5')) then    
     return 5;
 elsif (ch=character'pos('6')) then    
     return 6;
 elsif (ch=character'pos('7')) then    
     return 7;
 elsif (ch=character'pos('8')) then    
     return 8;
 elsif (ch=character'pos('9')) then    
     return 9;    
 else 
     return 10;
 end if;    
end Char_To_Int;


function binarySearch (array0 : My_Array;
                     Plate : five_dig;
                     first : integer range 0 to 99;
                     last : integer range 0 to 99;
                     cnt : integer) 
                     return Plate_Number is  
          variable temp,div : std_logic_vector (7 downto 0);
          variable Mid,S: integer range 0 to 99;
          variable Num: integer range 0 to 99999;
          variable c: integer range 0 to 200;
          variable res : Plate_Number:=(number=>0 , place=>0);
          begin  
          c:=cnt+1;
          --if ((first<=99) and (first>=0) and (last<=99) and (last>=0) ) then  
          if (c<=9) then 
              S:= first+last;
              temp := std_logic_vector(to_unsigned(S, temp'length));
              div := '0' & temp(7 downto 1);
              Mid := to_integer(unsigned(div));
              Num:=Plate(0)+(Plate(1)*10)+(Plate(2)*100)+(Plate(3)*1000)+(Plate(4)*10000);
              if ( array0(Mid).Number = Num ) then
                  res:= array0(Mid);
              elsif ( array0(Mid).Number > Num ) then
                  res:= binarySearch(array0 ,Plate ,first ,Mid-1,c);
              else
                  res:= binarySearch(array0 ,Plate ,mid+1 ,last,c);
              end if;
              return res;
           else 
               return res;    
           end if;    

end binarySearch;

signal char: character ;
signal int0,int1,int2,int3,int4,int5,int6,int7,int8,int9: integer ;
signal a: std_logic ;
type my_state is (Reset,s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,first);
signal CURS, NEXTS,Current2,Next2 : my_state;
signal int: integer range 0 to 90:=0;
signal arr_size,found: integer range 0 to 99:=0;
signal arr : My_Array;
signal test : Plate_Number;
--signal tmp: Plate_number:=(Place => 0 ,Number => 0);
signal en,Flag,FlagNew: std_logic:='0';
signal five_test : five_dig;
signal isInList0 : boolean;

begin
process(clk)
begin
if (clk'event and clk='1') then
  if RST = '1' then
     CURS <= Reset;
     Current2 <= First;
  else
     CURS <= NEXTS;
     Current2 <= Next2;
  end if;
end if;
end process;

int <= to_integer(unsigned(Insertion_Command(31 downto 1)));

  process (clk) is
  begin
     if (clk'event and clk='1') then  
       FlagNew<=Flag;
       Flag<=Insertion_Command(0);
     end if;
  end process;


process(CURS,Insertion_Command)
variable TMP : Plate_Number ;
variable Last : integer range 0 to 99 :=0;
variable N : integer range 0 to 10 :=0;
variable five : five_dig;
variable two : two_dig;
variable const : integer range 0 to 99:=0;
variable i : integer range -99 to 99;
variable isInList : boolean:=false;
begin
 N:=Char_To_Int(int);
  case CURS is 
      when Reset =>
          
          if (int=35) then
              NEXTS<=S0;
          else 
              NEXTS<=Reset;
          end if; 
      when S0 => 
          tmp.Number:=0;
          tmp.Place:=0;
          if ((FlagNew xor Flag)='0') then
          NEXTS<=S0;
          else
          if (N=10) then
              NEXTS<=Reset;
          else 
              two(0):=N;
              NEXTS<=S1;
          end if; 
          end if;
      when S1 => 
    if ((FlagNew xor Flag)='0') then
      NEXTS<=S1;
      else
          if (N=10) then
              NEXTS<=Reset;
          else 
              two(1):=N;
              tmp.Place:=two(0)+(two(1)*10);
              NEXTS<=S2;
          end if; 
          end if;    
      when S2 => 
           if ((FlagNew xor Flag)='0') then
           NEXTS<=S2; 
           else    
          if (int=42) then
              NEXTS<=S3;    
          else 
              NEXTS<=Reset;
          end if; 
          end if;              
      when S3 => 
          if ((FlagNew xor Flag)='0') then
      NEXTS<=S3; 
      else     
          if (Char_To_Int(int)=10) then
              NEXTS<=Reset;
          else 
            
              five(0):=N;
              NEXTS<=S4;
          end if; 
          end if;   
       when S4 => 
             if ((FlagNew xor Flag)='0') then
       NEXTS<=S4;  
       else  
          if (Char_To_Int(int)=10) then
              NEXTS<=Reset;
          else 
              
              five(1):=N;
              NEXTS<=S5;
          end if;
          end if;  
      when S5 => 
                if ((FlagNew xor Flag)='0') then
      NEXTS<=S5;
      else
          if (Char_To_Int(int)=10) then
              NEXTS<=Reset;
          else 
            
              five(2):=N;
              NEXTS<=S6;
          end if;
          end if;  
      when S6 => 
          if ((FlagNew xor Flag)='0') then
      NEXTS<=S6;
      else      
          if (Char_To_Int(int)=10) then
              NEXTS<=Reset;
          else 
              
              five(3):=N;
              NEXTS<=S7;
          end if; 
          end if;
      when S7 => 
     if ((FlagNew xor Flag)='0') then
      NEXTS<=S7;
      else
          if (Char_To_Int(int)=10) then
              NEXTS<=Reset;
          else 
              
              five(4):=N;
              tmp.Number:=five(0)+(five(1)*10)+(five(2)*100)+(five(3)*1000)+(five(4)*10000);
              for  j in 0 to 99 loop
               if (arr(j).Number=tmp.Number) then
                   isInList:=true;
               end if;    
              end loop;
               
            if (isInList=false) then   
              i := last;  
            for k in 0 to 99 loop 
            if( (i > 0) and (tmp.Number < arr(i-1).Number)) then      
                arr(i) <= arr(i-1);
                report "this is a message";
                i := i - 1;           
               -- const:= const+1;
                else 
                   exit;
                 end if;  
            end loop;
       
            arr(i) <= tmp;
            Last:=Last+1;
            else
            isInList:=false;
            end if;
              NEXTS<=S8;
          end if; 
          end if;
      when S8 => 
      if ((FlagNew xor Flag)='0') then
      NEXTS<=S8;
      else
          if (int=35) then
          
              NEXTS<=S9;    
          else 
              NEXTS<=Reset;
          end if; 
          end if;
      when S9 => 
          if ((int=35) and (FlagNew xor Flag)='1') then
          
              NEXTS<=S0;    
          else 
              NEXTS<=S9;
          end if;           
      when others =>
        NEXTS<= Reset;                   
          
  end case;
  arr_size<=Last;
  test<=tmp;
  five_test<=five;
  isInList0<=isInList;
end process;     

--Lamps(0) First floor right
--Lamps(1) First floor left
--Lamps(2) First floor corridor
--Lamps(3) Second floor right
--Lamps(4) Second floor left
--Lamps(5) Second floor corridor

process(ready,Plate)
  variable PN : Plate_number;
  begin
      if (ready = '1') then
          PN:= binarySearch(arr,plate,0,arr_size,0);
          if ((PN.Place >= 0) and (PN.Place<= 24)) then
              Lamps(0)<='1';
              Lamps(2)<='1';
          elsif ((PN.Place >= 25) and (PN.Place<= 49)) then
              Lamps(1)<='1';
              Lamps(2)<='1';
          elsif ((PN.Place >= 50) and (PN.Place<= 74)) then
              Lamps(2)<='1';
              Lamps(3)<='1';
              Lamps (5)<='1';
          else
              Lamps(2)<='1';
              Lamps(4)<='1';
              Lamps(5)<='1';    
          end if;        
      else 
          Lamps<="000000";
      end if;
  found <= PN.Place;    
  end process;    
      



--char<=character'val(to_integer(unsigned(Insertion_Command)));
--int0 <=character'pos('0');
--int1 <=character'pos('1');
--int2 <=character'pos('2');
--int3 <=character'pos('3');
--int4 <=character'pos('4');
--int5 <=character'pos('5');
--int6 <=character'pos('6');
--int7 <=character'pos('7');
--int8 <=character'pos('#');
--int9 <=character'pos('*');
--h: if (char='g') generate
--a<='1';
--end generate;

end Behavioral;
