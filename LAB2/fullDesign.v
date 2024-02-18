module fullDesign(A, B, CI, BCD0, BCD1);

input [3:0] A, B;
input CI;
//-----------Output Ports---------------
output [3:0] BCD0, BCD1;

//------------Internal Variables--------

//initiaize a bus that can be used both as muxOuts and decoderIns
wire [3:0] R,Sum;
wire CO1,CO2;
reg sel;
// muxes with appropriate sw
adder4 m1(A, B, CI, CO1, Sum);
adder4 Rem(Sum,6,0,CO2,R);

//Conversion Logic
always @(*)
begin
	if (CO1 || Sum>9) sel = 1;
		else sel = 0;
end

mux mx(sel, Sum, R, BCD0);
assign BCD1 = {3'b0, sel};
//-------------Code End-----------------
endmodule
