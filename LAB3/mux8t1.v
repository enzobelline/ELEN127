module mux8t1(
	in0,
	in1,
	in2,
	in3,
	in4,
	in5,
	in6,
	in7,
	o,
	sel);
//-----------Input Ports---------------
	input [2:0] sel;
	input [7:0] in0,in1,in2,in3,in4,in5,in6,in7;
//-----------Output Ports---------------
	output reg [7:0]o; 

	always@(*) begin
		case(sel)
			3'b000: o =in0;
			3'b001: o =in1;
			3'b010: o =in2;
			3'b011: o =in3;
			3'b100: o =in4;
			3'b101: o =in5;
			3'b110: o =in6;
			3'b111: o =in7;
			default: o = 0;
		endcase
	end
endmodule
