module mylab4(lOut,clk,reset,in);
	input clk,reset;
	input [1:0] in;
	output [5:0] lOut;

	
	reg [5:0] cState, nState;
	parameter [5:0] A=6'b000000, B=6'b000001, C=6'b000011, D=6'b000111, E=6'b001000, F=6'b011000, G=6'b111000;

	always @(posedge clk, posedge reset)
		if(reset)
			cState <= A;
		else
			cState <= nState;

	always @(*)
	case (cState)
		A:
		begin
			if(in[0])
				if(in[1])
					nState=A;
				else
					nState=B;
			else
 				if(in[1])
					nState=E;
				else
					nState=A;			
		end
		B:
		begin
			if(in[0])
				if(in[1])
					nState=A;
				else
					nState=C;
			else
				if(in[1])
					nState=E;
				else
					nState=A;
		end
		C:
		begin
			if(in[0])
				if(in[1])
					nState=A;
				else
					nState=D;
			else
				if(in[1])
					nState=E;
				else
					nState=A;
		end
		D:
		begin
			if(in[0])
				if(in[1])
					nState=A;
				else
					nState=B;
			else
				if(in[1])
					nState=E;
				else
					nState=A;
		end
		E:
		begin
			if(in[0])
				if(in[1])
					nState=A;
				else
					nState=B;
			else
				if(in[1])
					nState=F;
				else
					nState=A;
		end
		F:
		begin
			if(in[0])
				if(in[1])
					nState=A;
				else
					nState=B;
			else
				if(in[1])
					nState=G;
				else
					nState=A;
		end
		G:
		begin
			if(in[0])
				if(in[1])
					nState=A;
				else
					nState=B;
			else
				if(in[1])
					nState=E;
				else
					nState=A;
		end
	endcase
	assign lOut=cState;
endmodule
	
