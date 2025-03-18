module uart_top_tx(
        input logic clk,reset,
        input logic valid_in,parity_sel,stop_sel,
        input logic [7:0] data,
        input logic [11:0] baud_divisor,
        output logic tx
    );

logic baud_comp;
baud_counter BC_TX(clk,reset,baud_divisor,baud_comp);

logic cnt_en_i,shift_done;
logic [3:0] stop_bit,cc_in,cc_out;
d_ff4  CC_TX(clk,reset,cnt_en_i,cc_in,cc_out);
mux2_4b M1(stop_sel,4'd11,4'd12,stop_bit);

logic cnt_en,tx_shift_en,tx_sel,tx_fifo_shift,load;
uart_tx_controller CONTROLLER_TX(clk,reset,baud_comp,shift_done,valid_in,cnt_en,tx_shift_en,tx_sel,tx_fifo_shift,load);

uart_tx_datapath DATAPATH_TX(clk,reset,load,tx_shift_en,parity_sel,tx_sel,data,tx);

always_comb begin
    cnt_en_i = cnt_en;
    cc_in = cc_out+1;
    shift_done = (cc_out == stop_bit);
end


endmodule