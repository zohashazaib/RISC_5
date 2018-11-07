module tb
();

reg atb;
reg btb;
reg CarryIntb;
reg [3:0]ALUoptb;

wire Result;
wire CarryOut;

ALU_1_bit ALU1

(
.a(atb),
.b(btb),
.CarryIn(CarryIntb),
.ALUop(ALUoptb),

.Result(Result),
.CarryOut(CarryOut)
);

initial
 begin
   atb= 1'b1;
   btb= 1'b1;
   CarryIntb= 1'b0;
   ALUoptb = 4'b0010;
   
 end
 
endmodule
   
