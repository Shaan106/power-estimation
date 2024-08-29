module clocked_adder (
    input wire [3:0] A, B,
    input wire clk,
    output wire [4:0] sum
);


    reg [4:0] temp;
    always @(posedge clk) begin
        temp <= A + B;
    end

    assign sum = temp;

endmodule
