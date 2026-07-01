`timescale 1ns / 1ps

module interrupt_controller(
	input [7:0] i_int	,
	input i_int_ack		, 
	output o_int_req	, 
	output [2:0] o_int_id	  //3bit?
);

reg [7:0] r_active_int	; // resister

reg [2:0] o_int_id	; // 8 < 2^(3bit)
reg 	  o_int_req	;

always@(*) begin
	o_int_req    = 1'b0	;
	o_int_id     = 3'b000	;
	r_active_int = i_int	;

	if(i_int_ack) begin
		r_active_int = 8'b0000_0000;
	end else begin
		casex (r_active_int)
			8'b1xxx_xxxx: begin o_int_id = 3'b111; o_int_req = 1'b1; end // int7
			8'b01xx_xxxx: begin o_int_id = 3'b110; o_int_req = 1'b1; end // int6
			8'b001x_xxxx: begin o_int_id = 3'b101; o_int_req = 1'b1; end // int5
			8'b0001_xxxx: begin o_int_id = 3'b100; o_int_req = 1'b1; end // int4
			8'b0000_1xxx: begin o_int_id = 3'b011; o_int_req = 1'b1; end // int3
			8'b0000_01xx: begin o_int_id = 3'b010; o_int_req = 1'b1; end // int2
			8'b0000_001x: begin o_int_id = 3'b001; o_int_req = 1'b1; end // int1
			8'b0000_0001: begin o_int_id = 3'b000; o_int_req = 1'b1; end // int0
			default     : begin o_int_id = 3'b000; o_int_req = 1'b0; end 
		endcase
	end
end

endmodule
