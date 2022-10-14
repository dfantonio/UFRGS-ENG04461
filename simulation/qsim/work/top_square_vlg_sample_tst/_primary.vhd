library verilog;
use verilog.vl_types.all;
entity top_square_vlg_sample_tst is
    port(
        btn_rst_n       : in     vl_logic;
        clk_50m         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end top_square_vlg_sample_tst;
