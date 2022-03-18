library IEEE;
use IEEE.std_logic_1164.all;

entity sum1b_tb is
end;

architecture sum1b_tb_arq of sum1b_tb is

    -- Declaracion de componnetnes
    component sum1b is
        port(
            a_i : in std_logic;
            b_i : in std_logic;
            cy_i : in std_logic;
            s_o : out std_logic;
            cy_o : out std_logic
        );
        end component;

    signal a_tb: std_logic := '0';
    signal b_tb: std_logic := '0';
    signal s_tb: std_logic;
    signal cy_i_tb: std_logic := '0';
    signal cy_o_tb: std_logic;

begin
    -- a_tb <= '1', '0' after 100 ns, '1' after 150 ns
    a_tb <= not a_tb after 10 ns;
    b_tb <= not b_tb after 20 ns;
    cy_i_tb <= not cy_i_tb after 40 ns;
    
    DUT: sum1b
        port map (
            a_i     => a_tb,
            b_i     => b_tb,
            cy_i    => cy_i_tb,
            s_o     => s_tb,
            cy_o    => cy_o_tb
        );

end architecture;