library IEEE;
use IEEE.std_logic_1164.all;

entity ffd_tb is
end;

architecture ffd_tb_arq of ffd_tb is

    -- Declaracion de componnetnes
    component ffd is
        port(
            clk_i   : in std_logic;
            srst_i  : in std_logic;
            arst_i  : in std_logic;
            ena_i   : in std_logic;
            d_i     : in std_logic;
            q_o     : out std_logic
        );
    end component;

    signal clk_tb   : std_logic := '0';
    signal srst_tb  : std_logic := '0';
    signal arst_tb  : std_logic := '1';
    signal ena_tb   : std_logic := '1';
    signal d_tb     : std_logic := '1';
    signal q_tb     : std_logic;

begin
    clk_tb  <= not clk_tb after 10 ns;
    arst_tb <= '0' after  30 ns;
    d_tb    <= '0' after 300 ns;
    ena_tb  <= '0' after  50 ns, '1' after 400 ns;
    srst_tb <= '1' after 612 ns;

    DUT: ffd
        port map (
            clk_i  => clk_tb,
            srst_i => srst_tb,
            arst_i => arst_tb,
            ena_i  => ena_tb,
            d_i    => d_tb, 
            q_o    => q_tb
        );
    
end architecture;