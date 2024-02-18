module fullDesign (
	clk,	
	rdAddr0,
	rdAddr1,
	wrEn,
	wrAddr,
	wrD,
	rdD0,
	rdD1
);
//vars
	input clk,wrEn;
	input [2:0] rdAddr0,rdAddr1,wrAddr;
	input [7:0] wrD;

	output [7:0] rdD0,rdD1;

	wire Aen,Ben;
	wire [7:0] A,B, rd0,rd1,rd2,rd3,rd4,rd5,rd6,rd7 ,wrIn,ldEn;

//intialize
	mux8t1 mA(rd0,rd1,rd2,rd3,rd4,rd5,rd6,rd7,A,rdAddr0);
	mux8t1 mB(rd0,rd1,rd2,rd3,rd4,rd5,rd6,rd7,B,rdAddr1);

//bypass
	assign Aen = (wrAddr == rdAddr0) && wrEn;
	assign Ben = (wrAddr == rdAddr1) && wrEn;

//CHOOSE REG VALUE OR WRITE VALUE
	mux2t1 chooseA(A,wrD,rdD0,Aen);
	mux2t1 chooseB(B,wrD,rdD1,Ben);
//bypass end

	dec d(wrEn,wrAddr,ldEn);

	reg8 reg0(wrD,rd0,ldEn[0],clk);
	reg8 reg1(wrD,rd1,ldEn[1],clk);
	reg8 reg2(wrD,rd2,ldEn[2],clk);
	reg8 reg3(wrD,rd3,ldEn[3],clk);
	reg8 reg4(wrD,rd4,ldEn[4],clk);
	reg8 reg5(wrD,rd5,ldEn[5],clk);
	reg8 reg6(wrD,rd6,ldEn[6],clk);
	reg8 reg7(wrD,rd7,ldEn[7],clk);

endmodule
