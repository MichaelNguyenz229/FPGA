library verilog;
use verilog.vl_types.all;
entity first_practice is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        add_out         : out    vl_logic_vector(31 downto 0)
    );
end first_practice;
