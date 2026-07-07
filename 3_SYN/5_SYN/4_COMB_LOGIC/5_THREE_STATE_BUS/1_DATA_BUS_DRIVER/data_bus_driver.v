`timescale 1ns / 1ps
module data_bus_driver(
	input [7:0] i_data_a	,
	input [7:0] i_data_b	,
	input i_en_a		,
	input i_en_b		,
	output [7:0] o_bus_data	
);

// xor's output 
wire w_select		;
// mux's output
wire [7:0] w_mux_out	;





// 1.
assign o_bus_data = (i_en_a) ? i_data_a : (i_en_b) ? i_data_b : 8'bz;



// 2.
/*
if(i_en_a)begin
	o_bus_data = i_data_a;
end
else if(i_en_b)begin
	o_bus_data = i_data_b;
end
else begin
	o_bus_data = 8'bz;  
end
*/
endmodule 


