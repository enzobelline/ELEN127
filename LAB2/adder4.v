module adder4 (InputX, InputY, CI, CO, Sum);

input [3:0] InputX, InputY;
input CI;
output CO;
output [3:0] Sum;

assign {CO, Sum} = CI + InputX + InputY;

endmodule

