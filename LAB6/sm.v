module sm(
//inputs
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
//module vars//----------------------------------------------------update sizes for these module vars----------------
	input prevResp, reqA, reqB, clk,reset,done,cDone;
	output reg preCount, currReq, start, cStart, sel, updateLastUsed;


//internal vars--------------------------------------------------
reg [3:0] cState, nState;


//initial instantiation
parameter [3:0] 
	A = 4'b0000, //intial state
	B = 4'b0001, //single req
	C = 4'b0010, //ra: multiple req
	D = 4'b0011, //count
	E = 4'b0100, //pre count single req
	F = 4'b0101, //last response set
	G = 4'b0110, //ra precount
	H = 4'b0111; //countEnd

//main 
always @(posedge clk, posedge reset)
	if(reset)
		cState <= A;
	else
		cState <=nState;

	always @(*)
		case (cState)
		//initial state
		A:begin		
			if((!reqA && reqB) || (!reqB && reqA)) //go to single request state
				nState <= B;

			else if(reqA && reqB) 		//go to robin arbitration
				nState <= C;

			else				//no request aka at this state
				nState <= A;
		end

		//single request state
		B:begin  	
			//sm output updates
			if(reqA)
				currReq=0;

			else
				currReq=1;		
			preCount = 1;
			start = 1;
			sel=0;			
			updateLastUsed = 1;	//load enable

			//updateLastUsed logic

			//nextstate logic
			if (done)	// go to count
				nState <= D;

			else 		// pre count single req
				nState <= E; 
		end	

		//robin arbitration or multiple req
		C:begin		
			//output updates			
			preCount = 1;
			sel = !prevResp; // Q of flipflop
			currReq = !prevResp; //not prevResp
			start = 1;			
			//nextstate logic
			if (done)	// go to precount = 1
				nState <= F;//----------------------

			else 		// go to precount = 0
				nState <= G; //-------------------------------
		end

		//count
		D:begin
			//output updates			
			cStart <= 1;			
			preCount = 0;
			updateLastUsed = 0;
			start = 0;			
			//nextstate logic
			if (cDone)	// go to countEnd
				nState <= H;

			else 		// stay in countState//-------------------------
					//we need to incorporate how to use counter here
				nState <= D; 
		end

		//pre count single req
		E:begin
			//output updates			
			preCount = 0;
			currReq = 0; 
			start = 0;			
			updateLastUsed = 0;
			//nextstate logic
			if (done)	// go to count
				nState <= D;

			else 		// stay?//-------------------------------------------------------------------
				nState=E;
		end

		//multiple req  // precount = 1
		F:begin
			//output updates			
			preCount = 1;
			updateLastUsed = 1;
			cStart = 1;		
			//nextstate logic
			if (cDone)	// go to countEnd
				nState <= H;

			else 	// go to count
				nState <= D; 
		end

		//multiple req  // precount = 0
		G:begin
			//output updates			
			preCount = 0;
			updateLastUsed = 1;
			//nextstate logic
			if (done)	// go to count
				nState <= D;

			else 	// go to count
				nState <= G; //---------------------------------------
		end

		//countend		
		H:begin  	
			//output updates			
			cStart = 0;

			//go to initial state
			nState = A;
		end 
//default case		
		default:begin
			nState <= A;
		end
		endcase
endmodule
