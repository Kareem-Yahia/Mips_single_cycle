module alu(opcode,funct,a,b,aluresult,zero_flag);
input [5:0] opcode,funct;
input signed [31:0] a,b;
output reg signed [31:0] aluresult;
output zero_flag;

always @(*) begin
	if(opcode==0 && funct=='h20)//add
	aluresult=a+b;  
	else if(opcode=='h8)       //addi
	aluresult=a+b;
	else if(opcode==0 && funct=='h22) //sub
	aluresult=a-b;
	else if(opcode==0 && funct=='h24) //and
	aluresult=a&b;
	else if(opcode==0 && funct=='h25) //or
	aluresult=a|b;
	else if(opcode==0 && funct=='h2a) //slt
	aluresult=(a<b)?1:0;
	else if(opcode=='h23)            //lw
	aluresult=a+b;
	else if(opcode=='h2b)            //sw
	aluresult=a+b;
	else if(opcode=='h4) //beq
	aluresult=a-b;
	else 
	aluresult=10;//dummyvalue
end

assign zero_flag=(aluresult==32'h0000)?1'b1:1'b0;

endmodule