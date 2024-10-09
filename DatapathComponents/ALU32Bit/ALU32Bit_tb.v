`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

    reg [3:0] ALUControl;   // control bits for ALU operation
    reg [31:0] A, B;        // inputs

    wire [31:0] ALUResult;  // answer
    wire Zero;              // Zero=1 if ALUResult == 0

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .ALUResult(ALUResult), 
        .Zero(Zero)
    );

    initial begin
        // Test ADD
        ALUControl = 4'b0000; A = 10; B = 5; #10;
        $display("ADD: %d + %d = %d, Zero = %b", A, B, ALUResult, Zero);

        // Test SUB
        ALUControl = 4'b0001; A = 10; B = 5; #10;
        $display("SUB: %d - %d = %d, Zero = %b", A, B, ALUResult, Zero);

        // Test MUL
        ALUControl = 4'b0010; A = 10; B = 5; #10;
        $display("MUL: %d * %d = %d, Zero = %b", A, B, ALUResult, Zero);

        // Test AND
        ALUControl = 4'b0011; A = 10; B = 5; #10;
        $display("AND: %d & %d = %d, Zero = %b", A, B, ALUResult, Zero);

        // Test OR
        ALUControl = 4'b0100; A = 10; B = 5; #10;
        $display("OR: %d | %d = %d, Zero = %b", A, B, ALUResult, Zero);

        // Test XOR
        ALUControl = 4'b0101; A = 10; B = 5; #10;
        $display("XOR: %d ^ %d = %d, Zero = %b", A, B, ALUResult, Zero);

        // Test NOR
        ALUControl = 4'b0110; A = 10; B = 5; #10;
        $display("NOR: ~( %d | %d ) = %d, Zero = %b", A, B, ALUResult, Zero);

        // Test SLL
        ALUControl = 4'b0111; A = 2; B = 1; #10;
        $display("SLL: %d << %d = %d, Zero = %b", B, A, ALUResult, Zero);

        // Test SRL
        ALUControl = 4'b1000; A = 2; B = 4; #10;
        $display("SRL: %d >> %d = %d, Zero = %b", B, A, ALUResult, Zero);

        // Test SLT
        ALUControl = 4'b1001; A = 10; B = 5; #10;
        $display("SLT: %d < %d = %d, Zero = %b", A, B, ALUResult, Zero);

        ALUControl = 4'b1001; A = 5; B = 10; #10;
        $display("SLT: %d < %d = %d, Zero = %b", A, B, ALUResult, Zero);

        $finish;
    end

endmodule
