module data_memory_tb();
reg [31:0] Addr,write_data;
wire [31:0] data_out;
reg mem_read,mem_write;
reg clk;
//clk generation
initial begin
	clk=0;
	forever
	#1 clk=~clk;
end
data_memory md1(Addr,write_data,data_out,mem_read,mem_write,clk);


initial begin
	$readmemh("mem2.dat",md1.mem);
	//test write operation
	mem_write=1;
	mem_read=0;
	Addr=16;
	write_data=$random;
	#10;
	//test read operation
	mem_write=0;
	mem_read=1;
	Addr=4;
	#10;
	#2 $stop;
end

endmodule