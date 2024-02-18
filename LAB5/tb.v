//4 test cases: show lose win possible impossible 
module tb();
reg [2:0] player;
reg clock, reset;
wire [3:0] res;
wire win, lose, ill;


mylab4 mygame(player, move, clock, reset, res, win, lose, ill);

initial begin
	clk = 0;
	forever begin
		#5 clk = ~clk;
	end
end

initial begin

//set reset
	reset = 1;
//test 1	intial test
	#10
	player=3'b101; // //move chicken // 1010
	reset=0;


	#10
	player=3'b100;//move chicken // 0010
	reset=0;

	#10
	player=3'b111;//move seeds   //1011
	reset=0;
//impossible test
	#10
	player=3'b110;//impossible test //move fox  // output should still be 1011
	reset=0;

	#10
	player=3'b101;// move chicken // 0001
	reset=0;

	#10
	player=3'b110;// move fox        // 1101
	reset=0;

	#10
	player=3'b100;//move farmer   //0101
	reset=0;
	
	#10
	player=3'b101;//move chicken   //1111
	reset=0;
//win
	#10
	reset = 1;
//lose
	#10
	player=3'b100;//move farmer   //0101
	reset=0;

//output initializes at new clk rise	
	#10
$finish;

end


initial begin
	 $monitor("Player input is : %d\n, Move is possible: %d\nWon:%d\nLost:%d\nCurrent Position is:%d",player,ill,win,lose,res); //if you want to use command line printouts
end

endmodule

