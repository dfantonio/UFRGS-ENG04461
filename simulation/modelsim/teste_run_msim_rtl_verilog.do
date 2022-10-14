transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/anton/Documents/Projetos/pong-fpga {C:/Users/anton/Documents/Projetos/pong-fpga/vga.sv}
vlog -sv -work work +incdir+C:/Users/anton/Documents/Projetos/pong-fpga {C:/Users/anton/Documents/Projetos/pong-fpga/controle_geral.sv}
vlog -sv -work work +incdir+C:/Users/anton/Documents/Projetos/pong-fpga {C:/Users/anton/Documents/Projetos/pong-fpga/clock.sv}

