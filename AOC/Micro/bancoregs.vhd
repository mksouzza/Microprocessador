library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bancoregs is --MUDAR ISSO TALVEZ(?)
    port(
            reg0, reg1, reg_write : in unsigned(2 downto 0);
            bus_write : in unsigned(15 downto 0);
            clk, rst, write_enab : in std_logic;
            reg0_out, reg1_out : unsigned(15 downto 0)
        );
end bancoregs;

architecture a_bancoregs of bancoregs is
    component regs is
        port
        (
            bus_write : in unsigned(15 downto 0); -- barramento de escrita
            bus_read: out unsigned(15 downto 0); -- barramentos de leitura
            write_enab : in std_logic; -- enable de escrita
            clk, rst : in std_logic --clock e reset
        );
    end component;

    -- DECODER PARA O ENABLER
    component decoder is
        port
        (
            code : in unsigned(2 downto 0);
            en : in std_logic;
            out1, out2, out3, out4, out5, out6, out7 : out std_logic 
        );
    end component;

    signal out0 : unsigned(15 downto 0) := "0000000000000000";
    signal out1, out2, out3, out4, out5, out6, out7, out8: unsigned(15 downto 0);
    signal en1, en2, en3, en4, en5, en6, en7: std_logic;
    signal enable : std_logic := '0';

    begin
       r0 : regs port map
        (
            clk => clk,
            rst => '1',
            bus_read => out0,
            bus_write => "0000000000000000",
            write_enab => '0'
        );

        r1 : regs port map
        (
            clk => clk,
            rst => '1',
            bus_read => out1,
            bus_write => bus_write,
            write_enab => en1
        );

        r2 : regs port map
        (
            clk => clk,
            rst => '1',
            bus_read => out2,
            bus_write => bus_write,
            write_enab => en2
        );

        r3 : regs port map
        (
            clk => clk,
            rst => '1',
            bus_read => out3,
            bus_write => bus_write,
            write_enab => en3
        );

        r4 : regs port map
        (
            clk => clk,
            rst => '1',
            bus_read => out4,
            bus_write => bus_write,
            write_enab => en4
        );

        r5 : regs port map
        (
            clk => clk,
            rst => '1',
            bus_read => out5,
            bus_write => bus_write,
            write_enab => en5
        );

        r6 : regs port map
        (
            clk => clk,
            rst => '1',
            bus_read => out6,
            bus_write => bus_write,
            write_enab => en6
        );

        r7 : regs port map
        (
            clk => clk,
            rst => '1',
            bus_read => out7,
            bus_write => bus_write,
            write_enab => en7
        );

        decode : decoder port map
        (
            code => reg_write,
            en => write_enab,
            out1 => en1,
            out2 => en2,
            out3 => en3,
            out4 => en4,
            out5 => en5,
            out6 => en6,
            out7 => en7
        );
end architecture;
