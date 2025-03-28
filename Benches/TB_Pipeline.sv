module tb_processor;

logic clk;
logic rst;

// Instantiate the Processor
datapath dut (
    .clk(clk),
    .rst(rst)
);

// Clock Generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

always_ff @(negedge clk) begin
	$display("REG[1] = %h", dut.rf1.reg_file[1]);
end

// Testbench
initial begin
    // Initialize signals
   #5 clk = 0;
    rst = 1;
     dut.inst_mem1.instruction_memory[0] = 32'h01900113;
     dut.inst_mem1.instruction_memory[1] = 32'h00202CA3;
     dut.inst_mem1.instruction_memory[2] = 32'h01902203;
     dut.inst_mem1.instruction_memory[3] = 32'h004101B3;
     dut.inst_mem1.instruction_memory[4] = 32'h00A18293;
     dut.inst_mem1.instruction_memory[5] = 32'h0080036F;
     dut.inst_mem1.instruction_memory[6] = 32'h00A10113;
     dut.inst_mem1.instruction_memory[7] = 32'h00A10113;
     dut.inst_mem1.instruction_memory[7] = 32'h00A20193;

    // Data Memory
     dut.dm1.data_memory[0] = 32'd5;
     dut.dm1.data_memory[1] = 32'd10;
     dut.dm1.data_memory[2] = 32'd20;
     dut.dm1.data_memory[3] = 32'd30;
     dut.dm1.data_memory[4] = 32'd40;




    // Deassert reset
    #10 rst = 0;

    // Display
    #125 $display("MEM[2] = %h",  dut.dm1.data_memory[2]);

    // Run simulation for a set number of clock cycles
    #220;
    $finish;
end

endmodule
