library IEEE;
use IEEE.std_logic_1164.all;

entity sumNb is
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
end;

architecture sumNb_arq of sumNb is

    component sum1b is
        port(
            a_i : in std_logic;
            b_i : in std_logic;
            cy_i : in std_logic;
            s_o : out std_logic;
            cy_o : out std_logic
        );
    end component;

    signal cy_aux: std_logic_vector(N downto 0);

begin
    cy_aux(0)   <= cy_i;
    cy_o        <= cy_aux(N);
    
    sumN_gen: for i in 0 to N-1 generate
        sum1b_i: sum1b
            port map(
            a_i     => a_i(i),
            b_i     => b_i(i),
            cy_i    => cy_aux(i), --podría haber puesto directamente cy_i y no ponia la sentencia de arriba
            s_o     => s_o(i),
            cy_o    => cy_aux(i+1)
            );
    end generate;
end;