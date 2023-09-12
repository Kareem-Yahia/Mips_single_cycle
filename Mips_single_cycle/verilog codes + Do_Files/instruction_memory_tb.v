module instruction_mem_tb();
reg [31:0] readaddr;
wire [31:0] instruction;
integer i;
instruction_mem m1(readaddr,instruction);
initial begin
	$readmemh("mem.dat",m1.mem);
	readaddr=0;
	#10;
	readaddr=4;
	#2 $stop;
end

endmodule