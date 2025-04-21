`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2025 19:40:11
// Design Name: 
// Module Name: Branch_Control
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


module Branch_Control
(
    input Branch, Zero, Is_Greater,
    input [3:0] funct,
    output reg switch_branch, Flush
);


always @(*) begin

    
    if (Branch) begin

        case ({funct[2:0]})
            3'b000: switch_branch = Zero ? 1 : 0;
            3'b001: switch_branch = Zero ? 0 : 1;
            3'b101: switch_branch = Is_Greater ? 1 : 0;
            3'b100: switch_branch = Is_Greater ? 0 : 1;
            default: switch_branch = 0;
        endcase
    
    end
    
    else
        switch_branch = 0;
end

always @(switch_branch) begin
    if(switch_branch) Flush <= 1;

    else Flush <= 0;
    
end

endmodule // Branch_Control
