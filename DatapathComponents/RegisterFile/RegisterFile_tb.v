`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - RegisterFile.v
// Description - Test the register_file
// Suggested test case - First write arbitrary values into 
// the saved and temporary registers (i.e., register 8 through 25). Then, 2-by-2, 
// read values from these registers.
////////////////////////////////////////////////////////////////////////////////

module RegisterFile_tb();

    reg [4:0] ReadRegister1;
    reg [4:0] ReadRegister2;
    reg [4:0] WriteRegister;
    reg [31:0] WriteData;
    reg RegWrite;
    reg Clk;

    wire [31:0] ReadData1;
    wire [31:0] ReadData2;

    RegisterFile u0(
        .ReadRegister1(ReadRegister1), 
        .ReadRegister2(ReadRegister2), 
        .WriteRegister(WriteRegister), 
        .WriteData(WriteData), 
        .RegWrite(RegWrite), 
        .Clk(Clk), 
        .ReadData1(ReadData1), 
        .ReadData2(ReadData2)
    );

    initial begin
        Clk <= 1'b0;
        forever #10 Clk <= ~Clk;
    end

    initial begin
        // Initialize inputs
        ReadRegister1 = 5'd0;
        ReadRegister2 = 5'd0;
        WriteRegister = 5'd0;
        WriteData = 32'd0;
        RegWrite = 1'b0;

        // Test Case 1: Write arbitrary values into registers 8 through 25
        #20;
        for (int i = 8; i <= 25; i = i + 1) begin
            WriteRegister = i;
            WriteData = i * 32'h11111111;
            RegWrite = 1'b1;
            #20;
        end
        RegWrite = 1'b0;

        // Test Case 2: Read values from registers 8 through 25, two by two
        #20;
        for (int i = 8; i <= 24; i = i + 2) begin
            ReadRegister1 = i;
            ReadRegister2 = i + 1;
            #20;
        end

        // Finish simulation
        #20;
        $finish;
    end

endmodule
