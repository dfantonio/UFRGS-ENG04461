library verilog;
use verilog.vl_types.all;
entity simple_480p_vlg_check_tst is
    port(
        de              : in     vl_logic;
        hsync           : in     vl_logic;
        sx              : in     vl_logic_vector(9 downto 0);
        sy              : in     vl_logic_vector(9 downto 0);
        vsync           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end simple_480p_vlg_check_tst;
