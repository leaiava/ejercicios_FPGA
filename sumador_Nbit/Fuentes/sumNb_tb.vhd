library IEEE;
use IEEE.std_logic_1164.all;

entity sumNb_tb is
end;

architecture sumNb_tb_arq of sumNb_tb is

    -- Declaracion de componnetnes
    component sumNb is
        generic(
            N: natural := 4
        );
        port(
            a_i : in std_logic_vector(N-1 downto 0);
            b_i : in std_logic_vector(N-1 downto 0);
            cy_i : in std_logic;
            s_o : out std_logic_vector(N-1 downto 0);
            cy_o : out std_logic
        );
        end component;

    constant N_tb: natural:= 8;

    signal a_tb: std_logic_vector(N_tb-1 downto 0) := "00000000";
    signal b_tb: std_logic_vector(N_tb-1 downto 0) := "00000000";
    signal s_tb: std_logic_vector(N_tb-1 downto 0);
    signal cy_i_tb: std_logic := '0';
    signal cy_o_tb: std_logic;

begin
    -- a_tb <= '1', '0' after 100 ns, '1' after 150 ns
    a_tb <= "00000011" after 100 ns;
    b_tb <= "00000101" after 200 ns;
    cy_i_tb <= '1' after 300 ns, '0' after 400 ns;
    
    DUT: sumNb
        generic map(
            N => N_tb
        )
        port map (
            a_i     => a_tb,
            b_i     => b_tb,
            cy_i    => cy_i_tb,
            s_o     => s_tb,
            cy_o    => cy_o_tb
        );
    
end;