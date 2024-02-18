//
module fullDesign(
//inputs
	clk,
	reset,
	sizeA,
	sizeB,
	done,
	reqA,
	reqB,
//outputs
	respA,
	respB,
	start);

input 	clk,
	reset,
	done,
	reqA,
	reqB;
input [2:0] sizeA, sizeB;

output 	respA,
	respB,
	start;

//internal vars
wire [2:0] o;
wire preCount, currReq, cStart, sel,prevResp, updateLastUsed,cDone,muxIn; 

//initialized
assign zero = 1'b0;

//make sure first mux is 0 = sizea, 1 = sizeb
mux2t1  sizeMux(sizeA,sizeB,o,sel);

//last two are mux1:0=ouptput 1=0 // mux2:0=0 1=output
respmux2t1 respAMux(muxIn,zero,respA,sel);
respmux2t1 respBMux(zero,muxIn,respB,sel);


//flip flop for preresp
singleBitFlipFlop flipflop(currReq,clk,updateLastUsed,prevResp);

sm stateMach(//inputs
	clk,
	reset,
	done, 	//done signal
	cDone,	//counter done
	prevResp,//lastResponse sent: client management data
	reqA,	//signal that A is req'ing
	reqB, 	//signal that B is req'ing
//outputs
	preCount,	//counter ldEn
	currReq,	//flipflop data input
	start,		//start signal
	cStart,		//counter start
	sel,		//select for muxes
	updateLastUsed	//flipflop ldEn
	
);
//counter 
counter count(clk,preCount,o,cStart,cDone,muxIn);	
endmodule
