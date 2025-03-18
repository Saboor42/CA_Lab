module tb_processor;

logic clk;
logic reset;

// Instantiate the Processor
datapath dut (
    .clk(clk),
    .reset(reset)
);

// Clock Generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

// Testbench
initial begin
    // Initialize signals
    clk = 0;
    reset = 1;

    // Data Memory
    dut.D0.data_memory[0] = 32'd5;
    dut.D0.data_memory[1] = 32'd10;
    dut.D0.data_memory[2] = 32'd20;
    dut.D0.data_memory[3] = 32'd30;
    dut.D0.data_memory[4] = 32'd40;


    // Deassert reset
    #10 reset = 0;

    // Display
    #125 $display("MEM[2] = %h", dut.D0.data_memory[2]);

    // Run simulation for a set number of clock cycles
    #220;
    $finish;
end

endmodule