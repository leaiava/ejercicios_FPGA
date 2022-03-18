library IEEE;
use IEEE.std_logic_1164.all;

entity SumRes is
	port(
		a_i : in std_logic_vector(3 downto 0);
        b_i : in std_logic_vector(3 downto 0);
        s_o : out std_logic_vector(3 downto 0);
        cy_o : out std_logic;
        sr : in std_logic
	);
end;

architecture SumRes_arq of SumRes is

    component sum4b is
        port(
            a_i : in std_logic_vector(3 downto 0);
            b_i : in std_logic_vector(3 downto 0);
            cy_i : in std_logic;
            s_o : out std_logic_vector(3 downto 0);
            cy_o : out std_logic
        );
    end component;

    signal b_xor: std_logic_vector(3 downto 0);
    
    begin
        b_xor <= b_i xor (3 downto 0 => sr);
    
    MiSumRes: sum4b
        port map(
            a_i     => a_i,
            b_i     => b_xor,
            cy_i    => sr,
            s_o     => s_o,
            cy_o    => cy_o
        );

end;