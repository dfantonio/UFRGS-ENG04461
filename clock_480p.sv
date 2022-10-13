`default_nettype none
`timescale 1ns / 1ps

// Recebe um sinal de 50 MHz da placa e divide por 2 para obter 25MHz para o display
module clock_480p (
    input  wire logic clk_50m,       // input clock (100 MHz)
    input  wire logic rst,            // reset
    output      logic clk_pix        // pixel clock
    );

	initial begin	
			clk_pix = 1;
	end
	 
    always_ff @(posedge clk_50m) begin
     if(rst)
			clk_pix <= 0;
		else 
			clk_pix = ~clk_pix;
    end
endmodule


module clock_480p_tb;
	reg clk_50m, reset;
	wire clk_pix;
	
	parameter stimDelay = 1;
	
	clock_480p instancia_divisor (clk_50m, reset, clk_pix);
	
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