library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity pc is
    port(
            bus_write : in unsigned(15 downto 0); -- barramento de escrita
            bus_read: out unsigned(15 downto 0); -- barramentos de leitura
            write_enab : in std_logic; -- enable de escrita
            clk : in std_logic --clock e reset
        );
end pc;

architecture a_pc of pc is
    signal count : unsigned(15 downto 0); -- registrador interno
    begin
        process(clk,write_enab )
        begin
            if(write_enab = '1') then
                count <= bus_write;
            end if;
        end process;

        bus_read <= count; -- se o barramento não for 00 ou 01 será Z para iniciar estado de alta impedancia
end architecture;