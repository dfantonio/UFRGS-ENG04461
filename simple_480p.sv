`default_nettype none
`timescale 10ns / 10ns

module simple_480p (
    input  wire logic clk,   // pixel clock
    input  wire logic reset,   // reset in pixel clock domain
    output      logic [9:0] sx,  // horizontal screen position
    output      logic [9:0] sy,  // vertical screen position
    output      logic hsync,     // horizontal sync
    output      logic vsync,     // vertical sync
    output      logic de         // data enable (low in blanking interval)
    );

    // horizontal timings
    parameter HA_END = 639;           // end of active pixels
    parameter HS_STA = HA_END + 16;   // sync starts after front porch
    parameter HS_END = HS_STA + 96;   // sync ends
    parameter LINE   = 799;           // last pixel on line (after back porch)

    // vertical timings
    parameter VA_END = 479;           // end of active pixels
    parameter VS_STA = VA_END + 10;   // sync starts after front porch
    parameter VS_END = VS_STA + 2;    // sync ends
    parameter SCREEN = 524;           // last line on screen (after back porch)

    always_comb begin
        hsync = ~(sx >= HS_STA && sx < HS_END);  // invert: negative polarity
        vsync = ~(sy >= VS_STA && sy < VS_END);  // invert: negative polarity
        de = (sx <= HA_END && sy <= VA_END);
    end

    // calculate horizontal and vertical screen position
    always_ff @(posedge clk) begin
        if (sx == LINE) begin  // last pixel on line?
            sx <= 0;
            sy <= (sy == SCREEN) ? 0 : sy + 1;  // last line on screen?
        end else begin
            sx <= sx + 1;
        end
        if (reset) begin
            sx <= 0;
            sy <= 0;
        end
    end
endmodule

module simple_480p_tb;
  reg clk, reset;
  logic [9:0]sy;
  logic [9:0]sx;
  wire hsync, vsync, de;

	parameter stimDelay = 2;

  simple_480p controlador_VGA (clk, reset, sx, sy, hsync, vsync, de);

  initial begin 
    clk = 0;
    reset = 1;
    forever begin
      #(stimDelay)
      clk = ~clk;
    end 
  end

  initial begin
    #5
    reset=0;
  end

endmodule