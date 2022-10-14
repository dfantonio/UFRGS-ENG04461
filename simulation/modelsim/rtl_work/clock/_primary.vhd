library verilog;
use verilog.vl_types.all;
entity clock is
    port(
        clk_50m         : in     vl_logic;
        rst             : in     vl_logic;
        clk_reduzido    : out    vl_logic
    );
end clock;
