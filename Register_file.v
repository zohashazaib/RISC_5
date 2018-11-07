module Register_file
(
  input [63:0] WriteData,
  input [4:0] RS1,
  input [4:0] RS2,
  input [4:0] RD,
  input RegWrite,
  input clk,
  input reset,

  
  output reg [63:0] ReadData1,
  output reg [63:0] ReadData2
 );
 
 reg [63:0] Array [31:0];
  integer i;
 
 always @ (posedge reset or posedge clk)
 begin
 
 if (reset)
   for (i=0; i<32; i=i+1) Array[i] <= 64'b0;
 else if (RegWrite)
  Array [RD] = WriteData;
  
 ReadData1 = Array[RS1];
 ReadData2 = Array[RS2];

 end
  
   
 
 endmodule