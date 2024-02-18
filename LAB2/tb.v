module tb();

reg [3:0] inA, inB;
reg cin;

wire [3:0] BCD0, BCD1;

fullDesign DUT(inA, inB, cin, BCD0, BCD1);
// make sure you either change these names or your own module names

initial begin
	inA = 5;
	inB = 3;
	#10
	cin = 1; //sum of 9, should not trigger overflow yet
	#20
	inA = 9; //now we have overflow, sum of 13
	#10
	cin = 0;
	inA = 8;
	inB = 8;

$finish;

end


initial begin
	$monitor("%d + %d + %d =    %d %d", inA, inB, cin, BCD1, BCD0); //will print out reports in the command line whenever one of these signals changes
end

endmodule

