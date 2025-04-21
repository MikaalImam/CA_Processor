`timescale 1ns / 1ps

module Branch_Unit(
    input [2:0] Funct3,
    input [63:0] ReadData1, ReadData2,
    output reg Out);

initial 
Out = 0;

always @(*) begin
    case (Funct3)
        3'b000: // beq
            begin
                if (ReadData1 == ReadData2) begin
                    Out = 1;
                end
                else begin
                    Out = 0;
                end 
            end
        3'b100: // blt
            begin
                if (ReadData1 < ReadData2) begin
                    Out = 1;
                end
                else begin
                    Out = 0;
                end
            end
        3'b101: // bge
            begin
                if (ReadData1 > ReadData2) begin
                    Out = 1;
                end                
                else begin
                    Out = 0;
                end
            end
        endcase
    end   
endmodule