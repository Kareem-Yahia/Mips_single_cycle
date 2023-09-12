module mips1_tb();
reg clk;
reg rst_n;
mips1 mipso1(clk,rst_n);


initial begin
	clk=0;
	forever
	#15 clk=~clk;
end

initial begin
	rst_n=0;
	$readmemh("mem.dat",mipso1.isntructionmemory.mem);//instructionmemory
	$readmemh("reg.dat",mipso1.regfile.regs_file); //registerfiles
	$readmemh("mem2.dat",mipso1.datamemory.mem); //data memory
	#2 rst_n=1;
	#2000 $stop;
end

endmodule