module mips1(clk,rst_n,mips_out);
output mips_out;
input clk;
input rst_n;//to reset all

//control signal declaration
wire RegDst;
wire RegWrite;
wire Extd;
wire Alusrc;
wire Memread;
wire Memwrite;
wire MemtoReg;
wire Jump;
wire branch;

//internal wires of fetch and instruction memory
wire [31:0] readaddr;
wire [31:0] instruction;

//internal wire of registerfiles
wire [4:0] Readreg1,Readreg2,WriteReg;
wire [31:0] WriteDataregsf;

//wire RegWrite;
wire [31:0] ReadData1,ReadData2;

//internal wire of alu
wire [5:0]opcode,funct;
wire [31:0] a,b,aluresult;
wire zero_flag;

//internal wires of signextender
wire [15:0] in_signextendr;
wire [31:0] out_signextender;

//internal wire of data memory
wire [31:0] ReadData;


//interconnections we could write it direct in instantiations but this is better for reading

assign opcode=instruction[31:26];
assign funct=instruction[5:0];
assign Readreg1=instruction[25:21];//rs
assign Readreg2=instruction[20:16];//rt
assign a=ReadData1;
assign in_signextendr=instruction[15:0];


//_____________________________blocks instantiation______________________________________

control_unit controll(opcode,RegDst,RegWrite,Extd,Alusrc,Memread,Memwrite,MemtoReg,Jump,branch);

data_memory datamemory(.Addr(aluresult),.write_data(ReadData2),
	.data_out(ReadData),.mem_read(Memread),.mem_write(Memwrite),.clk(clk));

mux2_1_32in mux_datamemory(.in0(aluresult),.in1(ReadData),.sel(MemtoReg),.out(WriteDataregsf));

mux2_1_6in  mux_regs(.in0(instruction[20:16]),.in1(instruction[15:11]),.sel(RegDst),.out(WriteReg));

mux2_1_32in mux_alu(.in0(ReadData2),.in1(out_signextender),.sel(Alusrc),.out(b));

extender extender1(in_signextendr,out_signextender,Extd);

instruction_fetch fetch(.clk(clk),.pc(readaddr),.instruction_part(instruction[25:0]),
	.in_from_signextender(out_signextender),.jump(Jump),.branch(branch)
	,.zero_flag(zero_flag),.rst_n(rst_n));

instruction_mem isntructionmemory(readaddr,instruction);

registerfile regfile(Readreg1,Readreg2,WriteReg,WriteDataregsf, RegWrite,ReadData1,ReadData2,clk);

alu alublock(opcode,funct,a,b,aluresult,zero_flag);

assign mips_out=(zero_flag==1)?1:0;//dummy_output
endmodule