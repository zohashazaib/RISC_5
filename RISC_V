module RISC_V_Processor
(
  input clk,
  input reset
  

);
wire [31:0] Instruction;
wire [63:0] ReadData2;
wire [63:0] ReadData1;
wire [63:0] ReadData;
wire [63:0] mux_reg_result;
wire [63:0] ALU_result;
wire [63:0] PC_Out;
wire [63:0] Add_Out;
wire [63:0] Add_Out2;
wire [63:0] PC_In;
wire [63:0] imm_out;
wire [6:0] opcode;
wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;
wire [2:0] funct3;
wire [6:0] funct7;
wire branch;
wire [1:0] ALUOp;
wire MemRead;
wire MemtoReg;
wire AluSrc;
wire RegWrite;

Program_Counter PC
	(
		.clk(clk),
		.reset(reset),
		.PC_In(wirefrommux),
		.PC_Out(PC_Out)
	);
	
Adder ad1
	(
		.a(PC_Out),
		.b(64'd4),
		.out(Add_Out)
	);
	
Adder ad2
	(
		.a(PC_Out),
		.b(imm_out << 1),
		.out(Add_Out2)
	);

MUX mux_pc
  (
  .a(Add_Out)
  .b(Add_Out2)
  .out(PC_In)
  );

	Instruction_Memory I_M
	(
		.Inst_Address(PC_Out),
		.Instruction(Instruction)
	);
	
instruction 	im
(
.instruction(instruction),
.opcode(opcode),
.rs1(rs1),
.rs2(rs2),
.rsd(rd),
.funct3(funct3),
.funct7(funct7)
);

Data_Memory dm0
	(
		.Mem_Addr(ALU_result),
		.Write_Data(ReadData2),
		.clk(clk),
		.MemWrite(MemWrite),
		.MemRead(MemRead),
		.ReadData(ReadData)
	);
	
MUX mux_datamem
  (
  .a(ReadData)
  .b(ALU_result)
  .out(ALUb)
  );
	
	Register_file RF
  (
   .WriteDatata(WriteDatata_tb),
  .RS1(rs1),
  .RS2(rs2),
  .RD(rd),
  .RegWrite(RegWrite_tb),
  .clk(clk),
  .reset(reset),
  
  .ReadData1(ReadData1),
  .ReadData2(ReadData2)
  
  );
  
  MUX mux_reg
  (
  .a(ReadData2)
  .b(imm_out)
  .out(mux_reg_result)
  );
  
ALU_1_bit ALU1

(
.a(ReadData1),
.b(mux_reg_result),
.ALUop(ALUop),

.Result(ALU_result)
);

Immediate_Data_Generator IDG
(
.instruction(Instruction),
.immediate(imm_out)
);


Control_Unit CU
(
.Opcode(opcode),
.branch(branch),
.MemRead(MemRead),
.MemtoReg(MemtoReg),
.AluSrc(AluSrc),
.RegWrite(RegWrite),
.ALUOp(ALUOp)
);