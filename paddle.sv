`default_nettype none `timescale 10ns / 10ns

module paddle (
    input wire logic [9:0] sy,  // vertical screen position
    input wire logic [9:0] pad_top_pixel,  // paddle top position
    output logic draw_paddle = 0  // return 1 when pixel should be white to paint the paddle
);
  parameter PADDLE_HEIGHT = 100;

  always_comb begin
    if (sy >= pad_top_pixel && sy < (pad_top_pixel + PADDLE_HEIGHT)) draw_paddle = 1;
    else draw_paddle = 0;
  end
endmodule

module paddle_tb;
  logic [9:0] sy = 0;
  wire draw_paddle;

  parameter stimDelay = 2;

  paddle inst_paddle (
      sy,
      100,
      draw_paddle
  );

  initial begin
    forever begin
      #(stimDelay) sy = sy + 1;
      if (sy > 480) sy = 0;
    end
  end
endmodule
