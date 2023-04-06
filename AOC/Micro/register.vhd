library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regster is
    port
    (
        bus_write : in unsigned(15 downto 0); -- barramento de escrita
        bus_read: out unsigned(15 downto 0); -- barramentos de leitura
        write_enab : in std_logic; -- enable de escrita
        clk, rst : in std_logic --clock e reset
    );
end entity;

architecture a_regster of regster is
    signal reg : unsigned(15 downto 0); -- registrador interno
    begin
        process(clk, rst,write_enab )
        begin
            if(rst = '1') then
                reg <= (others => '0');
            elsif(rising_edge(clk)) then
                if(write_enab = '1') then
                    reg <= bus_write;
                end if;
            end if;
        end process;

        bus_read <= reg; -- se o barramento não for 00 ou 01 será Z para iniciar estado de alta impedancia
end architecture;