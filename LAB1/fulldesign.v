module fullDesign(sw0, sw1, sw2, sw3, form, outA, outB, outC, outD);

input [2:0] sw0, sw1, sw2, sw3;
input [1:0] form;
//-----------Output Ports---------------
output [6:0] outA, outB, outC, outD;

//------------Internal Variables--------

//initiaize a bus that can be used both as muxOuts and decoderIns
wire [2:0] din1, din2, din3, din4;

// muxes with appropriate sw
mux m1 (form,sw3,sw2,sw1,sw0,din1);
mux m2 (form,sw2,sw3,sw0,sw1,din2);
mux m3 (form,sw1,sw0,sw3,sw2,din3);
mux m4 (form,sw0,sw1,sw2,sw3,din4);

//decoders
decoder d1 (din1, outA);
decoder d2 (din2, outB);
decoder d3 (din3, outC);
decoder d4 (din4, outD);
//-------------Code End-----------------
endmodule
