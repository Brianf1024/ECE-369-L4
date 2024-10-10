`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 11:05:34 AM
// Design Name: 
// Module Name: Controller_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench to verify the functionality of the Controller module
// 
// Dependencies: Controller.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Controller_tb;

    // Testbench signals
    reg [5:0] Opcode;
    wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, SignZero;
    wire [1:0] ALUOp;

    // Instantiate the Controller module
    Control uut (
        .RegDst(RegDst),
        .ALUSrc(ALUSrc),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUOp(ALUOp),
        .Jump(Jump),
        .SignZero(SignZero),
        .Opcode(Opcode)
    );

    initial begin
        // Initialize Opcode
        Opcode = 6'b000000; // R-type
        #10;
        // Check the outputs for R-type instruction
        $display("R-type: RegDst=%b, ALUSrc=%b, MemtoReg=%b, RegWrite=%b, MemRead=%b, MemWrite=%b, Branch=%b, ALUOp=%b, Jump=%b, SignZero=%b", 
                 RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, Jump, SignZero);

        Opcode = 6'b100011; // lw (load word)
        #10;
        // Check the outputs for lw instruction
        $display("lw: RegDst=%b, ALUSrc=%b, MemtoReg=%b, RegWrite=%b, MemRead=%b, MemWrite=%b, Branch=%b, ALUOp=%b, Jump=%b, SignZero=%b", 
                 RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, Jump, SignZero);

        Opcode = 6'b101011; // sw (store word)
        #10;
        // Check the outputs for sw instruction
        $display("sw: RegDst=%b, ALUSrc=%b, MemtoReg=%b, RegWrite=%b, MemRead=%b, MemWrite=%b, Branch=%b, ALUOp=%b, Jump=%b, SignZero=%b", 
                 RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, Jump, SignZero);

        Opcode = 6'b000101; // bne (branch if not equal)
        #10;
        // Check the outputs for bne instruction
        $display("bne: RegDst=%b, ALUSrc=%b, MemtoReg=%b, RegWrite=%b, MemRead=%b, MemWrite=%b, Branch=%b, ALUOp=%b, Jump=%b, SignZero=%b", 
                 RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, Jump, SignZero);

        Opcode = 6'b001110; // XORI (XOR immediate)
        #10;
        // Check the outputs for XORI instruction
        $display("XORI: RegDst=%b, ALUSrc=%b, MemtoReg=%b, RegWrite=%b, MemRead=%b, MemWrite=%b, Branch=%b, ALUOp=%b, Jump=%b, SignZero=%b", 
                 RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, Jump, SignZero);

        Opcode = 6'b000010; // j (jump)
        #10;
        // Check the outputs for jump instruction
        $display("jump: RegDst=%b, ALUSrc=%b, MemtoReg=%b, RegWrite=%b, MemRead=%b, MemWrite=%b, Branch=%b, ALUOp=%b, Jump=%b, SignZero=%b", 
                 RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, Jump, SignZero);

        $finish;
    end

endmodule
