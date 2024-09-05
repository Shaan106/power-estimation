`timescale 1ns/1ps

module clocked_adder_tb;
    reg [3:0] A, B;
    reg clk;
    wire [4:0] sum;

    clocked_adder uut (
        .A(A),
        .B(B),
        .clk(clk),
        .sum(sum)
    );

    initial begin
        $dumpfile("clocked_adder.vcd");
        $dumpvars(0, clocked_adder_tb);
        
        // Initialize inputs
        clk = 0;
        A = 4'b0000;
        B = 4'b0000;
        
        #5 A = 4'b0010; B = 4'b0011;
        #10 A = 4'b0100; B = 4'b0101;
        #10 A = 4'b1000; B = 4'b0110;
        #10 $finish;
    end

    // Clock generation
    always #5 clk = ~clk;

endmodule
