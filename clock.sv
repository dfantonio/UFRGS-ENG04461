`default_nettype none
`timescale 1ns / 1ps

// Recebe um sinal de 50 MHz da placa e divide por 2 para obter 25MHz para o display de 480p
module clock (
    input  wire logic clk_50m,       // input clock (100 MHz)
    input  wire logic rst,            // reset
    output      logic clk_reduzido        // pixel clock
    );

	initial clk_reduzido = 0;
	 
    always_ff @(posedge clk_50m) begin
     if(rst)
			clk_reduzido = 0;
		else 
			clk_reduzido = ~clk_reduzido;
    end
endmodule


module clock_tb;
	reg clk_50m, reset;
	wire clk_reduzido;
	
	parameter stimDelay = 1;
	
	clock instancia_divisor (clk_50m, reset, clk_reduzido);
	
  initial begin 
    clk_50m = 0;
    forever begin
      #(stimDelay) clk_50m = ~clk_50m;
    end 
  end

	initial
		begin
		clk_50m = 1;
		reset=1;
    #5
		reset=0;
		end
endmodule