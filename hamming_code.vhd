----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:50:06 11/22/2012 
-- Design Name: 
-- Module Name:    hamming_code - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hamming_code is
    Port ( msg : in  STD_LOGIC_VECTOR (3 downto 0);
           encoded : out  STD_LOGIC_VECTOR (6 downto 0));
end hamming_code;


architecture Behavioral of hamming_code is
signal p1 : STD_LOGIC;
signal p2 : STD_LOGIC;
signal p3 : STD_LOGIC;

begin

	process(p1, p2, p3, msg)
	begin
		p1 <= msg(0) xor msg(1) xor msg(3); --Parity
		p2 <= msg(0) xor msg(2) xor msg(3);
		p3 <= msg(1) xor msg(2) xor msg(3);
	end process;
	
	process(p1, p2, p3, msg)
	begin
		encoded(0) <= p1;
		encoded(1) <= p2;	
		encoded(2) <= msg(0);
		encoded(3) <= p3;
		encoded(4) <= msg(1);
		encoded(5) <= msg(2);
		encoded(6) <= msg(3);
	end process;
	
--	process
--	begin
--		encoded(0) <= msg(0) xor msg(1) xor msg(3);
--		encoded(1) <= msg(0) xor msg(2) xor msg(3);	
--		encoded(2) <= msg(0);
--		encoded(3) <= msg(1) xor msg(2) xor msg(3);
--		encoded(4) <= msg(1);
--		encoded(5) <= msg(2);
--		encoded(6) <= msg(3);
--	end process;
	
	
end Behavioral;

--msg as switch
--encoded message as led