module mux2_1_6in(in0,in1,sel,out);
input [4:0] in1,in0;
input sel;
output [4:0] out;

assign out=(sel==1)?in1:in0;

endmodule