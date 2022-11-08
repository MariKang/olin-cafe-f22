module comparator_lt(a, b, out);
parameter N = 32;
input wire signed [N-1:0] a, b;
output logic out;

// Using only *structural* combinational logic, make a module that computes if a is less than b!
// Note: this assumes that the two inputs are signed: aka should be interpreted as two's complement.

// Copy any other modules you use into the HDL folder and update the Makefile accordingly.

logic [N-1:0] sum;
logic is_same_sign;

adder_n #(.N(N)) addN (.a(a), .b(~b), .c_in(1'b1), .sum(sum), .c_out());

always_comb begin : complement
    is_same_sign = (a[N-1] ~^ b[N-1]);
    out = is_same_sign ? sum[N-1] : a[N-1];
end


endmodule


