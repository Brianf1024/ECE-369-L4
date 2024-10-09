`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - DataMemory_tb.v
// Description - Test the 'DataMemory.v' module.
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb(); 

    reg     [31:0]  Address;
    reg     [31:0]  WriteData;
    reg             Clk;
    reg             MemWrite;
    reg             MemRead;

    wire [31:0] ReadData;

    DataMemory u0(
        .Address(Address), 
        .WriteData(WriteData), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(ReadData)
    ); 

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
    initial begin
        // Initialize inputs
        Address = 32'd0;
        WriteData = 32'd0;
        MemWrite = 1'b0;
        MemRead = 1'b0;
        
        // Test Case 1: Write to memory
        #20;
        Address = 32'd4;
        WriteData = 32'hDEADBEEF;
        MemWrite = 1'b1;
        MemRead = 1'b0;
        #20;
        MemWrite = 1'b0;

        // Test Case 2: Read from memory
        #20;
        MemRead = 1'b1;
        #20;
        MemRead = 1'b0;

        // Test Case 3: Write to another memory location
        #20;
        Address = 32'd8;
        WriteData = 32'hCAFEBABE;
        MemWrite = 1'b1;
        MemRead = 1'b0;
        #20;
        MemWrite = 1'b0;

        // Test Case 4: Read from the second memory location
        #20;
        Address = 32'd8;
        MemRead = 1'b1;
        #20;
        MemRead = 1'b0;

        // Test Case 5: Read from the first memory location again
        #20;
        Address = 32'd4;
        MemRead = 1'b1;
        #20;
        MemRead = 1'b0;

        // Finish simulation
        #20;
        $finish;
	
	end

endmodule

