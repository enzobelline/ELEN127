module reg8(
	wrD,
	regD,
	ldEnBit,
	clk
	);
//-----------Input Ports---------------
	input clk, ldEnBit;
	input [7:0] wrD;
//-----------Output Ports---------------
	output reg [7:0]regD; 

//main
	initial regD = 1'h0;
	always@(posedge clk) begin
		if(ldEnBit)begin regD = wrD; end
	end
endmodule
