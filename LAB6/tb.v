//4 test cases: show lose win possible impossible 
module tb();
reg [2:0] sizeA, sizeB;
reg reqA, reqB, reset, clk, done;

wire respA, respB, start;


fullDesign datapath(
//inputs
	clk,
	reset,
	sizeA,
	sizeB,
	done,
	reqA,
	reqB,
//outputs
	respA,
	respB,
	start);

initial begin
	clk = 0;
	forever begin
		#5 clk = ~clk;
	end
end

initial begin

//set reset
	reset = 1;
	reqA  = 0;
	reqB  = 0;
	sizeA = 3'b000;
	sizeB = 3'b000;

//test 1	single  test
	#10
	reset = 0;
	reqA  = 1;
	sizeA = 3'b001;
	done = 1;
	#20

//test 2	robin arbitration test
	#10
	reqA  = 1;
	reqB  = 1;
	sizeA = 3'b100;
	sizeB = 3'b010;
#80
//test 3	robin arbitration test
	#10
	reqA  = 1;
	reqB  = 1;
	sizeA = 3'b100;
	sizeB = 3'b010;
#110
//done

$finish;

end


endmodule
