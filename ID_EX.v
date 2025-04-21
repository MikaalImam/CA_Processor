
`timescale 1ns / 1ps

module ID_EX (clk, reset, 
RegWrite, MemRead, MemToReg, MemWrite, Branch, ALUOp, ALUSrc, // control signals
IF_ID_PC_out, ReadData1, ReadData2, ImmData, RS1, RS2, RD, Funct, // inputs

ID_EX_RegWrite, ID_EX_MemRead, ID_EX_MemToReg, ID_EX_MemWrite, ID_EX_Branch, ID_EX_ALUOp, ID_EX_ALUSrc, // control signals
ID_EX_PC_out, ID_EX_ReadData1, ID_EX_ReadData2, ID_EX_ImmData, ID_EX_RS1, ID_EX_RS2, ID_EX_RD, ID_EX_Funct); // outputs

input clk, reset, RegWrite, MemRead, MemToReg, MemWrite, Branch, ALUSrc; 
input [1:0] ALUOp; 
input [63:0] IF_ID_PC_out, ReadData1, ReadData2, ImmData; 
input [3:0] Funct; 
input [4:0] RS1, RS2, RD;
output reg ID_EX_RegWrite, ID_EX_MemRead, ID_EX_MemToReg, ID_EX_MemWrite, ID_EX_Branch, ID_EX_ALUSrc; 
output reg [1:0] ID_EX_ALUOp; 
output reg [63:0] ID_EX_PC_out, ID_EX_ReadData1, ID_EX_ReadData2, ID_EX_ImmData; 
output reg [3:0] ID_EX_Funct; 
output reg [4:0] ID_EX_RS1, ID_EX_RS2, ID_EX_RD ; 


always @(posedge clk) begin
    case (reset)
        1'b1: // reset 
        begin
            ID_EX_RegWrite <= 0;
            ID_EX_MemRead <= 0;
            ID_EX_MemToReg <= 0;
            ID_EX_MemWrite <= 0;
            ID_EX_Branch <= 0;
            ID_EX_ALUSrc <= 0;
            ID_EX_ALUOp <= 0; 
            ID_EX_PC_out <= 0;
            ID_EX_ReadData1 <= 0;
            ID_EX_ReadData2 <= 0;
            ID_EX_ImmData <= 0;
            ID_EX_Funct <= 0; 
            ID_EX_RS1 <= 0; 
            ID_EX_RS2 <= 0; 
            ID_EX_RD <= 0; 
        end
        
        1'b0: // setting values
        begin
            ID_EX_RegWrite <= RegWrite;
            ID_EX_MemRead <= MemRead;
            ID_EX_MemToReg <= MemToReg;
            ID_EX_MemWrite <= MemWrite;
            ID_EX_Branch <= Branch;
            ID_EX_ALUSrc <= ALUSrc;
            ID_EX_ALUOp <= ALUOp;
            ID_EX_PC_out <= IF_ID_PC_out;
            ID_EX_ReadData1 <= ReadData1;
            ID_EX_ReadData2 <= ReadData2;
            ID_EX_ImmData <= ImmData;
            ID_EX_Funct <= Funct;
            ID_EX_RS1 <= RS1;
            ID_EX_RS2 <= RS2;
            ID_EX_RD <= RD;
        end     
    endcase 
      
end
endmodule
