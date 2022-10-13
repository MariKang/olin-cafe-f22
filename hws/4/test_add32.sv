`timescale 1ns/1ps
`default_nettype none

module test_add32;

logic [31:0] a, b;
wire [31:0] sum;
logic c_in;
wire [1:0] c_out;

parameter bits = 2 ** 32;

logic [31:0] correct_sum;

add32 UUT(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));


always_comb begin : behavioural_solution_logic
  correct_sum = a + b;
end


initial begin
  $dumpfile("adder32.vcd");
	$dumpvars(0, UUT);

  $display("Overflow testing.");
  
  // check overflow
  a = (1 << (31));
  b = (1 << (31));
  c_in = 0;
  #1 $display("%d + %d = %d", a, b, sum);
  

  $display("Random testing.");
  for (int i = 0; i < 10; i = i + 1) begin : random_testing
    a = $urandom() % bits;
    b = $urandom() % bits;
    c_in = 0;
    #1 $display("%d + %d = %d", a, b, sum);
  end

end


always @(a,b) begin
  assert(sum === correct_sum) else begin
    $display("ERROR: The correct sum should be %d, is %d", correct_sum, sum);
  end
end

endmodule