`timescale 1ns / 1ps
module ROM(
	input [4:0]address,
	output reg [3:0] data		
	 );
	 
	 always @(address)
	 begin 
		case(address)
				 5'h0: data = 4'h8;
				 5'h1: data = 4'h9;
				 5'h2: data = 4'hA;
				 5'h3: data = 4'hC;
				 5'h4: data = 4'hD;
				 5'h5: data = 4'hE;
				 5'h6: data = 4'hE;
				 5'h7: data = 4'hF;
				 5'h8: data = 4'hF;
				 5'h9: data = 4'hF;
				 5'hA: data = 4'hE;
				 5'hB: data = 4'hE;
				 5'hC: data = 4'hD;
				 5'hD: data = 4'hC;
				 5'hE: data = 4'hA;
				 5'hF: data = 4'h9;
				 5'h10: data = 4'h7;
				 5'h11: data = 4'h6;
				 5'h12: data = 4'h5;
				 5'h13: data = 4'h3;
				 5'h14: data = 4'h2;
				 5'h15: data = 4'h1;
				 5'h16: data = 4'h1;
				 5'h17: data = 4'h0;
				 5'h18: data = 4'h0;
				 5'h19: data = 4'h0;
				 5'h1A: data = 4'h1;
				 5'h1B: data = 4'h1;
				 5'h1C: data = 4'h2;
				 5'h1D: data = 4'h3;
				 5'h1E: data = 4'h5;
				 5'h1F: data = 4'h6;
				 default:
					data = 4'hX;
				 endcase
	 end
endmodule

