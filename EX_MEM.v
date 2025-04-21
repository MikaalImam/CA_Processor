`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2025 12:01:31 PM
// Design Name: 
// Module Name: EX_MEM
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

module EX_MEM(clk, reset, 
ID_EX_RegWrite, ID_EX_MemRead, ID_EX_MemToReg, ID_EX_MemWrite, ID_EX_Branch, // input control signals
Adder_out, ALU_Result, Zero, ID_EX_ReadData2, ID_EX_RD,  // inputs
EX_MEM_RegWrite, EX_MEM_MemRead, EX_MEM_MemToReg, EX_MEM_MemWrite, EX_MEM_Branch, // output control signals
EX_MEM_Adder_out, EX_MEM_ALU_Result, EX_MEM_Zero, EX_MEM_ReadData2, EX_MEM_RD); // outputs

input clk, reset, ID_EX_RegWrite, ID_EX_MemRead, ID_EX_MemToReg, ID_EX_MemWrite, ID_EX_Branch, Zero; 
input [4:0] ID_EX_RD; 
input [63:0] Adder_out, ALU_Result, ID_EX_ReadData2; 
output reg  EX_MEM_RegWrite, EX_MEM_MemRead, EX_MEM_MemToReg, EX_MEM_MemWrite, EX_MEM_Branch, EX_MEM_Zero; 
output reg [4:0] EX_MEM_RD; 
output reg [63:0] EX_MEM_Adder_out, EX_MEM_ALU_Result, EX_MEM_ReadData2; 

always @(posedge clk) begin
        case (reset)
        1'b1: // reset 
        begin
            EX_MEM_RegWrite <= 0;
            EX_MEM_MemRead <= 0;
            EX_MEM_MemToReg <= 0;
            EX_MEM_MemWrite <= 0;
            EX_MEM_Branch <= 0;
            EX_MEM_Zero <= 0;
            EX_MEM_RD <= 0;
            EX_MEM_Adder_out <= 0;
            EX_MEM_ALU_Result <= 0;
            EX_MEM_ReadData2 <= 0;
        end

        1'b0: // setting values
        begin
            EX_MEM_RegWrite <= ID_EX_RegWrite;
            EX_MEM_MemRead <= ID_EX_MemRead;
            EX_MEM_MemToReg <= ID_EX_MemToReg;
            EX_MEM_MemWrite <= ID_EX_MemWrite;
            EX_MEM_Branch <= ID_EX_Branch;
            EX_MEM_Zero <= Zero;
            EX_MEM_RD <= ID_EX_RD;
            EX_MEM_Adder_out <= Adder_out;
            EX_MEM_ALU_Result <= ALU_Result;
            EX_MEM_ReadData2 <= ID_EX_ReadData2;
        end
    endcase

end
endmodule