library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity processador is
    port(
            --AINDA PRECISA ESCREVER
            rst, clk : in std_logic
        );
end entity;

architecture a_processador of processador is
    --ULA16b
    component ULA16b is
        port(
                entr0, entr1 : in unsigned(15 downto 0); --duas entradas de 16 bits
                op : in unsigned(1 downto 0); -- operador
                saida : out unsigned(15 downto 0); --saida de 16 bits
                sinal_bit : out std_logic --bit sinal logico
            );
    end component;

    --REGISTER
    component regster is
        port(
                bus_write : in unsigned(15 downto 0); -- barramento de escrita
                bus_read: out unsigned(15 downto 0); -- barramentos de leitura
                write_enab : in std_logic; -- enable de escrita
                clk, rst : in std_logic --clock e reset
            );
        end component;

    --BANCO DE REGS
    component bancoregs is
        port(
            reg0, reg1, reg_write : in unsigned(2 downto 0);
            bus_write : in unsigned(15 downto 0);
            clk, rst, write_enab : in std_logic;
            reg0_out, reg1_out : unsigned(15 downto 0)
        );
     end component;

    --ROM
    component rom is
        port(
                clk : in std_logic;
                address : in unsigned(6 downto 0);
                data : out unsigned(11 downto 0)
            );
    end component;
    
    --DECODER
    component decoder is
        port
        (
            code : in unsigned(2 downto 0);
            en : in std_logic;
            out1, out2, out3, out4, out5, out6, out7 : out std_logic 
        );
    end component;

    --PC
    component pc is
        port(
                bus_write : in unsigned(15 downto 0); -- barramento de escrita
                bus_read: out unsigned(15 downto 0); -- barramentos de leitura
                write_enab : in std_logic; -- enable de escrita
                clk, rst : in std_logic --clock e reset
            );
        end component;

    --SIGNALS

    begin
end architecture;
