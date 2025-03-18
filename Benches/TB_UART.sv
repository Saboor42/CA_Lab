module test;

logic clk,reset,valid_in,parity_sel,stop_sel,rx_en,valid_out,parity_ok;
logic [11:0] baud_divisor;
logic [7:0] data_in,data_out;

uart_top dut(clk,reset,valid_in,parity_sel,stop_sel,rx_en,data_in,baud_divisor,data_out,valid_out,parity_ok);

always
    #5 clk = ~clk;

initial begin
    clk = 0;
    valid_in = 0;
    rx_en = 0;
    reset = 1;
    parity_sel = 0;
    stop_sel = 0;
    baud_divisor = 12'd3; //0 10011100 0 1
    data_in = 8'h39; // 00111001
    #10 reset = 0;
    #20 valid_in = 1;
    #10 valid_in = 0;
    rx_en = 1;
end



endmodule