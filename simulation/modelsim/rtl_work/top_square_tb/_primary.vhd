library verilog;
use verilog.vl_types.all;
entity top_square_tb is
    generic(
        stimDelay       : integer := 1
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of stimDelay : constant is 1;
end top_square_tb;
