module mux(sel,a,b,out);
input [3:0] a, b;
input sel;

//-----------Output Ports---------------
output reg [3:0] out;
//------------Internal Variables--------
//-------------Code Start-----------------
always @(*)
begin
	case(sel)
	 1'b0 : out <= a;//
	 1'b1 : out <= b;//
	endcase
end
//-------------Code End-----------------
endmodule
