`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2025 12:05:29 PM
// Design Name: 
// Module Name: Instruction_Memory_Pipelined
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

module Instruction_Memory_Pipelined(
    input [63:0] Inst_Address,
    output reg [31:0] Instruction);
    
reg [7:0] inst_mem [120:0];


//Test cases:
//h00d58533 //add x10 x11 x13
//h40d58533 //sub x10 x11 x13
//h00359513 // slli x10 x11 3
//h00358513 // addi x10 x11 3
//h04b68a63 //beq x13 x11 84
//h04210863 //beq x2 x2 80
//h04b6c663 //blt x13 11 76
//h04d5c463 //blt x11 x13 72
//h00003a03; // ld x20, 0(x0)
//h00a03023; // sd x19, 0(x0)

initial
	begin
//    {inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0]} = 32'h00d58533; // add x10 x11 x13
    {inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0]} = 32'h40d58533; // sub x10 x11 x13
//    {inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0]} = 32'h00359513; // slli x10 x11 3
//    {inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0]} = 32'h00358513; // addi x10 x11 3
//    {inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0]} = 32'h04b68a63; // beq x13 x11 84
//    {inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0]} = 32'h04210863; // beq x2 x2 80
//    {inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0]} = 32'h04b6c663; // blt x13 11 76
//    {inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0]} = 32'h04d5c463; // blt x11 x13 72
//    {inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0]} = 32'h00003a03; // ld x20, 0(x0)
//    {inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0]} = 32'h00a03023; // sd x19, 0(x0)
    

end
always @(Inst_Address)

begin
Instruction[31:24] <= inst_mem[Inst_Address + 3];
Instruction[23:16] <= inst_mem[Inst_Address + 2];
Instruction[15:8] <= inst_mem[Inst_Address + 1];
Instruction[7:0] <= inst_mem[Inst_Address];

end
endmodule