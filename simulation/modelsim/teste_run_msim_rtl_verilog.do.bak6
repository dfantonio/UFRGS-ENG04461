transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/anton/Documents/Projetos/pong-fpga {C:/Users/anton/Documents/Projetos/pong-fpga/simple_480p.sv}
vlog -sv -work work +incdir+C:/Users/anton/Documents/Projetos/pong-fpga {C:/Users/anton/Documents/Projetos/pong-fpga/clock_480p.sv}
vlog -sv -work work +incdir+C:/Users/anton/Documents/Projetos/pong-fpga {C:/Users/anton/Documents/Projetos/pong-fpga/top_square.sv}

