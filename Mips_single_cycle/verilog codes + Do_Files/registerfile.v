module registerfile(Readreg1,Readreg2,WriteReg,WriteData, RegWrite,ReadData1,ReadData2,clk);
input clk,RegWrite;
input [4:0] Readreg1,Readreg2,WriteReg;
input [31:0] WriteData;
output [31:0] ReadData1,ReadData2;
//here we make the mem registers
reg [31:0] regs_file [31:0];

assign ReadData1=regs_file[Readreg1];
assign ReadData2=regs_file[Readreg2];

always@(posedge clk) begin
	if(RegWrite) begin
		regs_file[WriteReg]<=WriteData;
	end
end

endmodule