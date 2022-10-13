library verilog;
use verilog.vl_types.all;
entity simple_480p_vlg_sample_tst is
    port(
        clk_pix         : in     vl_logic;
        rst_pix         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end simple_480p_vlg_sample_tst;
