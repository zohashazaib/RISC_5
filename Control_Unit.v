module Control_Unit
(  
input [6:0]Opcode,
output reg branch, MemRead, MemtoReg, MemWrite, AluSrc, RegWrite,
output reg [1:0] ALUOp


);
always @ (*)
begin
if (Opcode == 7'b0110011)
	begin
	branch=1'b0; 	
	MemRead=1'b0;
	MemtoReg=1'b0; 
	MemWrite=1'b0; 
	AluSrc=1'b0;
	RegWrite=1'b1; 
	ALUOp=2'b10;
	end
else if (Opcode == 7'b0000011)
	begin
	branch=1'b0;
	MemRead=1'b1;
	MemtoReg=1'b1;
	AluSrc=1'b1;
	RegWrite=1'b1;	
	MemWrite=1'b0;
	ALUOp=2'b00;
	end
else if (Opcode == 7'b0100011)
	begin
	AluSrc=1'b1;
	MemtoReg=1'bx;
	RegWrite=1'b0;
	MemRead=1'b0;
	MemWrite=1'b1;
	branch=1'b0;
	ALUOp=2'b00;
	end
else if (Opcode == 7'b1100011)
	begin
	AluSrc=1'b0;
	MemtoReg=1'bx;
	RegWrite=1'b0;
	MemRead=1'b0;
	MemWrite=1'b0;
	branch=1'b1;
	ALUOp=2'b01;
	end

end
endmodule























