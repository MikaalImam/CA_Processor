`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2025 12:02:44 PM
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(clk, reset, 
EX_MEM_RegWrite, EX_MEM_MemToReg, // input control signals
ReadData, EX_MEM_ALU_Result, EX_MEM_RD, // inputs
MEM_WB_RegWrite, MEM_WB_MemToReg, // output control signals
MEM_WB_ReadData, MEM_WB_ALU_Result, MEM_WB_RD  // outputs
);

input clk, reset, EX_MEM_RegWrite, EX_MEM_MemToReg; 
input [4:0] EX_MEM_RD; 
input [63:0] ReadData, EX_MEM_ALU_Result;

output reg MEM_WB_RegWrite, MEM_WB_MemToReg;
output reg [4:0] MEM_WB_RD;
output reg [63:0] MEM_WB_ReadData, MEM_WB_ALU_Result;

  always @(posedge clk) begin

    case(reset)
          1'b1: //reset on
            begin
                MEM_WB_RegWrite <= 0;
                MEM_WB_MemToReg <= 0;
                MEM_WB_ReadData <= 0;
                MEM_WB_ALU_Result <= 0;
                MEM_WB_RD <= 0;
            end

          1'b0: // reset off
            begin
                MEM_WB_RegWrite <= EX_MEM_RegWrite;
                MEM_WB_MemToReg <= EX_MEM_MemToReg;
                MEM_WB_ReadData <= ReadData;
                MEM_WB_ALU_Result <= EX_MEM_ALU_Result;
                MEM_WB_RD <=  EX_MEM_RD;
            end
   endcase

end
endmodule
