/*
  Outputs a pulse generator with a period of "ticks".
  out should go high for one cycle ever "ticks" clocks.
*/
module pulse_generator(clk, rst, ena, ticks, out);

parameter N = 8;
input wire clk, rst, ena;
input wire [N-1:0] ticks;
output logic out;


logic counter_comparator;

logic rst_out;

always_comb begin : comp_logic
  rst_out = (out | rst);
  out = (counter == ticks);
end


always_ff @(posedge clk) begin : ff
  if (rst_out) begin
    counter <= 0;
  end
  else if (ena) begin
    counter <= counter + 1;
  end
end
endmodule
