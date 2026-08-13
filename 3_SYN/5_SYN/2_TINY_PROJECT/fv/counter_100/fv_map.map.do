
//input ports
add mapped point clk clk -type PI PI
add mapped point rst_n rst_n -type PI PI
add mapped point i_btn i_btn -type PI PI

//output ports
add mapped point o_cnt[5] o_cnt[5] -type PO PO
add mapped point o_cnt[4] o_cnt[4] -type PO PO
add mapped point o_cnt[3] o_cnt[3] -type PO PO
add mapped point o_cnt[2] o_cnt[2] -type PO PO
add mapped point o_cnt[1] o_cnt[1] -type PO PO
add mapped point o_cnt[0] o_cnt[0] -type PO PO

//inout ports




//Sequential Pins
add mapped point clk_cnt[0]/q clk_cnt_reg[0]/Q -type DFF DFF
add mapped point clk_cnt[1]/q clk_cnt_reg[1]/Q -type DFF DFF
add mapped point clk_cnt[2]/q clk_cnt_reg[2]/Q -type DFF DFF
add mapped point clk_cnt[3]/q clk_cnt_reg[3]/Q -type DFF DFF
add mapped point clk_cnt[4]/q clk_cnt_reg[4]/Q -type DFF DFF
add mapped point clk_cnt[5]/q clk_cnt_reg[5]/Q -type DFF DFF
add mapped point clk_cnt[6]/q clk_cnt_reg[6]/Q -type DFF DFF
add mapped point clk_cnt[7]/q clk_cnt_reg[7]/Q -type DFF DFF
add mapped point clk_cnt[8]/q clk_cnt_reg[8]/Q -type DFF DFF
add mapped point clk_cnt[9]/q clk_cnt_reg[9]/Q -type DFF DFF
add mapped point clk_cnt[10]/q clk_cnt_reg[10]/Q -type DFF DFF
add mapped point clk_cnt[11]/q clk_cnt_reg[11]/Q -type DFF DFF
add mapped point clk_cnt[12]/q clk_cnt_reg[12]/Q -type DFF DFF
add mapped point clk_cnt[13]/q clk_cnt_reg[13]/Q -type DFF DFF
add mapped point clk_cnt[14]/q clk_cnt_reg[14]/Q -type DFF DFF
add mapped point clk_cnt[15]/q clk_cnt_reg[15]/Q -type DFF DFF
add mapped point clk_cnt[16]/q clk_cnt_reg[16]/Q -type DFF DFF
add mapped point clk_cnt[17]/q clk_cnt_reg[17]/Q -type DFF DFF
add mapped point clk_cnt[18]/q clk_cnt_reg[18]/Q -type DFF DFF
add mapped point clk_cnt[19]/q clk_cnt_reg[19]/Q -type DFF DFF
add mapped point clk_cnt[20]/q clk_cnt_reg[20]/Q -type DFF DFF
add mapped point clk_cnt[21]/q clk_cnt_reg[21]/Q -type DFF DFF
add mapped point clk_cnt[22]/q clk_cnt_reg[22]/Q -type DFF DFF
add mapped point clk_cnt[23]/q clk_cnt_reg[23]/Q -type DFF DFF
add mapped point clk_cnt[24]/q clk_cnt_reg[24]/Q -type DFF DFF
add mapped point clk_cnt[25]/q clk_cnt_reg[25]/Q -type DFF DFF
add mapped point o_cnt[0]/q o_cnt_reg[0]/Q -type DFF DFF
add mapped point o_cnt[1]/q o_cnt_reg[1]/Q -type DFF DFF
add mapped point o_cnt[2]/q o_cnt_reg[2]/Q -type DFF DFF
add mapped point o_cnt[3]/q o_cnt_reg[3]/Q -type DFF DFF
add mapped point o_cnt[4]/q o_cnt_reg[4]/Q -type DFF DFF
add mapped point o_cnt[5]/q o_cnt_reg[5]/Q -type DFF DFF
add mapped point state[0]/q state_reg[0]/Q -type DFF DFF
add mapped point state[1]/q state_reg[1]/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
