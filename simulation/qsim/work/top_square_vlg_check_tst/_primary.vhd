library verilog;
use verilog.vl_types.all;
entity top_square_vlg_check_tst is
    port(
        vga_b           : in     vl_logic_vector(3 downto 0);
        vga_g           : in     vl_logic_vector(3 downto 0);
        vga_hsync       : in     vl_logic;
        vga_r           : in     vl_logic_vector(3 downto 0);
        vga_vsync       : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end top_square_vlg_check_tst;
