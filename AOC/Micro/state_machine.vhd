library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity state_machine is
    port(
            clk, rst : in std_logic;
            state : out unsigned(1 downto 0)
        );
end entity;

architecture a_state_machine of state_machine is
    signal state_up : unsigned(1 downto 0);
    begin
        process(clk, rst)
        begin
            if rst = '1' then
                state_up <= "00";
            elsif rising_edge(clk) then
                if state_up = "10" then
                    state_up <= "00";
                else
                    state_up <= state_up + 1;
                end if;
            end if;
        end process;
        state <= state_up;
end architecture;