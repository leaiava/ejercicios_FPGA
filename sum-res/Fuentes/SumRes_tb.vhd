library IEEE;
use IEEE.std_logic_1164.all;

entity SumRes_tb is
end;

architecture SumRes_tb_arq of SumRes_tb is

    -- Declaracion de componnetnes
    component SumRes is
        port(
            a_i : in std_logic_vector(3 downto 0);
            b_i : in std_logic_vector(3 downto 0);
            s_o : out std_logic_vector(3 downto 0);
            cy_o : out std_logic;
            sr : in std_logic
        );
        end component;

    signal a_tb: std_logic_vector(3 downto 0) := "0000";
    signal b_tb: std_logic_vector(3 downto 0) := "0000";
    signal s_tb: std_logic_vector(3 downto 0);
    signal sr_tb: std_logic := '0';
    signal cy_o_tb: std_logic;

begin
    -- a_tb <= '1', '0' after 100 ns, '1' after 150 ns
    a_tb <= "1011" after 100 ns;
    b_tb <= "0100"after 200 ns;
    sr_tb <= '0' after 300 ns, '1' after 400 ns,'0' after 600 ns ;
    
    DUT: SumRes
        port map (
            a_i     => a_tb,
            b_i     => b_tb,
            sr     => sr_tb,
            s_o     => s_tb,
            cy_o    => cy_o_tb
        );
    
end architecture;