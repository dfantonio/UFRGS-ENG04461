// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// *****************************************************************************
// This file contains a Verilog test bench template that is freely editable to  
// suit user's needs .Comments are provided in each section to help the user    
// fill out necessary details.                                                  
// *****************************************************************************
// Generated on "10/12/2022 13:14:20"
                                                                                
// Verilog Test Bench template for design : clock_480p
// 
// Simulation tool : ModelSim-Altera (Verilog)
// 

`timescale 1 ps/ 1 ps
module clock_480p_vlg_tst();
// constants                                           
// general purpose registers
reg eachvec;
// test vector input registers
reg btn_rst_n;
reg clk_100m;
reg clk_pix;
// wires                                               
wire [9:0]  TESTE;
wire [3:0]  vga_b;
wire [3:0]  vga_g;
wire vga_hsync;
wire [3:0]  vga_r;
wire vga_vsync;

// assign statements (if any)                          
clock_480p i1 (
// port map - connection between master ports and signals/registers   
	.clk_100m(clk_100m),
	.btn_rst_n(btn_rst_n),
	.clk_pix(clk_pix)
);
initial                                                
begin                                                  
// code that executes only once                        
// insert code here --> begin                          
                                                       
// --> end                                             
$display("Running testbench");                       
end                                                    
always                                                 
// optional sensitivity list                           
// @(event1 or event2 or .... eventn)                  
begin                                                  
// code executes for every event on sensitivity list   
// insert code here --> begin                          
                                                       
@eachvec;                                              
// --> end                                             
end                                                    
endmodule

