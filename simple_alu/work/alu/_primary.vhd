library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        mode            : in     vl_logic_vector(1 downto 0);
        result          : out    vl_logic_vector(3 downto 0)
    );
end alu;
