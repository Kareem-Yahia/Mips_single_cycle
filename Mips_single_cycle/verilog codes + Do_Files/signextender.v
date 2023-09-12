module extender(in,out,Extd);
input [15:0] in;
output reg [31:0] out;
input Extd;

always @(*) begin
	if(Extd)
	out={{16{in[15]}},in};
	else
	out={16'h0000,in};
end

endmodule