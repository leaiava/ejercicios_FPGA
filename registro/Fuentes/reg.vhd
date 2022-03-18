library IEEE;
use IEEE.std_logic_1164.all;

entity reg is
	generic(
        N: natural := 4
        );
    port(
		clk_i   : in std_logic;
        srst_i  : in std_logic;
        arst_i  : in std_logic;
        ena_i   : in std_logic;
        d_i     : in std_logic_vector(N-1 downto 0);
        q_o     : out std_logic_vector(N-1 downto 0)
	);
end;

architecture reg_arq of reg is
begin
    process (clk_i, arst_i)
    begin
        if arst_i = '1' then
            q_o <= (others => '0');
        elsif rising_edge(clk_i) then
            if srst_i = '1' then
                q_o <= (others => '0');
            elsif ena_i = '1' then
                q_o <= d_i;
            end if;
        end if;
    end process;
end;