module tb();

reg [2:0] sw0, sw1, sw2, sw3;
reg [1:0] form;

wire [6:0] outA, outB, outC, outD;

fullDesign DUT (sw0, sw1, sw2, sw3, form, outA, outB, outC, outD); // will need your module name changed, and potentially order of ports/pairing by name

initial begin // initial blocks will not be synthesized, for tb only

	sw0 = 0;
	sw1 = 1;
	sw2 = 2;
	sw3 = 3;

	form = 0;
	#10;
	form = 1;
	#10;
	form = 2;
	#10;
	form = 3;
	#10;

	sw0=7;
	sw1=6;
	sw2=5;
	sw3=4;

	form = 0;
	#10;
	form = 1;
	#10;
	form = 2;
	#10;
	form = 3;
	#10;

$finish;

end

initial begin

	$monitor("%d, %d, %d, %d", outA, outB, outC, outD); //will print out decimal representations of your characters each time outA through outD changes. doesn't show up in the GUI but prints out on command line

end

endmodule
