`timescale 1ns / 1ps

module IF_ID(clk, reset, PC_out, Instruction, IF_ID_PC_out, IF_ID_Instruction); 
input clk, reset; 
input [31:0] Instruction; 
input [63:0] PC_out;
output reg [31:0] IF_ID_Instruction; 
output reg [63:0] IF_ID_PC_out; 

always @ (posedge clk) begin
    case (reset)
        1'b1: // reset
            begin
            IF_ID_Instruction <= 0;
            IF_ID_PC_out <= 0;
            end
        1'b0: // setting values
            begin
            IF_ID_Instruction <= Instruction;
            IF_ID_PC_out <= PC_out;
            end
    endcase
end
endmodule