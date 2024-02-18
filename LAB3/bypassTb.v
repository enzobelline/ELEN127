module bypassTb(
	regData,
	wrData,
	rdAddr,
	wrAddr,
	out
);
//-----------Input Ports--------------- 
	input [7:0] rdData, wrData;

//-----------Output Ports---------------
	output [2:0] out;
	
//main tb
	wire en;
	assign en = rdAddr && wrAddr;
	assing out = en ? wrData : rdData;

endmodule
