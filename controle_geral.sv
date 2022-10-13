`default_nettype none
`timescale 10ns / 10ns

module controle_geral (
  input wire logic clock_50M,
  output     logic vga_hsync,    // VGA horizontal sync
  output     logic vga_vsync,    // VGA vertical sync
  output     logic [9:0] vga_r,  // 10-bit VGA red
  output     logic [9:0] vga_g,  // 10-bit VGA green
  output     logic [9:0] vga_b   // 10-bit VGA blue
);

  logic clock_saida;

  clock instancia_clock (
    clock_50M,
    1'b0,
    clock_saida
  );

  logic [9:0] sx;
  logic [9:0] sy;
  logic hsync, vsync, de;
  vga instancia_vga (
    clock_saida,
    1'b0,
    sx,
    sy,
    hsync,
    vsync,
    de
  );

// Acho que pode remover isso
  initial begin
    vga_r = 10'h0;
    vga_g = 10'h0;
    vga_b = 10'h0;
    vga_hsync = 1'b1;
    vga_vsync = 1'b1;
  end

  // define a square with screen coordinates
  logic square;
  always_comb begin
      square = (sx > 220 && sx < 420) && (sy > 140 && sy < 340);
  end

  // paint colours: white inside square, blue outside
  logic [9:0] paint_r = 10'h0, paint_g = 10'h0, paint_b = 10'h0;
  always_comb begin
      paint_r = (square) ? 10'hFFF : 10'h111;
      paint_g = (square) ? 10'hFFF : 10'h333;
      paint_b = (square) ? 10'hFFF : 10'h777;
  end

  // VGA Pmod output
  always_ff @(posedge clock_saida) begin
      vga_hsync = hsync;
      vga_vsync = vsync;
	  
    // Faz o sinal ter 8 bits
      if (de) begin
          // vga_r <= paint_r;
          // vga_g <= paint_g;
          // vga_b <= paint_b;
          vga_r <= 10'd512;
          vga_g <= 10'd512;
          vga_b <= 10'd512;
      end else begin  // VGA colour should be black in blanking interval
          vga_r <= 10'h0;
          vga_g <= 10'h0;
          vga_b <= 10'h0;
      end
  end

endmodule

module controle_geral_tb;
  reg clk;
  wire vga_hsync, vga_vsync;
  wire [9:0] vga_r;
  wire [9:0] vga_g;
  wire [9:0] vga_b;

	parameter stimDelay = 1;
  controle_geral teste_instancia (clk, vga_hsync, vga_vsync, vga_r, vga_g, vga_b);

  initial begin
    clk=0;
    forever begin
      #(stimDelay)
      clk = ~clk;
    end  
  end

endmodule