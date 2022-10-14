library verilog;
use verilog.vl_types.all;
entity controle_geral is
    port(
        clock_50M       : in     vl_logic;
        vga_hsync       : out    vl_logic;
        vga_vsync       : out    vl_logic;
        vga_r           : out    vl_logic_vector(9 downto 0);
        vga_g           : out    vl_logic_vector(9 downto 0);
        vga_b           : out    vl_logic_vector(9 downto 0);
        clock_25M       : out    vl_logic;
        vga_blank       : out    vl_logic
    );
end controle_geral;
