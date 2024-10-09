`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux32Bit2To1(out, inA, inB, sel);

    output reg [31:0] out;
    
    input [31:0] inA;  // 32-bit input A
    input [31:0] inB;  // 32-bit input B
    input sel;         // 1-bit select signal

    always @(*) begin
        if (sel == 1'b0)
            out = inA;   // Select inA when sel is 0
        else
            out = inB;   // Select inB when sel is 1
    end

endmodule
