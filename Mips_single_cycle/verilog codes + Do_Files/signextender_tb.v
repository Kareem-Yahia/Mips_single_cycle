module extender_tb();
reg [15:0] in;
wire [31:0] out;
reg Extd;
integer i;

extender ex1(in,out,Extd);

initial begin
	for(i=0;i<99;i=i+1) begin
		in=$random;
		Extd=$random;
		#2;
	end
	#2 $stop;
end
initial begin
	$monitor("in=%b Extd=%b out=%b",in,Extd,out);
end

endmodule