`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2025 19:49:25
// Design Name: 
// Module Name: Tb_forwarding
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


module Tb_forwarding();

reg clk, reset;
wire [63:0] PC_to_INSTMEM;
wire [31:0] instruction;
wire [63:0] index1,index2,index3,index4,index5,index6,index7;
RISCV_PP_forwarding Processor(
    clk,
    reset,
    PC_to_INSTMEM,
    instruction,
    index1,
    index2,
    index3, 
    index4,
    index5,
    index6,
    index7
);

initial 
 
 begin 
  
  clk = 1'b0; 
   
  reset = 1'b1; 
   
  #10 reset = 1'b0; 
 end 
  
  
always  
 
 #5 clk = ~clk; 

endmodule
