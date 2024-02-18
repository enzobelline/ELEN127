//done 

module singleBitFlipFlop(D,	// Data input 
			clk,	// clock input
			ldEn,	// rst
			Q);	// output Q 
input 	D, 
	clk,
	ldEn; 
output reg Q; 

always @(posedge clk) begin
	 if(ldEn == 1'b1) //if ldEn is enabled
	 	Q <= D; //Q <= 0 -> respA
			//Q <= 1 -> respB
end 
endmodule 


