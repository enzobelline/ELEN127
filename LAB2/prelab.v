module adder4 (InputX, InputY, CI, CO, Sum);
input [3:0] InputX, InputY;
input CI;
output CO;
output [3:0] Sum;
endmodule

//Consider the concept of BCD “overflow”, i.e., if the result calculated by the adder is larger
than 9. If you don’t have overflow, then the 4-bit Sum can pass thru unchanged, i.e., BCD0
= Sum. But if you have overflow, you will need to pass thru a different 4-bit value, which is
some function of the 4-bit Sum. We’ll call this the remainder.
This description implies that BCD0 is the output of a 2:1 mux. One of the inputs to the mux
is Sum, the other input is a calculated remainder. And of course a mux needs a mux select.
In this case, our mux select would be an indication of BCD overflow.
We will use another instance of the 4-bit adder to generate the remainder. One of the inputs
to this second adder will be hardcoded to a 4-bit constant.
ELEN 127 Lab2
Given the restrictions that BCD0 must be generated by a mux, and the remainder must be
generated by a 4-bit adder, draw a block diagram of how you would approach the
conversion logic. As stated before, the mux select will be a BCD overflow indication. In this
block diagram, you can just put a block representing the logic to generate this overflow
condition; you don’t need to draw out AND/OR gates for this logic.


//Write a Verilog module that implements all of the diagram above as well as the block
diagram you generated for the previous part; you don’t need to create a separate module the
conversion logic, it can all be a part of your module. But you should have two instantiations
of the adder4 module. Note that there are two 4-bit inputs, a carry-in input, and two 4-bit
outputs.
Turn in your “conversion logic” block diagram and Verilog module as your pre-lab
deliverables.

