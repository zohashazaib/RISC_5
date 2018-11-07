module Immediate_Data_Generator
(
	input [31:0] instruction,
	output reg [63:0] immediate
);


always@(instruction)
begin
	if (instruction[6:0] == 7'b0000011) //ld
		begin
			immediate = instruction[31:20];
			assign immediate = {{52{instruction[31]}},immediate}; 
		end
	else if (instruction[6:0] == 7'b0100011) //sd
		begin
			assign immediate = {instruction[31:25],instruction[11:7]};
			assign immediate = {{52{instruction[31]}},immediate};
		end
	else if (instruction[6:0] == 7'b1100111)//branch
		begin
			assign immediate = {instruction[31],instruction[7],instruction[13],instruction[30:25],instruction[11:8],1'b0};
			assign immediate = {{51{instruction[31]}},immediate}; 
		end
	
end 
endmodule 