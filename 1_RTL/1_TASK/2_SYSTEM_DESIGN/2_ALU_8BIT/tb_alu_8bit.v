`timescale 1ns/1ps

module tb_alu_8bit;
    reg [7:0] t_i_a;
    reg [7:0] t_i_b;
    reg [3:0] t_i_op;
    wire [7:0] t_o_result;
    wire t_o_error;

    alu_8bit uut (
        .i_a(t_i_a),
        .i_b(t_i_b),
        .i_op(t_i_op),
        .o_result(t_o_result),
        .o_error(t_o_error)
    );

    initial begin
        t_i_a = 8'd0;
        t_i_b = 8'd0;
        t_i_op = 4'b0000;
        #10;

        // 1. Addition (15 + 10 = 25)
        t_i_a = 8'd15;
        t_i_b = 8'd10;
        t_i_op = 4'b0000;
        #10;

        // 2. Subtraction (25 - 5 = 20)
        t_i_a = 8'd25;
        t_i_b = 8'd5;
        t_i_op = 4'b0001;
        #10;

        // 3. Subtraction Error Test (5 - 10 -> Negative -> Error)
        t_i_a = 8'd5;
        t_i_b = 8'd10;
        t_i_op = 4'b0001;
        #10;

        // 4. Multiplication (12 * 5 = 60)
        t_i_a = 8'd12;
        t_i_b = 8'd5;
        t_i_op = 4'b0111;
        #10;

        // 5. Multiplication Overflow Error Test (20 * 20 -> Error)
        t_i_a = 8'd20;
        t_i_b = 8'd20;
        t_i_op = 4'b0111;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | Op=%b | A=%d | B=%d | Result=%d | Error=%b",
                 $time, t_i_op, t_i_a, t_i_b, t_o_result, t_o_error);
    end

endmodule
