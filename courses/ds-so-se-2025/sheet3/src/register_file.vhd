library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cpu_constants_pkg.DATA_TYPE;
use work.cpu_constants_pkg.REGISTER_LIST;

entity REGISTER_FILE is
    port(
        CLK : in std_logic;
        REG_A_ADDRESS : in std_logic_vector(4 downto 0);
        REG_A : out DATA_TYPE;
        REG_B_ADDRESS : in std_logic_vector(4 downto 0);
        REG_B : out DATA_TYPE;
        REG_WRITE_ADDRESS : in std_logic_vector(4 downto 0);
        WRITE_DATA : in DATA_TYPE := (others => '0');
        WRITE_ENABLE : in std_logic
    );
end;

architecture ARCH of REGISTER_FILE is
    signal registers : REGISTER_LIST := (others => (others => '0'));
begin
    REG_A <= registers(to_integer(unsigned(REG_A_ADDRESS)));
    REG_B <= registers(to_integer(unsigned(REG_B_ADDRESS)));

    process(CLK)
    begin
        if CLK = '1' AND CLK'event then
            if WRITE_ENABLE = '1' AND REG_WRITE_ADDRESS /= "00000" then
                registers(to_integer(unsigned(REG_WRITE_ADDRESS))) <= WRITE_DATA;
            end if;
        end if;
    end process;
end ARCH;
