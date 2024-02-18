module  decoder(din, dout);
//-----------Input Ports---------------
input [2:0] din;
//-----------Output Ports---------------
output [6:0] dout;
//------------Internal Variables--------
//as reg bc they are inside a always block vs wire
reg [6:0] dout;
//-------------Code Start-----------------
always @(*)
begin
	case(din)
	 3'b000 : dout <= 7'h77;//A = 0x77
	 3'b001 : dout <= 7'h39;//C = 0x39
	 3'b010 : dout <= 7'h79;//E = 0x79
	 3'b011 : dout <= 7'h75;//F = 0x75
	 3'b100 : dout <= 7'h76;//H = 0x76
	 3'b101 : dout <= 7'h1E;//J = 0x1E
	 3'b110 : dout <= 7'h38;//L = 0x38
	 3'b111 : dout <= 7'h73;//P = 0x73
	endcase
end
//------- ------Code End-----------------
endmodule
