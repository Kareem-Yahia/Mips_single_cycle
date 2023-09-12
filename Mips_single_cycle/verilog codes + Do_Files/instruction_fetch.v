module instruction_fetch(clk,pc,instruction_part,in_from_signextender,jump,branch,zero_flag,rst_n);

input clk;
input branch,zero_flag,jump;//control signals
input [31:0] in_from_signextender;
input rst_n;
input [25:0] instruction_part;
output [31:0] pc;

//internal wires
reg [31:0]x1;//cs+4
reg [27:0]x2;//28 bit
reg [31:0] jump_address;
wire [31:0] jump_address2;
reg [31:0] alu_result;
wire choice;
and (choice,branch,zero_flag);
wire [31:0] out_mux1;

// we will design fetch as moore FSM 
reg [31:0] cs ;
wire [31:0]ns;
// next state logic
always @(*) begin
	x1=cs+4;
	x2=instruction_part[25:0]<<2;
	jump_address={x1[31:28],x2};
	alu_result=x1+(in_from_signextender<<2);
end
assign jump_address2=jump_address;
mux2_1_32in mux1(.in0(x1),.in1(alu_result),.sel(choice),.out(out_mux1));
mux2_1_32in mux2(.in0(out_mux1),.in1(jump_address2),.sel(jump),.out(ns));

//state memory
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
	cs<=0;
	else 
	cs<=ns;
end
//output logic
assign pc=cs;
endmodule