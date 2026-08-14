`timescale 1ns / 1ps

module alu_8bit(
    input  [7:0] i_a,
    input  [7:0] i_b,
    input  [3:0] i_op,     
    output reg [7:0] o_result,
    output reg o_error 
);

always @(*) begin
    o_result = 8'h00;
    o_error  = 1'b0;        // Default: no error

    case(i_op)
        4'b0000: o_result = i_a + i_b;             // ADD
        4'b0001: begin                             // SUB
            if (i_a < i_b) o_error = 1'b1;         // Negative result -> Error
            else           o_result = i_a - i_b;
        end
        4'b0010: o_result = i_a & i_b;             // AND
        4'b0011: o_result = i_a | i_b;             // OR
        4'b0100: o_result = i_a ^ i_b;             // XOR
        4'b0101: o_result = ~i_a;                  // NOT
        4'b0110: o_result = (i_a == i_b);          // CMP
        4'b0111: begin                             // MUL
            if ((i_a * i_b) > 8'hFF) o_error = 1'b1; // Overflow (8-bit limit) -> Error
            else                     o_result = i_a * i_b;
        end
        default: begin
            o_result = 8'h00;
            o_error  = 1'b0;
        end
    endcase
end

endmodule
