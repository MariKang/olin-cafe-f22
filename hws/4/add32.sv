`timescale 1ns/1ps
`default_nettype none

module adder1(a, b, c_in, sum, c_out);
    input wire a;
    input wire b;
    input wire c_in;

    output wire sum;
    output wire c_out;

    assign sum = (a ^ b) ^ c_in;

    assign c_out = (a & b) | (a & c_in) | (b & c_in);
  
endmodule



module add32(a, b, c_in, sum, c_out);

input  wire [31:0] a, b;
input wire c_in;
output logic [31:0] sum;
output wire c_out;

wire [32:0] carries;
assign carries[0] = c_in;
assign c_out = carries[32];
generate
  genvar i;
  for(i = 0; i < 32; i++) begin : ripple_carry
    adder1 ADDER (
      .a(a[i]),
      .b(b[i]),
      .c_in(carries[i]),
      .sum(sum[i]),
      .c_out(carries[i+1])
    );
  end
endgenerate

endmodule