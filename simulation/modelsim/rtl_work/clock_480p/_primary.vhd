library verilog;
use verilog.vl_types.all;
entity clock_480p is
    port(
        clk_50m         : in     vl_logic;
        rst             : in     vl_logic;
        clk_pix         : out    vl_logic
    );
end clock_480p;
