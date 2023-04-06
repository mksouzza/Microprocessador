-- Gabriel Gomes da Costa
-- Marcos Vinicius Simao de Souza

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 


entity ULA16b is
    port(
            entr0, entr1 : in unsigned(15 downto 0); --duas entradas de 16 bits
            op : in unsigned(1 downto 0); -- operador
            saida : out unsigned(15 downto 0); --saida de 16 bits
            sinal_bit : out std_logic --bit sinal logico
        );
end entity;

architecture a_ULA16b of ULA16b is
begin
    process(entr0, entr1, op)
    begin
        case op is
            when "00" =>
                saida <= entr0 + entr1; -- soma
                sinal_bit <= '0';

            when "01" =>
                saida <= entr0 - entr1; -- subtração
                sinal_bit <= '0';

            when "10" =>
                if entr0 > entr1 then -- saida é entro0 se for maior
                    saida <= entr0;
                    sinal_bit <= '0'; -- entr0 é maior do que entr1
                else
                    saida <= entr1; -- saída é entr1 se entr0 for menor
                    sinal_bit <= '1'; -- entr0 é menor do que entr1
                end if;

            when "11" =>
                saida <= entr0 AND entr1; -- operação AND
                sinal_bit <= '0';

            when others =>
                saida <= (others => 'X');
                sinal_bit <= '0';

        end case;
    end process; 
end architecture;