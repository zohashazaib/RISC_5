module tb();

	reg clk;
	reg reset;
	wire [31:0] Instruction;

Instruction_Fetch i_f
(
.clk(clk),
.reset(reset),
.Instruction(Instruction)
);
initial 
begin
clk = 1'b0;
reset=1'b1;
end
always 
	#5 clk = ~clk;
	
initial
begin
	#10 
	reset=1'b0;
	
	#5
	reset=1'b1;
	
	#20
	reset=1'b0;
end

endmodule