`timescale 1ns / 1ps
module CLK_DIV(
		input clk,
		output clk1hz
	 );
	 
	 reg [21:0] counter;
	 reg buffer_clk1hz;
	 
	 parameter 
	 limit = 12'hBAA;
	 
	 assign clk1hz = buffer_clk1hz;
	 
	 always @(posedge clk)
		begin
			
			counter = counter +1;
			
			if((limit/2)==counter)
			begin
				buffer_clk1hz = !buffer_clk1hz;
				counter = 22'h0;
			end
		
		end
	 
endmodule
