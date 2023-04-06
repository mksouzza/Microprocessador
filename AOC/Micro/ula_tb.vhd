-- Gabriel Gomes da Costa
-- Marcos Vinicius Simao de Souza

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity ULA16b_tb is
end entity;

architecture a_ULA16b_tb of ULA16b_tb is
    component ULA16b
    port(
            entr0, entr1 : in unsigned(15 downto 0); --duas entradas de 16 bits
            op : in unsigned(1 downto 0); -- operador
            saida : out unsigned(15 downto 0); --saida de 16 bits
            sinal_bit : out std_logic --bit sinal logico
        );
end component;

signal entr0, entr1 : unsigned(15 downto 0);
signal op : unsigned(1 downto 0);
signal saida : unsigned(15 downto 0);
signal sinal_bit : std_logic;

begin
        uut : ULA16b port map(
                        entr0 => entr0,
                        entr1 => entr1,
                        op => op,
                        saida => saida,
                        sinal_bit => sinal_bit
                     );
        process
        begin
            --Testes:
			--Operacao de Soma
            entr0 <= "0000000000010011";
            entr1 <= "0000000010001011";
            op <= "00";
            wait for 50 ns;
			
			entr0 <= "0000000000000000";
            entr1 <= "0000000000000000";
            op <= "00";
			wait for 10 ns;
			
			--Operacao de Subtracao
			entr0 <= "1111111111110010";
            entr1 <= "0000000000001101";  
            op <= "01";
            wait for 50 ns;
			
			entr0 <= "0000000000000000";
            entr1 <= "0000000000000000";
            op <= "00";
			wait for 10 ns;
			
			--Operacao de comparacao 0 maior que 1
            entr0 <= "0000000000000011";
            entr1 <= "0000000000000001";
            op <= "10";
            wait for 50 ns;
		
			entr0 <= "0000000000000000";
            entr1 <= "0000000000000000";
            op <= "00";
			wait for 10 ns;
			
			--Operacao de comparacao 0 menor que 1
            entr0 <= "0000000000000001";
            entr1 <= "0000000000000011";
            op <= "10";
            wait for 50 ns;
			
			entr0 <= "0000000000000000";
            entr1 <= "0000000000000000";
            op <= "00";
			wait for 10 ns;
			
			--Operacao de AND
            entr0 <= "0001001011001101";
            entr1 <= "1111111111110010";
            op <= "11";
            wait for 50 ns;
			wait;
        end process;
end architecture;