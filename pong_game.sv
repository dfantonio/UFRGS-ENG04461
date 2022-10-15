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
  parameter SCREEN_WIDTH = 640;
  parameter SCREEN_HEIGHT = 480;
  parameter PADDLE_HORIZONTAL_OFFSET = 20;
  parameter PADDLE_HEIGHT = 100;
  parameter PADDLE_WIDTH = 10;
  parameter BORDER_WIDTH = 7;
  parameter BALL_SIZE = 7;  // Has to be and odd number
  parameter BALL_SPEED = 3;
  parameter BORDER_OFFSET = 5;

  parameter COLOR_WHITE = 10'd1023;
  parameter COLOR_BLACK = 10'd0;

  clock_25M_divider inst_clock_25M (
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

  logic draw_paddle_left;
  logic [9:0] pad_left_position;
  paddle inst_paddle_left (
      .sy,
      .pad_top_pixel(pad_left_position),
      .draw_paddle  (draw_paddle_left)
  );

  logic draw_paddle_right;
  logic [9:0] pad_right_position;
  paddle inst_paddle_right (
      .sy,
      .pad_top_pixel(pad_right_position),
      .draw_paddle  (draw_paddle_right)
  );

  logic draw_number;
  logic [3:0] TEMP_number_counter = 9;
  number_gen inst_number_gen_left (
      .clk(clock_25M),
      .sx(sx),
      .sy(sy),
      .number_x(100),
      .number_y(100),
      .number(TEMP_number_counter),
      .draw_number(draw_number)
  );

  // Ball variables
  logic draw_ball;
  logic [9:0] ball_x, ball_y;
  logic ball_dy, ball_dx;

  logic frame;  // high for one clock tick at the start of vertical blanking
  always_comb frame = (sy == SCREEN_HEIGHT && sx == 0);

  initial begin
    vga_r = 10'h0;
    vga_g = 10'h0;
    vga_b = 10'h0;
    vga_hsync = 1'b1;
    vga_vsync = 1'b1;
    vga_blank = 1'b1;
    ball_dy = 1;
    ball_dx = 1;
    pad_left_position = 0;
    pad_right_position = 0;
  end

  // paint colours: white inside square, blue outside
  logic enable_paddle_left, enable_paddle_right, draw_border, draw_x, draw_y;
  logic [9:0] paint_r, paint_g, paint_b;
  always_comb begin
    enable_paddle_left = draw_paddle_left && (sx > PADDLE_HORIZONTAL_OFFSET && sx < (PADDLE_HORIZONTAL_OFFSET + PADDLE_WIDTH));
    enable_paddle_right = draw_paddle_right && (sx > (SCREEN_WIDTH - PADDLE_HORIZONTAL_OFFSET - PADDLE_WIDTH) && sx < (SCREEN_WIDTH - PADDLE_HORIZONTAL_OFFSET));

    // Ball logic
    draw_x = (sx - ball_x) >= 0 && (sx - ball_x) < BALL_SIZE;
    draw_y = (sy - ball_y) >= 0 && (sy - ball_y) < BALL_SIZE;
    draw_ball = draw_x && draw_y;

    if (enable_paddle_left || enable_paddle_right || draw_ball || draw_number) begin
      paint_r = COLOR_WHITE;
      paint_g = COLOR_WHITE;
      paint_b = COLOR_WHITE;
    end else begin
      paint_r = COLOR_BLACK;
      paint_g = COLOR_BLACK;
      paint_b = COLOR_BLACK;
    end
  end

  // VGA signal output
  always_ff @(posedge clock_25M) begin
    vga_hsync = hsync;
    vga_vsync = vsync;

    if (de) begin
      vga_r = paint_r;
      vga_g = paint_g;
      vga_b = paint_b;
    end else begin  // VGA colour should be black in blanking interval
      vga_r = 10'h0;
      vga_g = 10'h0;
      vga_b = 10'h0;
    end

    // Update the ball position once per frame
    if (frame) begin
      if (ball_dx) ball_x = ball_x + BALL_SPEED;
      else ball_x = ball_x - BALL_SPEED;

      if (ball_dy) ball_y = ball_y - BALL_SPEED;
      else ball_y = ball_y + BALL_SPEED;
    end

    if (ball_dy == 1 && (ball_y < BORDER_OFFSET))
      ball_dy = 0;  // If ball is moving up, should move down
    if (ball_dy == 0 && (ball_y > (SCREEN_HEIGHT - BORDER_OFFSET)))
      ball_dy = 1;  // If ball is moving down, should move up

    if (enable_paddle_left && draw_ball) ball_dx = 1;
    if (enable_paddle_right && draw_ball) begin
      ball_dx = 0;
      TEMP_number_counter = TEMP_number_counter + 1;
      // if (TEMP_number_counter > 5) TEMP_number_counter = 0;
    end

    //TODO: Mover o paddle com o controle
    pad_left_position  = ball_y;
    pad_right_position = ball_y;

    if (pad_left_position > (SCREEN_HEIGHT - PADDLE_HEIGHT))
      pad_left_position = SCREEN_HEIGHT - PADDLE_HEIGHT;
    if (pad_right_position > (SCREEN_HEIGHT - PADDLE_HEIGHT))
      pad_right_position = SCREEN_HEIGHT - PADDLE_HEIGHT;

  end
endmodule

// Testbench module
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
