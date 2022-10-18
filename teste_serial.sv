`default_nettype none `timescale 10ns / 10ns

module leitor_serial (
    input wire logic clk,     // pixel clock
    input wire logic rxReady,
    input wire logic [7:0] rxData,  // vertical screen position
    output logic [6:0] paddle1Y=50,
    output logic [6:0] paddle2Y=0
);

  logic [6:0] buff = 0;

  always_ff @(posedge clk) begin
    if (rxReady) begin
      buff = 0;

      for (int i = 0; i < 7; i++) begin
        if (rxData[i]) buff = buff + (2 ** i);
      end

      if (rxData[7] && buff > 50) paddle1Y = 80;
      else paddle1Y = 20;
      // else paddle2Y = buff;
    end
  end

endmodule
