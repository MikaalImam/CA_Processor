`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2025 13:22:06
// Design Name: 
// Module Name: Register_file_SC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Register_file_SC(
    input [63:0] WriteData,
    input [4:0] RS1,
    input [4:0] RS2,
    input [4:0] RD,
    input RegWrite,
    input clk,
    input reset,
    output reg [63:0] ReadData1,
    output reg [63:0] ReadData2);
reg [63:0] Registers [31:0];
integer k;
initial begin
    for (k = 0 ; k < 31 ; k = k + 1) begin //setting all regs to 0
        Registers[k] = 0;
    end
end
    
always @(*) begin // reading from reg
    if (reset == 1) begin
       ReadData1 = 0; 
       ReadData2 = 0;
   end
   else begin 
        ReadData1 <= Registers[RS1]; 
        ReadData2 <= Registers[RS2];
   end
end
  
always @(posedge  clk) begin // writing to reg
   if (RegWrite == 1) begin
        Registers[RD] <= WriteData;
   end
end
endmodule
