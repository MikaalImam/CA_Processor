`timescale 1ns / 1ps

module Imm_Gen(
    input [31:0] instruc, 
    output reg [63:0] imm_data); 
    
//always @(instruc) begin 

//// conditions
////look at opcode bits 5 and 6
//// addi: opcode 00 -I type; 
//// ld: opcode 00 -I type
//// sd: opcode 01 - S type
//// beq: opcode 1x - SB type

//if (instruc[5]==0 && instruc[6] == 0) begin // I type
//    imm_data[11:0] <= instruc[31:20];
//end

//else if (instruc[5]==1 && instruc[6] == 0) begin // S type
//    imm_data[4:0] <= instruc[11:7]; 
//    imm_data[11:5] <= instruc[31:25]; 
//end

//else if (instruc[5]==1 && instruc[6] == 1) begin // SB type
//    imm_data[11] <= instruc[31];
//    imm_data[10] <= instruc[7];
//    imm_data[9:4] <= instruc[30:25];
//    imm_data[3:0] <= instruc[11:8];
//end

//else begin// default case
//    imm_data <= 64'h0000000000000000;
//end
//end

//always @(*)begin
//    //adding the necessary bits on msb side
//    if (imm_data[11] == 1) begin
//        imm_data[63:12] <= 52'hfffffffffffff; 
//    end
//    else begin
//        imm_data[63:12] <= 52'b0;
//    end
//end

wire [6:0] opcode;
assign opcode = instruc[6:0];

always @(*)
begin
    case (opcode)
        7'b0000011: imm_data =  {{52{instruc[31]}}, instruc [31:20]}; //I
        7'b0100011: imm_data = {{52{instruc[31]}}, instruc [31:25], instruc [11:7]}; //S
        7'b1100011: imm_data = {{52{instruc[31]}}, instruc [31] , instruc [7], instruc [30:25], instruc [11:8]};
        7'b0010011: imm_data = {    {52{instruc[31]}}, instruc[31:20] };
        default : imm_data = 64'd0;
    endcase
end


endmodule