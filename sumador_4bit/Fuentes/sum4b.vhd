library IEEE;
use IEEE.std_logic_1164.all;

entity sum4b is
	port(
		a_i : in std_logic_vector(3 downto 0);
        b_i : in std_logic_vector(3 downto 0);
        cy_i : in std_logic;
        s_o : out std_logic_vector(3 downto 0);
        cy_o : out std_logic
	);
end;

architecture sum4b_arq of sum4b is

    component sum1b is
        port(
            a_i : in std_logic;
            b_i : in std_logic;
            cy_i : in std_logic;
            s_o : out std_logic;
            cy_o : out std_logic
        );
    end component;

    signal cy_aux: std_logic_vector(4 downto 0);

begin
    cy_aux(0)   <= cy_i;
    cy_o        <= cy_aux(4);
    sum1b_0: sum1b
        port map(
            a_i     => a_i(0),
            b_i     => b_i(0),
            cy_i    => cy_aux(0), --podría haber puesto directamente cy_i y no ponia la sentencia de arriba
            s_o     => s_o(0),
            cy_o    => cy_aux(1)
        );
    sum1b_1: sum1b
        port map(
            a_i     => a_i(1),
            b_i     => b_i(1),
            cy_i    => cy_aux(1),
            s_o     => s_o(1),
            cy_o    => cy_aux(2)
        );
    sum1b_2: sum1b
        port map(
            a_i     => a_i(2),
            b_i     => b_i(2),
            cy_i    => cy_aux(2),
            s_o     => s_o(2),
            cy_o    => cy_aux(3)
        );
    sum1b_3: sum1b
        port map(
            a_i     => a_i(3),
            b_i     => b_i(3),
            cy_i    => cy_aux(3),
            s_o     => s_o(3),
            cy_o    => cy_aux(4)
        );    
end;