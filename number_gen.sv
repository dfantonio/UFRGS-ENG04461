`default_nettype none `timescale 10ns / 10ns

module number_gen (
    input  wire logic       clk,             // pixel clock
    input  wire logic [9:0] sx,              // horizontal screen position
    input  wire logic [9:0] sy,              // vertical screen position
    input  wire logic [9:0] number_x,        // Start pixel X
    input  wire logic [9:0] number_y,        // Start pixel Y
    input  wire logic [3:0] number,          // Number to be drawn
    output logic            draw_number = 0  // Pixel output
);
  reg [0:15] numbers_map[9:0][19:0];

  initial begin
    // Number 0
    numbers_map[0][0]  = 16'b1111111111111111;
    numbers_map[0][1]  = 16'b1111111111111111;
    numbers_map[0][2]  = 16'b1100000000000011;
    numbers_map[0][3]  = 16'b1100000000000011;
    numbers_map[0][4]  = 16'b1100000000000011;
    numbers_map[0][5]  = 16'b1100000000000011;
    numbers_map[0][6]  = 16'b1100000000000011;
    numbers_map[0][7]  = 16'b1100000000000011;
    numbers_map[0][8]  = 16'b1100000000000011;
    numbers_map[0][9]  = 16'b1100000000000011;
    numbers_map[0][10] = 16'b1100000000000011;
    numbers_map[0][11] = 16'b1100000000000011;
    numbers_map[0][12] = 16'b1100000000000011;
    numbers_map[0][13] = 16'b1100000000000011;
    numbers_map[0][14] = 16'b1100000000000011;
    numbers_map[0][15] = 16'b1100000000000011;
    numbers_map[0][16] = 16'b1100000000000011;
    numbers_map[0][17] = 16'b1100000000000011;
    numbers_map[0][18] = 16'b1111111111111111;
    numbers_map[0][19] = 16'b1111111111111111;
    //Number 1
    numbers_map[1][0]  = 16'b0000000000000000;
    numbers_map[1][1]  = 16'b0000001110000000;
    numbers_map[1][2]  = 16'b0000011110000000;
    numbers_map[1][3]  = 16'b0000111110000000;
    numbers_map[1][4]  = 16'b0000110110000000;
    numbers_map[1][5]  = 16'b0000000110000000;
    numbers_map[1][6]  = 16'b0000000110000000;
    numbers_map[1][7]  = 16'b0000000110000000;
    numbers_map[1][8]  = 16'b0000000110000000;
    numbers_map[1][9]  = 16'b0000000110000000;
    numbers_map[1][10] = 16'b0000000110000000;
    numbers_map[1][11] = 16'b0000000110000000;
    numbers_map[1][12] = 16'b0000000110000000;
    numbers_map[1][13] = 16'b0000000110000000;
    numbers_map[1][14] = 16'b0000000110000000;
    numbers_map[1][15] = 16'b0000000110000000;
    numbers_map[1][16] = 16'b0000000110000000;
    numbers_map[1][17] = 16'b0000000110000000;
    numbers_map[1][18] = 16'b0001111111111000;
    numbers_map[1][19] = 16'b0001111111111000;
    //Number 2
    numbers_map[2][0]  = 16'b0000000000000000;
    numbers_map[2][1]  = 16'b0000000000000000;
    numbers_map[2][2]  = 16'b0000001111100000;
    numbers_map[2][3]  = 16'b0000011111110000;
    numbers_map[2][4]  = 16'b0000111001111000;
    numbers_map[2][5]  = 16'b0001100000011000;
    numbers_map[2][6]  = 16'b0001000000001000;
    numbers_map[2][7]  = 16'b0000000000001000;
    numbers_map[2][8]  = 16'b0000000000011000;
    numbers_map[2][9]  = 16'b0000000000111000;
    numbers_map[2][10] = 16'b0000000001110000;
    numbers_map[2][11] = 16'b0000000011100000;
    numbers_map[2][12] = 16'b0000000111000000;
    numbers_map[2][13] = 16'b0000001110000000;
    numbers_map[2][14] = 16'b0000011100000000;
    numbers_map[2][15] = 16'b0000111000000000;
    numbers_map[2][16] = 16'b0001110000000000;
    numbers_map[2][17] = 16'b0001100000000000;
    numbers_map[2][18] = 16'b0001111111111000;
    numbers_map[2][19] = 16'b0001111111111000;
    //Number 3
    numbers_map[3][0]  = 16'b0000000000000000;
    numbers_map[3][1]  = 16'b0000111111000000;
    numbers_map[3][2]  = 16'b0001111111110000;
    numbers_map[3][3]  = 16'b0001100001110000;
    numbers_map[3][4]  = 16'b0000000000111000;
    numbers_map[3][5]  = 16'b0000000000011000;
    numbers_map[3][6]  = 16'b0000000000011000;
    numbers_map[3][7]  = 16'b0000000000011000;
    numbers_map[3][8]  = 16'b0000000000111000;
    numbers_map[3][9]  = 16'b0000011111111000;
    numbers_map[3][10] = 16'b0000011111111000;
    numbers_map[3][11] = 16'b0000000000111000;
    numbers_map[3][12] = 16'b0000000000011000;
    numbers_map[3][13] = 16'b0000000000011000;
    numbers_map[3][14] = 16'b0000000000011000;
    numbers_map[3][15] = 16'b0000000000011000;
    numbers_map[3][16] = 16'b0000000000111000;
    numbers_map[3][17] = 16'b0001100001110000;
    numbers_map[3][18] = 16'b0001111111110000;
    numbers_map[3][19] = 16'b0000111111000000;
    //Number 4
    numbers_map[4][0]  = 16'b0000000000000000;
    numbers_map[4][1]  = 16'b0000000000011000;
    numbers_map[4][2]  = 16'b0000000000111000;
    numbers_map[4][3]  = 16'b0000000001111000;
    numbers_map[4][4]  = 16'b0000000011111000;
    numbers_map[4][5]  = 16'b0000000111011000;
    numbers_map[4][6]  = 16'b0000001110011000;
    numbers_map[4][7]  = 16'b0000011100011000;
    numbers_map[4][8]  = 16'b0000110000011000;
    numbers_map[4][9]  = 16'b0000111111111100;
    numbers_map[4][10] = 16'b0000111111111100;
    numbers_map[4][11] = 16'b0000000000011000;
    numbers_map[4][12] = 16'b0000000000011000;
    numbers_map[4][13] = 16'b0000000000011000;
    numbers_map[4][14] = 16'b0000000000011000;
    numbers_map[4][15] = 16'b0000000000011000;
    numbers_map[4][16] = 16'b0000000000011000;
    numbers_map[4][17] = 16'b0000000000011000;
    numbers_map[4][18] = 16'b0000000000011000;
    numbers_map[4][19] = 16'b0000000000011000;
    //Number 5
    numbers_map[5][0]  = 16'b0000000000000000;
    numbers_map[5][1]  = 16'b0001111111111110;
    numbers_map[5][2]  = 16'b0011111111111110;
    numbers_map[5][3]  = 16'b0011000000000000;
    numbers_map[5][4]  = 16'b0011000000000000;
    numbers_map[5][5]  = 16'b0011000000000000;
    numbers_map[5][6]  = 16'b0011000000000000;
    numbers_map[5][7]  = 16'b0011000000000000;
    numbers_map[5][8]  = 16'b0011111111111100;
    numbers_map[5][9]  = 16'b0001111111111110;
    numbers_map[5][10] = 16'b0000000000000110;
    numbers_map[5][11] = 16'b0000000000000111;
    numbers_map[5][12] = 16'b0000000000000011;
    numbers_map[5][13] = 16'b0000000000000011;
    numbers_map[5][14] = 16'b0000000000000011;
    numbers_map[5][15] = 16'b0000000000000111;
    numbers_map[5][16] = 16'b0010000000000110;
    numbers_map[5][17] = 16'b0011000000001110;
    numbers_map[5][18] = 16'b0011111111111100;
    numbers_map[5][19] = 16'b0001111111111000;
    //Number 6
    numbers_map[6][0]  = 16'b0000000000000000;
    numbers_map[6][1]  = 16'b0000011111111000;
    numbers_map[6][2]  = 16'b0000111111111100;
    numbers_map[6][3]  = 16'b0001110000001100;
    numbers_map[6][4]  = 16'b0011100000000000;
    numbers_map[6][5]  = 16'b0110000000000000;
    numbers_map[6][6]  = 16'b1110000000000000;
    numbers_map[6][7]  = 16'b1100000000000000;
    numbers_map[6][8]  = 16'b1100011111000000;
    numbers_map[6][9]  = 16'b1100111111110000;
    numbers_map[6][10] = 16'b1101110001111000;
    numbers_map[6][11] = 16'b1111000000011100;
    numbers_map[6][12] = 16'b1111000000001110;
    numbers_map[6][13] = 16'b1110000000001110;
    numbers_map[6][14] = 16'b1100000000000110;
    numbers_map[6][15] = 16'b1100000000000110;
    numbers_map[6][16] = 16'b0110000000001100;
    numbers_map[6][17] = 16'b0011000000001100;
    numbers_map[6][18] = 16'b0001111111111000;
    numbers_map[6][19] = 16'b0000111111100000;
    //Number 7
    numbers_map[7][0]  = 16'b0000000000000000;
    numbers_map[7][1]  = 16'b0000111111111110;
    numbers_map[7][2]  = 16'b0001111111111110;
    numbers_map[7][3]  = 16'b0001100000000010;
    numbers_map[7][4]  = 16'b0000000000000110;
    numbers_map[7][5]  = 16'b0000000000000110;
    numbers_map[7][6]  = 16'b0000000000001100;
    numbers_map[7][7]  = 16'b0000000000001100;
    numbers_map[7][8]  = 16'b0000000000011000;
    numbers_map[7][9]  = 16'b0000000000011000;
    numbers_map[7][10] = 16'b0000000000110000;
    numbers_map[7][11] = 16'b0000000000110000;
    numbers_map[7][12] = 16'b0000000001100000;
    numbers_map[7][13] = 16'b0000000001100000;
    numbers_map[7][14] = 16'b0000000011000000;
    numbers_map[7][15] = 16'b0000000011000000;
    numbers_map[7][16] = 16'b0000000110000000;
    numbers_map[7][17] = 16'b0000000110000000;
    numbers_map[7][18] = 16'b0000001100000000;
    numbers_map[7][19] = 16'b0000001100000000;
    //Number 8
    numbers_map[8][0]  = 16'b0000011111100000;
    numbers_map[8][1]  = 16'b0000111001110000;
    numbers_map[8][2]  = 16'b0001110000111000;
    numbers_map[8][3]  = 16'b0001100000011000;
    numbers_map[8][4]  = 16'b0001100000011000;
    numbers_map[8][5]  = 16'b0001100000011000;
    numbers_map[8][6]  = 16'b0000110000110000;
    numbers_map[8][7]  = 16'b0000011001100000;
    numbers_map[8][8]  = 16'b0000011111100000;
    numbers_map[8][9]  = 16'b0000001111000000;
    numbers_map[8][10] = 16'b0000001111000000;
    numbers_map[8][11] = 16'b0000011111100000;
    numbers_map[8][12] = 16'b0000011001100000;
    numbers_map[8][13] = 16'b0000110000110000;
    numbers_map[8][14] = 16'b0001100000011000;
    numbers_map[8][15] = 16'b0001100000011000;
    numbers_map[8][16] = 16'b0001100000011000;
    numbers_map[8][17] = 16'b0001110000111000;
    numbers_map[8][18] = 16'b0000111001110000;
    numbers_map[8][19] = 16'b0000011111100000;
    //Number 9
    numbers_map[9][0]  = 16'b0000000000000000;
    numbers_map[9][1]  = 16'b0000011111110000;
    numbers_map[9][2]  = 16'b0000011111111000;
    numbers_map[9][3]  = 16'b0000111000111000;
    numbers_map[9][4]  = 16'b0000110000011100;
    numbers_map[9][5]  = 16'b0001100000001100;
    numbers_map[9][6]  = 16'b0001100000001100;
    numbers_map[9][7]  = 16'b0001100000001100;
    numbers_map[9][8]  = 16'b0001100000001100;
    numbers_map[9][9]  = 16'b0000111100011100;
    numbers_map[9][10] = 16'b0000011111111100;
    numbers_map[9][11] = 16'b0000000111111100;
    numbers_map[9][12] = 16'b0000000000011100;
    numbers_map[9][13] = 16'b0000000000001100;
    numbers_map[9][14] = 16'b0000000000011100;
    numbers_map[9][15] = 16'b0000000000111100;
    numbers_map[9][16] = 16'b0000000001111000;
    numbers_map[9][17] = 16'b0000000001110000;
    numbers_map[9][18] = 16'b0000111111100000;
    numbers_map[9][19] = 16'b0000111111000000;
  end

  logic can_draw_X, can_draw_Y;
  logic [4:0] column, row;
  always_comb begin
    can_draw_X = sx >= number_x && sx < (number_x + 16);
    can_draw_Y = sy >= number_y && sy < (number_y + 20);

    column = sx - number_x;
    row = sy - number_y;
  end

  always_ff @(posedge clk) begin
    if (can_draw_X && can_draw_Y) draw_number = numbers_map[number][row][column];
    else draw_number = 0;
  end
endmodule


module number_gen_tb;
  logic clk;
  logic [9:0] sy = 0, sx = 0;
  wire draw_number;

  parameter stimDelay = 2;

  number_gen inst_number_gen (
      clk,
      sx,
      sy,
      1,
      1,
      0,
      draw_number
  );

  initial begin
    clk = 0;
    forever begin
      #(stimDelay) clk = ~clk;
      sx = sx + 1;
      if (sx > 640) begin
        sx = 0;
        sy = sy + 1;
      end
    end
  end
endmodule
