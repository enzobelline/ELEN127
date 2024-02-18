//done

module respmux2t1(
	in0,
	in1,
	o,
	sel);
//-----------Input Ports---------------
	input sel, in0,in1;

//-----------Output Ports---------------
	output o;

	assign o = sel ? in1 : in0;

endmodule
