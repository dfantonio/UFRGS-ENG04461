package require -exact qsys 12.1

# module properties
set_module_property NAME {unsaved_export}
set_module_property DISPLAY_NAME {unsaved_export_display}

# default module properties
set_module_property VERSION {1.0}
set_module_property GROUP {default group}
set_module_property DESCRIPTION {default description}
set_module_property AUTHOR {author}

# Instances and instance parameters
# (disabled instances are intentionally culled)
add_instance clk_0 clock_source 13.0
set_instance_parameter_value clk_0 clockFrequency {50000000.0}
set_instance_parameter_value clk_0 clockFrequencyKnown {1}
set_instance_parameter_value clk_0 resetSynchronousEdges {NONE}

add_instance pll_0 altera_pll 13.0
set_instance_parameter_value pll_0 gui_device_speed_grade {2}
set_instance_parameter_value pll_0 gui_pll_mode {Integer-N PLL}
set_instance_parameter_value pll_0 gui_reference_clock_frequency {50.0}
set_instance_parameter_value pll_0 gui_channel_spacing {0.0}
set_instance_parameter_value pll_0 gui_operation_mode {normal}
set_instance_parameter_value pll_0 gui_feedback_clock {Global Clock}
set_instance_parameter_value pll_0 gui_fractional_cout {32}
set_instance_parameter_value pll_0 gui_dsm_out_sel {1st_order}
set_instance_parameter_value pll_0 gui_use_locked {1}
set_instance_parameter_value pll_0 gui_en_adv_params {0}
set_instance_parameter_value pll_0 gui_number_of_clocks {1}
set_instance_parameter_value pll_0 gui_multiply_factor {1}
set_instance_parameter_value pll_0 gui_frac_multiply_factor {1.0}
set_instance_parameter_value pll_0 gui_divide_factor_n {1}
set_instance_parameter_value pll_0 gui_output_clock_frequency0 {25.2}
set_instance_parameter_value pll_0 gui_divide_factor_c0 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency0 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units0 {ps}
set_instance_parameter_value pll_0 gui_phase_shift0 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg0 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift0 {0}
set_instance_parameter_value pll_0 gui_duty_cycle0 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency1 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c1 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency1 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units1 {ps}
set_instance_parameter_value pll_0 gui_phase_shift1 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg1 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift1 {0}
set_instance_parameter_value pll_0 gui_duty_cycle1 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency2 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c2 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency2 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units2 {ps}
set_instance_parameter_value pll_0 gui_phase_shift2 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg2 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift2 {0}
set_instance_parameter_value pll_0 gui_duty_cycle2 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency3 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c3 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency3 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units3 {ps}
set_instance_parameter_value pll_0 gui_phase_shift3 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg3 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift3 {0}
set_instance_parameter_value pll_0 gui_duty_cycle3 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency4 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c4 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency4 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units4 {ps}
set_instance_parameter_value pll_0 gui_phase_shift4 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg4 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift4 {0}
set_instance_parameter_value pll_0 gui_duty_cycle4 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency5 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c5 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency5 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units5 {ps}
set_instance_parameter_value pll_0 gui_phase_shift5 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg5 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift5 {0}
set_instance_parameter_value pll_0 gui_duty_cycle5 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency6 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c6 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency6 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units6 {ps}
set_instance_parameter_value pll_0 gui_phase_shift6 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg6 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift6 {0}
set_instance_parameter_value pll_0 gui_duty_cycle6 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency7 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c7 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency7 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units7 {ps}
set_instance_parameter_value pll_0 gui_phase_shift7 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg7 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift7 {0}
set_instance_parameter_value pll_0 gui_duty_cycle7 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency8 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c8 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency8 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units8 {ps}
set_instance_parameter_value pll_0 gui_phase_shift8 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg8 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift8 {0}
set_instance_parameter_value pll_0 gui_duty_cycle8 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency9 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c9 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency9 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units9 {ps}
set_instance_parameter_value pll_0 gui_phase_shift9 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg9 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift9 {0}
set_instance_parameter_value pll_0 gui_duty_cycle9 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency10 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c10 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency10 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units10 {ps}
set_instance_parameter_value pll_0 gui_phase_shift10 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg10 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift10 {0}
set_instance_parameter_value pll_0 gui_duty_cycle10 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency11 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c11 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency11 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units11 {ps}
set_instance_parameter_value pll_0 gui_phase_shift11 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg11 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift11 {0}
set_instance_parameter_value pll_0 gui_duty_cycle11 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency12 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c12 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency12 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units12 {ps}
set_instance_parameter_value pll_0 gui_phase_shift12 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg12 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift12 {0}
set_instance_parameter_value pll_0 gui_duty_cycle12 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency13 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c13 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency13 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units13 {ps}
set_instance_parameter_value pll_0 gui_phase_shift13 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg13 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift13 {0}
set_instance_parameter_value pll_0 gui_duty_cycle13 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency14 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c14 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency14 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units14 {ps}
set_instance_parameter_value pll_0 gui_phase_shift14 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg14 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift14 {0}
set_instance_parameter_value pll_0 gui_duty_cycle14 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency15 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c15 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency15 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units15 {ps}
set_instance_parameter_value pll_0 gui_phase_shift15 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg15 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift15 {0}
set_instance_parameter_value pll_0 gui_duty_cycle15 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency16 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c16 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency16 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units16 {ps}
set_instance_parameter_value pll_0 gui_phase_shift16 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg16 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift16 {0}
set_instance_parameter_value pll_0 gui_duty_cycle16 {50}
set_instance_parameter_value pll_0 gui_output_clock_frequency17 {100.0}
set_instance_parameter_value pll_0 gui_divide_factor_c17 {1}
set_instance_parameter_value pll_0 gui_actual_output_clock_frequency17 {0 MHz}
set_instance_parameter_value pll_0 gui_ps_units17 {ps}
set_instance_parameter_value pll_0 gui_phase_shift17 {0}
set_instance_parameter_value pll_0 gui_phase_shift_deg17 {0}
set_instance_parameter_value pll_0 gui_actual_phase_shift17 {0}
set_instance_parameter_value pll_0 gui_duty_cycle17 {50}
set_instance_parameter_value pll_0 gui_pll_auto_reset {Off}
set_instance_parameter_value pll_0 gui_pll_bandwidth_preset {Auto}
set_instance_parameter_value pll_0 gui_en_reconf {0}
set_instance_parameter_value pll_0 gui_en_dps_ports {0}
set_instance_parameter_value pll_0 gui_en_phout_ports {0}
set_instance_parameter_value pll_0 gui_mif_generate {0}
set_instance_parameter_value pll_0 gui_enable_mif_dps {0}
set_instance_parameter_value pll_0 gui_dps_cntr {C0}
set_instance_parameter_value pll_0 gui_dps_num {1}
set_instance_parameter_value pll_0 gui_dps_dir {Positive}
set_instance_parameter_value pll_0 gui_refclk_switch {0}
set_instance_parameter_value pll_0 gui_refclk1_frequency {100.0}
set_instance_parameter_value pll_0 gui_switchover_mode {Automatic Switchover}
set_instance_parameter_value pll_0 gui_switchover_delay {0}
set_instance_parameter_value pll_0 gui_active_clk {0}
set_instance_parameter_value pll_0 gui_clk_bad {0}
set_instance_parameter_value pll_0 gui_enable_cascade_out {0}
set_instance_parameter_value pll_0 gui_enable_cascade_in {0}
set_instance_parameter_value pll_0 gui_pll_cascading_mode {Create an adjpllin signal to connect with an upstream PLL}

# connections and connection parameters
add_connection clk_0.clk pll_0.refclk clock

# exported interfaces
add_interface clk clock sink
set_interface_property clk EXPORT_OF clk_0.clk_in
add_interface reset reset sink
set_interface_property reset EXPORT_OF clk_0.clk_in_reset
add_interface pll_0_reset reset sink
set_interface_property pll_0_reset EXPORT_OF pll_0.reset
add_interface pll_0_outclk0 clock source
set_interface_property pll_0_outclk0 EXPORT_OF pll_0.outclk0
add_interface pll_0_locked conduit end
set_interface_property pll_0_locked EXPORT_OF pll_0.locked
