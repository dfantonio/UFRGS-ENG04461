`default_nettype none `timescale 10ns / 10ns

module pong_game (
    input  wire logic       clock_50M,
    output logic            vga_hsync,  // VGA horizontal sync
    output logic            vga_vsync,  // VGA vertical sync
    output logic      [9:0] vga_r,      // 10-bit VGA red
    output logic      [9:0] vga_g,      // 10-bit VGA green
    output logic      [9:0] vga_b,      // 10-bit VGA blue
    output logic            clock_25M,  // 25 MHz clock for the VGA DAC
    output logic            vga_blank   // VGA DAC blank pin
);
  clock_25M inst_clock_25M (
      clock_50M,
      1'b0,
      clock_25M
  );

  logic [9:0] sx;
  logic [9:0] sy;
  logic hsync, vsync, de;
  vga instancia_vga (
      clock_25M,
      1'b0,
      sx,
      sy,
      hsync,
      vsync,
      de
  );

  initial begin
    vga_r = 10'h0;
    vga_g = 10'h0;
    vga_b = 10'h0;
    vga_hsync = 1'b1;
    vga_vsync = 1'b1;
    vga_blank = 1'b1;
  end

  // define a square with screen coordinates
  logic square;
  always_comb begin
    square = (sx > 220 && sx < 420) && (sy > 140 && sy < 340);
  end

  // paint colours: white inside square, blue outside
  logic [9:0] paint_r, paint_g, paint_b;
  always_comb begin
    paint_r = (square) ? 10'hFFF : 10'h111;
    paint_g = (square) ? 10'hFFF : 10'h333;
    paint_b = (square) ? 10'hFFF : 10'h777;
  end

  // VGA Pmod output
  always_ff @(posedge clock_25M) begin
    vga_hsync = hsync;
    vga_vsync = vsync;

    // Faz o sinal ter 8 bits
    if (de) begin
      vga_r <= paint_r;
      vga_g <= paint_g;
      vga_b <= paint_b;
    end else begin  // VGA colour should be black in blanking interval
      vga_r <= 10'h0;
      vga_g <= 10'h0;
      vga_b <= 10'h0;
    end
  end
endmodule

module pong_game_tb;
  reg clk;
  wire vga_hsync, vga_vsync;
  wire [9:0] vga_r;
  wire [9:0] vga_g;
  wire [9:0] vga_b;
  wire clock_25M, vga_blank;

  parameter stimDelay = 1;
  pong_game teste_instancia (
      clk,
      vga_hsync,
      vga_vsync,
      vga_r,
      vga_g,
      vga_b,
      clock_25M,
      vga_blank
  );

  initial begin
    clk = 0;
    forever begin
      #(stimDelay) clk = ~clk;
    end
  end

endmodule
