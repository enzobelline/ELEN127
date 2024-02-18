module tb2();

reg [3:0] inA, inB, inC, inD;
reg cin;

wire [3:0] BCD0, BCD1, BCD2,BCD3;

fullDesign2 DUT(inA, inB,inC, inD, cin, BCD0, BCD1, BCD2,BCD3);
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
	//part2
	inC = 5;
	inA = 5;//55
	inB = 3;
	inD = 3;//33
	#10
	cin = 0; //sum of 88, should not trigger overflow yet
	#20

	inC = 7;
	inA = 5;//75
	inD = 4;
	inB = 7;//47
	#10
	cin = 0; //sum of 122, should trigger overflow yet
	#20
$finish;

end


initial begin
	$monitor("%d %d + %d %d =   %d %d %d", inC, inA, inD, inB, cin, BCD1, BCD0,BCD2,BCD3); //will print out reports in the command line whenever one of these signals changes
end

endmodule

