module mux2_1_32in(in0,in1,sel,out);
input [31:0] in1,in0;
input sel;
output [31:0] out;

assign out=(sel==1)?in1:in0;

endmodule