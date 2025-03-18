module inst_mem(
    input logic [31:0] address,
    output logic [31:0] instruction
);
    logic [31:0] instruction_memory [0:1023];

    initial begin
	$readmemh("D:/KAAM/COURSE/SEMESTER_6/Computer_Architecture/Lab/Test/build/main.txt", instruction_memory);
	end

    assign instruction = instruction_memory[address[11:2]];

endmodule