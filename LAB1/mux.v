module  mux(sel,a,b,c,d,out);
input [2:0] a, b, c, d;
input [1:0] sel;

//-----------Output Ports---------------
output reg [2:0] out;
//------------Internal Variables--------
//-------------Code Start-----------------
always @(*)
begin
	case(sel)
	 2'b00 : out <= a;//
	 2'b01 : out <= b;//
	 2'b10 : out <= c;//
	 2'b11 : out <= d;//
	endcase
end
//-------------Code End-----------------
endmodule
