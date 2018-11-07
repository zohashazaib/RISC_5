module Instruction_Fetch(
	input clk,
	input reset,
	output [31:0] Instruction
);

	wire [63:0] PC_In;
	wire [63:0] PC_Out;
	Program_Counter PC
	(
		.clk(clk),
		.reset(reset),
		.PC_In(PC_In),
		.PC_Out(PC_Out)
	);

	Adder ad
	(
		.a(PC_Out),
		.b(64'd4),
		.out(PC_In)
	);
	Instruction_Memory I_M
	(
		.Inst_Address(PC_Out),
		.Instruction(Instruction)
	);
	
endmodule