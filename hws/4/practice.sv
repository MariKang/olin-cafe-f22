`timescale 1ns/1ps
`default_nettype none

module practice(rst, clk, ena, seed, out);


input wire seed, ena, rst, clk;
logic A, B, C, D;
output wire out;
reg outputt;

always_comb begin
    B = ena ? A : seed;
    A = C ^ D;
end

always_ff @(posedge clk) begin : ff1
    if (rst)
        C <= 1'b0;
    else
        C <= B;
end

always_ff @(posedge clk) begin : ff2
    if (rst)
        D <= 1'b0;
    else
        D <= C;
end

always_ff @(posedge clk) begin : ff3
    if (rst)
        outputt <= 1'b0;
    else
        outputt <= D;
end

assign out = outputt;

endmodule
