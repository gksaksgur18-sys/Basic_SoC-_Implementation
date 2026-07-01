`timescale 1ns / 1ps
module multiplexed_bus_driver(
        input [7:0] i_data_a    ,
        input [7:0] i_data_b    ,
        input i_en_a            ,
        input i_en_b            ,
        output [7:0] o_bus_data
);

// xor's output
wire w_select  	         ;
// mux's output
 wire [7:0] w_mux_out    ;

// xor
assign w_select = (i_en_a ^ i_en_b);
// mux
assign w_mux_out = (i_en_a) ? i_data_a : (i_en_b) ? i_data_b : 8'bz;
// buffer
assign o_bus_data = (w_select) ? w_mux_out : 8'bz;

endmodule
