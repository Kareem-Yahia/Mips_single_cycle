module alu_tb();
reg [5:0] opcode,funct;
reg signed [31:0] a,b;
wire signed [31:0] aluresult;
wire zero_flag;

alu a1(opcode,funct,a,b,aluresult,zero_flag);

initial begin
	a=200;
	b=300;
	opcode=0;
	funct='h20;//test add
	#2
	a=100;
	b=-100;
	opcode=0;
	funct='h22;//test sub
	#2
	a=100;
	b=100;
	opcode='h4;
	funct=$random;//test beq
	#2
	a=1000;
	b=50;
	opcode='h8;
	funct=$random;//test addi
	#2
	a=$random;
	b=$random;
	opcode=0;
	funct='h24;//test and
	#2
	a=$random;
	b=$random;
	opcode=0;
	funct='h25;//test or
	#2
	a=50;
	b=100;
	opcode=0;
	funct='h2a;//test slt
	#2
	a=20;
	b=30;
	opcode='h2b;
	funct=$random;//test sw
	#2
	a=80;
	b=70;
	opcode='h23;
	funct=$random;//test lw
	#10
	$stop;
end
initial begin
	$monitor("a=%d b=%d aluresult=%d zero_flag=%h",a,b,aluresult,zero_flag);
end

endmodule