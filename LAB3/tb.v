module tb();

reg [7:0] wrData;
reg clk, wrEn;
reg [2:0] rdAddr0, rdAddr1, wrAddr;

wire[7:0] rdD0, rdD1;

fullDesign DUT(	clk,	
	rdAddr0,
	rdAddr1,
	wrEn,
	wrAddr,
	wrData,
	rdD0,
	rdD1); //add in your ports here


initial begin
	clk = 0;
	forever begin
		#5 clk = ~clk;
	end
end

initial begin
	wrData = 0;
	wrEn = 0;
	rdAddr0 = 0;
	rdAddr1 = 0;
	wrAddr = 0;
	#10

	// include your own test cases


	//write 2 to addr 0
	wrData = 2;
	wrEn = 1;
	rdAddr0 = 1;
	rdAddr1 = 1;
	wrAddr = 0;
	#10
	//read addr 0 & 1
	wrData = 0;
	wrEn = 0;
	rdAddr0 = 0;
	rdAddr1 = 1;
	wrAddr = 0;
	#10
	//write 3 to addr 1
	wrData = 3;
	wrEn = 1;
	rdAddr0 = 0;
	rdAddr1 = 0;
	wrAddr = 1;
	#10
	//read addr 0 & 1
	wrData = 0;
	wrEn = 0;
	rdAddr0 = 0;
	rdAddr1 = 1;
	wrAddr = 0;
	#10

	//write 4 to addr 2
	wrData = 4;
	wrEn = 1;
	rdAddr0 = 0;
	rdAddr1 = 0;
	wrAddr = 2;
	#10
	//read addr 1 & 2
	wrData = 0;
	wrEn = 0;
	rdAddr0 = 1;
	rdAddr1 = 2;
	wrAddr = 0;
	#10

	//write 3 to addr 2
	wrData = 3;
	wrEn = 1;
	rdAddr0 = 0;
	rdAddr1 = 2; //bypass should happen here
	wrAddr = 2;
	#10

	//read addr 1 & 2
	wrData = 0;
	wrEn = 0;
	rdAddr0 = 0;
	rdAddr1 = 2;
	wrAddr = 0;
	#10
$finish;

end


initial begin

	$monitor("%d <--0 means reading,1 means writing\n%d is written to address %d",wrEn, wrData, wrAddr,"\nAddr%d: %d  AND Addr%d: %d \n", rdAddr0, rdD0, rdAddr1, rdD1); //will print out


end

endmodule

