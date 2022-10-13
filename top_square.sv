// Project F: FPGA Graphics - Square (Arty Pmod VGA)
// (C)2022 Will Green, open source hardware released under the MIT License
// Learn more at https://projectf.io/posts/fpga-graphics/

`default_nettype none
`timescale 10ns / 10ns

module top_square (
    input  wire logic clk_50m,     // 100 MHz clock
    input  wire logic btn_rst_n,    // reset button
    output      logic vga_hsync,    // VGA horizontal sync
    output      logic vga_vsync,    // VGA vertical sync
    output      logic [3:0] vga_r,  // 4-bit VGA red
    output      logic [3:0] vga_g,  // 4-bit VGA green
    output      logic [3:0] vga_b,   // 4-bit VGA blue
	  output      logic [9:0] TESTE
	 );

    // generate pixel clock
    logic clk_pix;
    logic clk_pix_locked = 1;
    clock_480p clock_pix_inst (
       .clk_50m,
       .rst(!btn_rst_n),  // reset button is active low
       .clk_pix
    );

    // display sync signals and coordinates
    localparam CORDW = 10;  // screen coordinate width in bits
    logic [CORDW-1:0] sx, sy;
    logic hsync, vsync, de;
    simple_480p display_inst (
        clk_pix,
        0,  // wait for clock lock
        sx,
        sy,
        hsync,
        vsync,
        de
    );

    // define a square with screen coordinates
    logic square;
    always_comb begin
        square = (sx > 220 && sx < 420) && (sy > 140 && sy < 340);
    end

    // paint colours: white inside square, blue outside
    logic [3:0] paint_r, paint_g, paint_b;
    always_comb begin
        paint_r = (square) ? 4'hF : 4'h1;
        paint_g = (square) ? 4'hF : 4'h3;
        paint_b = (square) ? 4'hF : 4'h7;
    end

    // VGA Pmod output
    always_ff @(posedge clk_pix) begin
        // vga_hsync <= hsync;
        vga_hsync = square;
        vga_vsync <= vsync;
		    TESTE <= sy;
		  
        if (de) begin
            vga_r <= paint_r;
            vga_g <= paint_g;
            vga_b <= paint_b;
        end else begin  // VGA colour should be black in blanking interval
            vga_r <= 4'h0;
            vga_g <= 4'h0;
            vga_b <= 4'h0;
        end
    end
endmodule

module top_square_tb;
  reg clk, reset;
  wire vga_hsync, vga_vsync;
  logic [3:0] vga_r;
  logic [3:0] vga_g;
  logic [3:0] vga_b;
  logic [9:0] TESTE;

	parameter stimDelay = 1;

  top_square gerador_vga (clk,reset, vga_hsync, vga_vsync, vga_r, vga_g, vga_b,TESTE);

  initial begin
    clk=0;
    reset=0;
    forever begin
      #(stimDelay)
      clk = ~clk;
    end
  end

  initial begin
    #5
    reset=1;
    // Fazer alguma coisa
  end

endmodule