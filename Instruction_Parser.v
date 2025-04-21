`timescale 1ns / 1ps

module Instruction_Parser(
    input [31:0] instruc, 
    output reg [6:0] opcode,
    output reg [4:0] rd,    
    output reg [2:0] func3, 
    output reg [4:0] rs1, 
    output reg [4:0] rs2, 
    output reg [6:0] func7); 
    

always @(instruc) begin
    opcode <= instruc [6:0];
    rd <= instruc [11:7];
    func3 <= instruc [14:12];
    rs1 <= instruc [19:15];
    rs2 <= instruc [24:20];
    func7 <= instruc [31:25];
end
endmodule

