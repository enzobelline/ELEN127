module dec(
	wrEn,
	i,
	ldEn	);
//-----------Input Ports---------------
	input wrEn;	
	input [2:0] i;
//-----------Output Ports---------------
	output reg [7:0]ldEn; 

//main
	always@(*) begin
		ldEn = 2'h00;
		if(wrEn)begin 
		ldEn = 8'b00000001 << i; 
		end
	end
endmodule
