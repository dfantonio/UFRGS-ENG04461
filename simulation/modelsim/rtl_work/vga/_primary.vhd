library verilog;
use verilog.vl_types.all;
entity vga is
    generic(
        HA_END          : integer := 639;
        HS_STA          : vl_notype;
        HS_END          : vl_notype;
        LINE            : integer := 799;
        VA_END          : integer := 479;
        VS_STA          : vl_notype;
        VS_END          : vl_notype;
        SCREEN          : integer := 524
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        sx              : out    vl_logic_vector(9 downto 0);
        sy              : out    vl_logic_vector(9 downto 0);
        hsync           : out    vl_logic;
        vsync           : out    vl_logic;
        de              : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of HA_END : constant is 1;
    attribute mti_svvh_generic_type of HS_STA : constant is 3;
    attribute mti_svvh_generic_type of HS_END : constant is 3;
    attribute mti_svvh_generic_type of LINE : constant is 1;
    attribute mti_svvh_generic_type of VA_END : constant is 1;
    attribute mti_svvh_generic_type of VS_STA : constant is 3;
    attribute mti_svvh_generic_type of VS_END : constant is 3;
    attribute mti_svvh_generic_type of SCREEN : constant is 1;
end vga;
