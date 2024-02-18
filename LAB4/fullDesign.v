module fullDesign(
	lOut,
	clk,
	in,
	reset
);
//module vars
	input [1:0] in;
	input clk,reset;

	output [5:0] lOut;


//internal vars
reg [5:0] cState, nState;

//initial instantiation
parameter [5:0] 
	A = 6’b000000, //0
	B = 6’b000001, //1
	C = 6’b000011, //2
	D = 6’b000111, //3
	E = 6’b001000, //4
	F = 6’b011000, //5
	G = 6’b111000; //6

//main 
always @(posedge clk, posedge reset)
	if(reset)
		cState <= A;
	else
		cState <=nState;

	always @(*)
		case (cState)
		A:begin
			if(in[0])
				if(in[1])
					nState=A;
				else
					nState=B; //go to right
			else //if input[0]==0
				if(in[1])
					nState=E; //go to left
				else
					nState=A;			
		end

		B:begin // 1 light right
			if(in[1])begin
				nState=A;end
			else begin
				nState=C;end //go to 2 light right
		else
			if(in[1])
				nState=E; // go to 1 light left
			else
				nState=A;
			end
		C:begin
		if(in[0])
			if(in[1])
				nState=A;
			else
				nState=D;// go to 3 light right
		else
			if(in[1])
				nState=E;// go to 1 light left
			else
				nState=A;
		end
		D:begin
		if(in[0])
			if(in[1])
				nState=A;
			else
				nState=B;// go to 1 light right
		else
			if(in[1])
				nState=E;// go to 1 light left
			else
				nState=A;
		end
		E:begin
		if(in[0])
			if(in[1])
				nState=A;
			else
				nState=B;// go to 1 light right
		else
			if(in[1])
				nState=F;// go to 2 light left
			else
				nState=A;
		end
		F:begin
		if(in[0])
			if(in[1])
				nState=A;
			else
				nState=B;// go to 1 light right
		else
			if(in[1])
				nState=G;// go to 3 light left
			else
				nState=A;
		end
		G:begin
		if(in[0])
			if(in[1])
				nState=A;
			else
				nState=B;// go to 1 light right
		else
			if(in[1])
				nState=E;// go to 1 light left
			else
				nState=A;
		end
		endcase
	assign lOut = cState;
	
endmodule
