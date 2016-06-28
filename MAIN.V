module MAIN(
    input c,
	 input d,
	 input e,
	 input clk,
	 output [3:0] data,
    output reg [7:0] ledsx,
	 output reg [7:0] ledsy
	 );
	 
	 wire clk_c;
	 wire clk_c2;
	 reg temp;
	 reg temp2;
	 reg [4:0] address;
	 reg [4:0] address2;
	 wire cc;
	 wire cd;
	 wire ce;
	 wire SDO;
	 wire SRE;
	 wire SMI;
	 wire [3:0]wdata;
	 reg posi;
	 assign clk_c = temp;
	 assign clk_c2 = temp2;
	 //clock divider de Audio(rapido)
	 CLK_DIV #(.limit(12'hBAA)) vclk_c(.clk(clk),.clk1hz(cc));
	 CLK_DIV #(.limit(12'hA64)) vclk_d(.clk(clk),.clk1hz(cd));
	 CLK_DIV #(.limit(12'h941)) vclk_e(.clk(clk),.clk1hz(ce));
	 //clock divider de Leds(lento)
	 CLK_DIV2 ck1(clk, SDO);
	 CLK_DIV2 ck2(clk, SRE);
	 CLK_DIV2 ck3(clk, SMI);
	 
	 //ROM de Audio
	 ROM vrom(address, data);
	 //ROM de los Leds
	 ROM vrom2(address2, wdata);
	 
	 //rapido
	 always @(posedge clk_c)
			begin
					address = address + 1;
					
					//Condiciones para mostrar en la Matriz Led las 
					//muestras que usa cada nota al momento de ser presionadas
					if(posi)
					begin
						if(wdata == 4'h0)
						begin
							ledsy = 8'b00000000;
							ledsx = 8'b00000000;	
						end
						else if(wdata > 4'h0 & wdata <= 4'h2)
						begin
							ledsy = 8'b01111111;
							ledsx = 8'b10000000;
						end
						else if(wdata > 4'h2 & wdata <= 4'h4)
						begin
							ledsy = 8'b10111111;
							ledsx = 8'b11000000;
						end
						else if(wdata > 4'h4 & wdata <= 4'h6)
						begin
							ledsy = 8'b11011111;
							ledsx = 8'b11100000;
						end
						else if(wdata > 4'h6 & wdata <= 4'h8)
						begin
							ledsy = 8'b11101111;
							ledsx = 8'b11110000;
						end
						else if(wdata > 4'h8 & wdata <= 4'hA)
						begin
							ledsy = 8'b11110111;
							ledsx = 8'b11111000;
						end
						else if(wdata > 4'hA & wdata <= 4'hC)
						begin
							ledsy = 8'b11111011;
							ledsx = 8'b11111100;
						end
						else if(wdata > 4'hC & wdata <= 4'hE)
						begin
							ledsy = 8'b11111101;
							ledsx = 8'b11111110;
						end
						else if(wdata == 4'hF)
						begin
							ledsy = 8'b11111110;
							ledsx = 8'b11111111;
							posi = !posi;
						end
					end
					else
					begin
						if(wdata > 4'h0 & wdata <= 4'h2)
						begin
							ledsy = 8'b11111110;
							ledsx = 8'b10000000;
						end
						else if(wdata > 4'h2 & wdata <= 4'h4)
						begin
							ledsy = 8'b11111101;
							ledsx = 8'b11000000;
						end
						else if(wdata > 4'h4 & wdata <= 4'h6)
						begin
							ledsy = 8'b11111011;
							ledsx = 8'b11100000;
						end
						else if(wdata > 4'h6 & wdata <= 4'h8)
						begin
							ledsy = 8'b11110111;
							ledsx = 8'b11110000;
						end
						else if(wdata > 4'h8 & wdata <= 4'hA)
						begin
							ledsy = 8'b11101111;
							ledsx = 8'b11111000;
						end
						else if(wdata > 4'hA & wdata <= 4'hC)
						begin
							ledsy = 8'b11011111;
							ledsx = 8'b11111100;
						end
						else if(wdata > 4'hC & wdata <= 4'hE)
						begin
							ledsy = 8'b10111111;
							ledsx = 8'b11111110;
						end
						else if(wdata == 4'hF)
						begin
							ledsy = 8'b01111111;
							ledsx = 8'b11111111;
							posi = !posi;
						end
					end
			end
		//lento
		always @(posedge clk_c2)
			begin			
					address2 = address2 +1;
			end
		
		always @(c or d or e)
			begin
				if(c)
				begin
					temp = cc;
					temp2 = SDO;
				end
				
				else if(d)
				begin
					temp = cd;
					temp2 = SRE;
				end
				
				else if(e)
				begin
					temp = ce;
					temp2 = SMI;
				end
				
				else
				begin
					temp = 0;
					temp2 = 0;
				end
			end
endmodule
