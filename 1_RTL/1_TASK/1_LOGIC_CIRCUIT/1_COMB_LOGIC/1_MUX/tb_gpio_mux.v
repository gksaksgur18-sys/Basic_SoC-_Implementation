`timescale 1ns / 1ps

module tb_gpio_mux();
	reg in_0	;
	reg in_1	;
	reg in_2	;
	reg in_3	;
	reg [1:0] sel	;
	wire out	;

gpio_mux u(
	.in_0(in_0)	,
	.in_1(in_1)	,
	.in_2(in_2)	,
	.in_3(in_3)	,
	.sel(sel)	,
	.out(out)
);

initial begin
	sel  = 2'b00	;
	in_0 = 1'b1	;
	in_1 = 1'b0	;
	in_2 = 1'b1	;
	in_3 = 1'b0	;

	sel = 2'b00; #10;	
	sel = 2'b01; #10;
	sel = 2'b10; #10;
	sel = 2'b11; #10;

$finish;

end

endmodule


