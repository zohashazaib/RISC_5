module tb5
(
);

  reg [63:0] WriteDatata_tb;
  reg [4:0] RS1_tb;
  reg [4:0] RS2_tb;
  reg [4:0] RD_tb;
  reg RegWrite_tb;
  reg clk_tb;
  reg reset_tb;

  
  wire [63:0] ReadData1;
  wire [63:0] ReadData2;
  
  Register_file RF
  (
   .WriteDatata(WriteDatata_tb),
  .RS1(RS1_tb),
  .RS2(RS2_tb),
  .RD(RD_tb),
  .RegWrite(RegWrite_tb),
  .clk(clk_tb),
  .reset(reset_tb),
  
  .ReadData1(ReadData1),
  .ReadData2(ReadData2)
  
  );

  initial
    begin
    reset_tb = 1'b1;
    #5 reset_tb = ~reset_tb; 
      
      
   WriteDatata_tb = 64'h1111;

   RD_tb = 5'b0001;
   RegWrite_tb = 1'b1;
   
  RS1_tb = 5'b0001;
  RS2_tb = 5'b0001;
 end 

   always
   #5 clk_tb = ~clk_tb; 
    

endmodule
    
  