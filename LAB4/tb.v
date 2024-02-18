module tb();
module fullDesign(
	lOut,
	clk,
	in,
	reset
);
//vars
reg [1:0] in;
reg clk,reset

wire [5:0] lOut;

//main
initial begin
	clk = 0;
	forever begin
		#5 clk = ~clk;
	end
end
//--------------GOES BACK TO FORWARD---------
//test 1  = A->A
//test 2  = B->A
//test 3  = C->A
//test 4  = D->A
//test 5  = E->A
//test 6  = F->A
//test 7  = G->A
//--------------RIGHT ITER---------
//test 8  = A->B
//test 9  = B->C
//test 10 = C->D
//test 11 = D->B
//--------------LEFT ITER---------
//test 12 = A->E
//test 13 = E->F
//test 14 = F->G
//test 15 = G->E

initial begin
	
	rst=1;
	#10
	
	in = 2'b01; //right
	#10

	

$finish;

end


initial begin

	$monitor("The current state is %d /n,The next state is %d",lout,in); //will print out
end

endmodule
