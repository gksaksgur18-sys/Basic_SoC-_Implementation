`timescale 1ns / 1ps

module tb_counter_100;

	reg        clk;
	reg        rst_n;
	reg        i_btn;
	wire [6:0] o_cnt;

	counter_100 u_counter_100 (
		.clk   (clk  ),
		.rst_n (rst_n),
		.i_btn (i_btn),
		.o_cnt (o_cnt)
	);

	wire [1:0] current_state = u_counter_100.state;

	always #5 clk = ~clk;

	initial begin
		clk   = 0;
		rst_n = 0;
		i_btn = 0;
		#40;
		
		rst_n = 1;
		#40;

		i_btn = 1; #80;
		i_btn = 0;
		#400;

		i_btn = 1; #80;
		i_btn = 0;
		#400;

		i_btn = 1; #80;
		i_btn = 0;
		


	end

endmodule
