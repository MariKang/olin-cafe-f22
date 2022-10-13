	
`timescale 1ns/1ps
`default_nettype none
/*
  Making 32 different inputs is annoying, so I use python:
  print(", ".join([f"in{i:02}" for i in range(32)]))
  The solutions will include comments for where I use python-generated HDL.
*/

module mux2(ena, in0, in1, out);
    input wire ena;
    input wire [31:0] in0, in1;
    output logic [31:0] out;

    assign out = ena ? in1 : in0;

endmodule


module mux4(s, in0, in1, in2, in3, final_out);
    input wire [1:0] s;
    input wire [31:0] in0, in1, in2, in3;
    output logic [31:0] final_out;

    logic [31:0] out0, out1;

    mux2 firstmux(s[0], in0, in1, out0);
    mux2 secondmux(s[0], in2, in3, out1);

    mux2 lastmux(s[1], out0, out1, final_out);

endmodule

module mux8(s, in0, in1, in2, in3, in4, in5, in6, in7, final_out);
    input wire [2:0] s;
    input wire [31:0] in0, in1, in2, in3, in4, in5, in6, in7;
    output logic [31:0] final_out;

    logic [31:0] out0, out1;

    mux4 firstmux(s[1:0], in0, in1, in2, in3, out0);
    mux4 secondmux(s[1:0], in4, in5, in6, in7, out1);

    mux2 lastmux(s[2], out0, out1, final_out);

endmodule


module mux16(s, in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, final_out);
    input wire [3:0]s;
    input wire [31:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15;
    output logic [31:0] final_out;

    logic [31:0] out0, out1;

    mux8 firstmux(s[2:0], in0, in1, in2, in3, in4, in5, in6, in7, out0);
    mux8 secondmux(s[2:0], in8, in9, in10, in11, in12, in13, in14, in15, out1);

    mux2 lastmux(s[3], out0, out1, final_out);

endmodule


module mux32(
  s,
  in00, in01, in02, in03, in04, in05, in06, in07, in08, in09, in10, 
  in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, 
  in22, in23, in24, in25, in26, in27, in28, in29, in30, in31,
  final_out
);
  input  wire [4:0]s;
	input  wire [31:0] in00, in01, in02, in03, in04, in05, in06, in07, in08, 
    in09, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, 
    in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31;
	output logic [31:0] final_out;

  logic [31:0] out0, out1;

  mux16 firstmux(s[3:0], in00, in01, in02, in03, in04, in05, in06, in07, in08, 
    in09, in10, in11, in12, in13, in14, in15, out0);
  mux16 secondmux(s[3:0], in16, in17, in18, in19, in20, in21, in22, in23, in24,
    in25, in26, in27, in28, in29, in30, in31, out1);

  mux2 lastmux(s[4], out0, out1, final_out);

endmodule
