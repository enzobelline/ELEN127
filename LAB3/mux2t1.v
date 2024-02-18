module mux2t1(
	in0,
	in1,
	o,
	sel);
//-----------Input Ports---------------
	input sel;
	input [7:0] in0,in1;

//-----------Output Ports---------------
	output [7:0] o;

	assign o = sel ? in1 : in0;

endmodule
