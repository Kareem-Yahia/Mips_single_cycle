module data_memory(Addr,write_data,data_out,mem_read,mem_write,clk);
input [31:0] Addr,write_data;
output reg [31:0] data_out;
input mem_read,mem_write;
input clk;

reg [7:0] mem[1023:0];

always @(posedge clk) begin
	if(mem_write)
	{mem[Addr],mem[Addr+1],mem[Addr+2],mem[Addr+3]}<=write_data;
end
always @(*) begin
	if(mem_read)
	data_out<={mem[Addr],mem[Addr+1],mem[Addr+2],mem[Addr+3]};
end
endmodule
// note this module should be tested first imppppppp