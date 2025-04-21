`timescale 1ns / 1ps

module Control_Unit(
    input [6:0] opcode,
    output reg [1:0] ALUOp,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite);

always@(*)begin
    case (opcode)
        7'b0110011: // R type
            begin
            ALUSrc = 0;
            MemtoReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            ALUOp = 2'b10;
            end 
        7'b0000011: // I type (lw)
            begin
            ALUSrc = 1;
            MemtoReg = 1;
            RegWrite = 1;
            MemRead = 1;
            MemWrite = 0;
            Branch = 0;
            ALUOp = 2'b00;
            end 
        7'b0100011: // S type (sw)
            begin
            ALUSrc = 1;
            MemtoReg = 1'bx;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 1;
            Branch = 0;
            ALUOp = 2'b00;
            end 
        7'b1100011: // SB type (beq)
            begin
            ALUSrc = 0;
            MemtoReg = 1'bx;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            Branch = 1;
            ALUOp = 2'b01;
            end 
        7'b0010011: // I type (addi)
            begin
            ALUSrc = 1;
            MemtoReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            ALUOp = 2'b00;
            end 
        default: // initializing 
            begin
            ALUSrc = 0;
            MemtoReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            ALUOp = 2'b00;
            end 
    endcase
end
endmodule
