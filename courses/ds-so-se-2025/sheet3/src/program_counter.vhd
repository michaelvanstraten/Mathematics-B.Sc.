library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cpu_constants_pkg.INSTRUCTION_MEM_ADDRESS_TYPE;
use work.cpu_constants_pkg.INSTRUCTION_MEM_START_ADDRESS;
entity program_counter is
    port(
        CLK : in std_logic;
        RESET : in std_logic;
        INSTRUCTION_ADDRESS_OFFSET_IN: in  INSTRUCTION_MEM_ADDRESS_TYPE;
        INSTRUCTION_ADDRESS_IN: in  INSTRUCTION_MEM_ADDRESS_TYPE;
        JAL_OR_BRANCH_TAKEN_IN: in std_logic;
        JALR_IN: in std_logic;
        INSTRUCTION_ADDRESS_OUT : out INSTRUCTION_MEM_ADDRESS_TYPE

    );
end entity program_counter;

architecture RTL of program_counter is

    signal pc_cs: INSTRUCTION_MEM_ADDRESS_TYPE;

begin
    process (RESET, CLK)
    begin
    -- TODO
    INSTRUCTION_ADDRESS_OUT <= (others => '0');
    end
end architecture RTL;
