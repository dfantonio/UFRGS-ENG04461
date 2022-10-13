library verilog;
use verilog.vl_types.all;
entity simple_480p is
    port(
        clk_pix         : in     vl_logic;
        rst_pix         : in     vl_logic;
        sx              : out    vl_logic_vector(9 downto 0);
        sy              : out    vl_logic_vector(9 downto 0);
        hsync           : out    vl_logic;
        vsync           : out    vl_logic;
        de              : out    vl_logic
    );
end simple_480p;
