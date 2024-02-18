module fullDesign2(A, B, C, D, CI1, BCD0, BCD1, BCD2, BCD3);
input [3:0] A, B, C, D;
input CI1;
//-----------Output Ports---------------
output [3:0] BCD0, BCD1,BCD2, BCD3;

//------------Internal Variables--------

//initiaize a bus that can be used both as muxOuts and decoderIns
fullDesign ones (A, B, CI1, BCD0, BCD1);

wire [3:0] R,Sum;
wire Ci2;
reg sel;
// muxes with appropriate sw
adder4 m2(C, D, BCD1, CO2, Sum);
adder4 Rem(Sum,6,0,CO2,R);

//Conversion Logic
always @(*)
begin
	if (CO2 || Sum>9) sel = 1;
		else sel = 0;
end

mux mx2(sel, Sum, R, BCD2);
assign BCD3 = {3'b0, sel};
//-------------Code End-----------------
endmodule
