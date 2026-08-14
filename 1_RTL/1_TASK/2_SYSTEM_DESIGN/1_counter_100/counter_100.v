`timescale 1ns / 1ps

module counter_100(
	input          clk   ,
	input          rst_n ,
	input          i_btn , 
	output reg [6:0] o_cnt   
);

localparam IDLE = 2'b00;
localparam RUN  = 2'b01;
localparam STOP = 2'b10;

reg [1:0]  state, next_state;
reg [25:0] clk_cnt; 

localparam CLOCK_1SEC = 10; 

// --- Debounce Parameters & Registers ---
localparam DEBOUNCE_LIMIT = 20'd2; 

reg [19:0] debounce_cnt;
reg        btn_ff1, btn_ff2;
wire       i_btn_debounced;

// 1. Button Synchronization and Debounce Logic
always @(posedge clk or negedge rst_n) begin
	if (~rst_n) begin
		btn_ff1      <= 1'b0;
		btn_ff2      <= 1'b0;
		debounce_cnt <= 0;
	end else begin
		btn_ff1 <= i_btn;
		btn_ff2 <= btn_ff1; // Synchronizer to prevent metastability
	end
end

// Debounce Timer and Input Stabilization
reg i_btn_d_reg;
always @(posedge clk or negedge rst_n) begin
	if (~rst_n) begin
		debounce_cnt <= 0;
		i_btn_d_reg  <= 1'b0;
	end else begin
		if (btn_ff2 != i_btn_d_reg) begin
			if (debounce_cnt >= DEBOUNCE_LIMIT) begin
				debounce_cnt <= 0;
				i_btn_d_reg  <= btn_ff2;
			end else begin
				debounce_cnt <= debounce_cnt + 1;
			end
		end else begin
			debounce_cnt <= 0;
		end
	end
end

// Rising Edge Detector
reg btn_prev;
always @(posedge clk or negedge rst_n) begin
	if (~rst_n) begin
		btn_prev <= 1'b0;
	end else begin
		btn_prev <= i_btn_d_reg;
	end
end

assign i_btn_debounced = i_btn_d_reg && !btn_prev;

// 2. State Update
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		state <= IDLE;
	end else begin
		state <= next_state;
	end
end

// 3. Next State Logic
always @(*) begin
	next_state = state; 
	case(state)
		IDLE : begin
			if(i_btn_debounced) next_state = RUN;
			else                next_state = IDLE;
		end
		RUN  : begin
			if(i_btn_debounced) next_state = STOP;
			else                next_state = RUN;
		end
		STOP : begin
			if(i_btn_debounced) next_state = RUN;
			else                next_state = STOP;
		end
		default : next_state = IDLE;
	endcase
end

// 4. Timer & Output Counter Logic
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		clk_cnt <= 0;
		o_cnt   <= 0;
	end else begin
		case(state)
			IDLE : begin
				clk_cnt <= 0;
				o_cnt   <= 0;
			end
			
			RUN  : begin
				if(clk_cnt == CLOCK_1SEC - 1) begin
					clk_cnt <= 0;
					if(o_cnt == 99) begin
						o_cnt <= 0;
					end else begin
						o_cnt <= o_cnt + 1;
					end
				end else begin
					clk_cnt <= clk_cnt + 1;
				end
			end
			
			STOP : begin
				clk_cnt <= clk_cnt;
				o_cnt   <= o_cnt;
			end
		endcase
	end
end

endmodule
