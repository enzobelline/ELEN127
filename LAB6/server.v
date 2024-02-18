//
module server(	reqA,
		reqB,	
		sizeA,
		sizeB,
		done,
		respA,
		respB,
		start
		);
input reqA,reqB,done;
input [2:0] sizeA,sizeB;
output done,respA,respB,start;
//internal vars

wire [2:0] size;
wire zero;
zero = 1'b0;
//make sure first mux is 0=sizea, 1= sizeb
mux2t1  sizeMux(sizeA,sizeB,o,sel);
mux2t1 respAMux(sizeA,zero,o,sel);
mux2t1 respBMux(zero,sizeB,o,sel);


//counter 



//last two are mux1:0=ouptput 1=0 // mux2:0=0 1=output
