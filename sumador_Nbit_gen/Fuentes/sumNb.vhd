library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

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
    signal a_aux: std_logic_vector(N+1 downto 0); -- Agrego un bit al inicio y uno al final, por eso en N+1
    signal b_aux: std_logic_vector(N+1 downto 0);
    signal s_aux: std_logic_vector(N+1 downto 0);

begin
    a_aux <= '0' & a_i & cy_i;
    b_aux <= '0' & b_i & '1';

    s_aux <= std_logic_vector(unsigned(a_aux) + unsigned(b_aux)); -- casteo porque no puedo sumar std_logic
    
    s_o <= s_aux(N downto 1);
    cy_o <= s_aux(N+1);
end;