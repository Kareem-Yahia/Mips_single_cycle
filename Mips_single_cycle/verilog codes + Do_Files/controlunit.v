module control_unit (opcode,RegDst,RegWrite,Extd,Alusrc,Memread,Memwrite,MemtoReg,Jump,branch);

input [5:0] opcode;
output reg RegDst;
output reg RegWrite;
output reg Extd;
output reg Alusrc;
output reg Memread;
output reg Memwrite;
output reg MemtoReg;
output reg Jump;
output reg branch;

//controal signals decoding (control signal table)
//here we write control signal table but notice that many don't care will replaced by 0
//to ease simulation and avoid red signals which is confusing
//at right is the most correct format

always @(*) begin 
	if(opcode==0)//Rtype
	{RegDst,RegWrite,Extd,Alusrc,Memread,Memwrite,MemtoReg,Jump,branch}=9'b110000000;//9'b11x000000
	else if(opcode=='h8) //addi
	{RegDst,RegWrite,Extd,Alusrc,Memread,Memwrite,MemtoReg,Jump,branch}=9'b011100000;//9'b011100000
	else if(opcode=='h23)//lw
	{RegDst,RegWrite,Extd,Alusrc,Memread,Memwrite,MemtoReg,Jump,branch}=9'b011110100;//9'b011110100
	else if(opcode=='h2b)//sw
	{RegDst,RegWrite,Extd,Alusrc,Memread,Memwrite,MemtoReg,Jump,branch}=9'b001101000;//9'bx01101x00
	else if(opcode=='h4)//beq
	{RegDst,RegWrite,Extd,Alusrc,Memread,Memwrite,MemtoReg,Jump,branch}=9'b001000001;//9'bx01000x00 
	else if(opcode=='h2) //jump
	{RegDst,RegWrite,Extd,Alusrc,Memread,Memwrite,MemtoReg,Jump,branch}=9'b000000010;//9'bxxxx00010
	else //work R-type
	{RegDst,RegWrite,Extd,Alusrc,Memread,Memwrite,MemtoReg,Jump,branch}=9'b110000000;//9'b11x000000
end
endmodule