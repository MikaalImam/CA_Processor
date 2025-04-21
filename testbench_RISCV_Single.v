`timescale 1ns / 1ps

module testbench_RISCV_Single();

reg clk, reset;
wire [63:0] PC_in, PC_out, ReadData, ReadData1, ReadData2, WriteData, ImmData, Result; 
wire [63:0] shifted_data, Data_Out, Out1, Out2;
wire [31:0] Instruction;
wire [6:0] opcode, func7; 
wire [2:0] func3;  
wire [4:0] RS1, RS2, RD;
wire [3:0] Operation, Funct;
wire [1:0] ALUOp;
wire RegWrite, MemRead, MemWrite, MemtoReg, ALUSrc, Zero, Branch, PCSrc, BranchSelect ; 
wire [63:0] val0, val1, val2, val3, val4, val5, val6;


RISCV_SCProcessor u1(clk, reset, PC_in, PC_out, ReadData, ReadData1, ReadData2, 
                    WriteData, ImmData, Result, shifted_data, Data_Out, Out1, Out2,
                    Instruction, opcode, func7, func3, RS1, RS2, RD, Operation, 
                    Funct, ALUOp, RegWrite, MemRead, MemWrite, MemtoReg, ALUSrc, 
                    Zero, Branch, PCSrc, BranchSelect , 
                    val0, val1, val2, val3, val4, val5, val6);

initial
begin
reset <= 1; #1; reset <= 0;
end


always
begin
clk <= 1; #1; clk <= 0; #1;
end
endmodule