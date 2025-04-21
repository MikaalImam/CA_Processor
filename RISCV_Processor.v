`timescale 1ns / 1ps

module RISCV_SCProcessor(
    input clk, 
    input reset,
    output [63:0] PC_in, PC_out, ReadData, ReadData1, ReadData2, WriteData, ImmData, Result, 
    output [63:0] shifted_data, Data_Out, Out1, Out2,
    output [31:0] Instruction,
    output [6:0] opcode, func7, 
    output [2:0] func3,  
    output [4:0] RS1, RS2, RD,
    output [3:0] Operation, Funct,
    output [1:0] ALUOp,
    output RegWrite, MemRead, MemWrite, MemtoReg, ALUSrc, Zero, Branch, PCSrc, BranchSelect , 
    output [63:0] dm0, dm1, dm2, dm3, dm4, dm5, dm6
    );
    
    //wire [63:0] PC_in, PC_out, ReadData, ReadData1, ReadData2, WriteData, ImmData, Result; 
    //wire [63:0] shifted_data, Data_Out, Out1, Out2;
    //wire [31:0] Instruction;
    //wire [6:0] opcode, func7; 
    //wire [2:0] func3;  
    //wire [4:0] RS1, RS2, RD;
    //wire [3:0] Operation, Funct;
    //wire [1:0] ALUOp;
    //wire RegWrite, MemRead, MemWrite, MemtoReg, ALUSrc, Zero, Branch, PCSrc, BranchSelect ; 
    
    //wire [63:0] dm1, dm2, dm3, dm4, dm5;
    
    // Fetching
    Adder FOURADDER(PC_out, 64'd4, Out1);
    Mux_2x1 BRANCH(Out2, Out1, (Branch & BranchSelect), PC_in);
    Program_Counter PC(clk, reset, PC_in, PC_out);
    Instruction_Memory IM(PC_out, Instruction); 
    
    // Decode    
    Instruction_Parser IP(Instruction, opcode, RD, func3, RS1, RS2, func7);
    Imm_Gen IG(Instruction, ImmData);
    Control_Unit CU(opcode, ALUOp, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite);
    Register_file_SC RF(WriteData, RS1, RS2, RD, RegWrite, clk, reset, ReadData1, ReadData2);
    Branch_Unit BU(func3, ReadData1, ReadData2, BranchSelect);
    
    // Execute
    assign shifted_data = ImmData << 1;
    Adder BRANCHADDER(PC_out, shifted_data, Out2); 
    Mux_2x1 ALUSRC(ImmData,ReadData2, ALUSrc, Data_Out);
    assign Funct = {Instruction[30],Instruction[14:12]};
    ALU_Control ALUC(ALUOp, Funct, Operation);
    wire Is_Greater;
    ALU64 ALU(ReadData1, Data_Out, Operation, Result, Zero, Is_Greater);
    
    // Memory
    Data_Memory_SS DM(Result, ReadData2, clk, MemWrite, MemRead, ReadData, dm0, dm1, dm2, dm3, dm4, dm5, dm6);
    
    // Write Back
    Mux_2x1 WB(ReadData, Result, MemtoReg, WriteData);
    
endmodule