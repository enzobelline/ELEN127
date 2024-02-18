module counter(	clk, //clock 
		ldEn, //load enable or preCount in sm
		value,
		cEn, //count enable
		cDone,
		cO);	//done can also be used as response signal
    	input clk, ldEn, cEn;
	input [2:0] value;
	output cO;
    	output reg cDone;
//internal var
	reg [2:0] counting, counter;

//main
assign cO = ((counting!=0)&&cEn) ? 1 : 0;
	always@(posedge clk) begin

		if(ldEn) begin
			cDone = 0;
			counter = value;	//reset new counter value
			counting = 0;
		end
	
		else if (cEn) begin// if counting

			counting = counting + 1'b1;
			//cDone check
			if (counter == counting) cDone = 1'b1;
		end
		
	end	

 
endmodule
