`timescale 1ns / 1ps

module gpio_mux(
	input in_0	,
	input in_1	,
	input in_2	,
	input in_3	,
	input [1:0] sel ,
	output reg  out
);

always@(*) begin
	case(sel)
		2'b00: out = in_0	;
		2'b01: out = in_1	;
		2'b10: out = in_2	;
		2'b11: out = in_3	;
		default: out = 1'b0	;
	endcase

end

endmodule 
