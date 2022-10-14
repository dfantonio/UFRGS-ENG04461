library verilog;
use verilog.vl_types.all;
entity controle_geral_tb is
    generic(
        stimDelay       : integer := 1
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of stimDelay : constant is 1;
end controle_geral_tb;
