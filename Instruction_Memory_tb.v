module Instruction_Memory_tb
(
);
	reg [63:0] Inst_Address;
	wire [31:0] Instruction;
	
	Instruction_Memory im0
	(
		.Inst_Address(Inst_Address),
		.Instruction(Instruction)
	);
	
	initial
		begin
			Inst_Address = 64'd0;
			#20 Inst_Address = 64'd4;
			#20 Inst_Address = 64'd8;
			#20 Inst_Address = 64'd12;
		end

endmodule