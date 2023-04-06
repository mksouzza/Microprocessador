library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder is
    port
    (
        code : in unsigned(2 downto 0);
        en : in std_logic;
        out1, out2, out3, out4, out5, out6, out7 : out std_logic 
    );
end entity;

architecture a_decoder of decoder is
    begin
        out1 <= '1' when code = "001" and en = '1' else '0';
        out2 <= '1' when code = "010" and en = '1' else '0';
        out3 <= '1' when code = "011" and en = '1' else '0';
        out4 <= '1' when code = "100" and en = '1' else '0';
        out5 <= '1' when code = "101" and en = '1' else '0';
        out6 <= '1' when code = "110" and en = '1' else '0';
        out7 <= '1' when code = "111" and en = '1' else '0';
end architecture;