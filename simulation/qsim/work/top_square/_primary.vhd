library verilog;
use verilog.vl_types.all;
entity top_square is
    port(
        clk_100m        : in     vl_logic;
        btn_rst_n       : in     vl_logic;
        vga_hsync       : out    vl_logic;
        vga_vsync       : out    vl_logic;
        vga_r           : out    vl_logic_vector(3 downto 0);
        vga_g           : out    vl_logic_vector(3 downto 0);
        vga_b           : out    vl_logic_vector(3 downto 0)
    );
end top_square;
