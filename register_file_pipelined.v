`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2025 12:38:40 PM
// Design Name: 
// Module Name: register_file_pipelined
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


module register_file_pipelined(
    input [63:0] WriteData,
    input [4:0] RS1,
    input [4:0] RS2,
    input [4:0] RD,
    input RegWrite,
    input clk,
    input reset,
    output reg [63:0] ReadData1,
    output reg [63:0] ReadData2,
    output [63:0] reg1, reg2, reg3
    );
//    wire    [63:0] reg1, reg2, reg3;
    reg [63:0] Registers [31:0];
    integer k;
    initial begin
        for (k = 0 ; k < 31 ; k = k + 1)
            Registers[k] = 0;
        Registers[10] = 64'd1; 
        Registers[11] = 64'd5;
        Registers[13] = 64'd10;
    end
    assign reg1 = Registers[10];
    assign reg2 = Registers[11];
    assign reg3 = Registers[13];
    // writing
        always @(posedge   clk) begin 
           if (RegWrite) begin
                Registers[RD] <= WriteData;
           end
        end
        
    // reading
    always @(*) begin
        if (reset) begin
           ReadData1 = 0; 
           ReadData2 = 0;
       end
       else begin
           // reading the register values and storing
            ReadData1 <= Registers[RS1]; 
            ReadData2 <= Registers[RS2];
        end
      end
endmodule