module instruction_mem(readaddr,instruction);
input [31:0] readaddr;
output reg [31:0] instruction;

reg [7:0] mem[1023:0];

always @(*) begin
	instruction={mem[readaddr],mem[readaddr+1],mem[readaddr+2],mem[readaddr+3]};
end

endmodule