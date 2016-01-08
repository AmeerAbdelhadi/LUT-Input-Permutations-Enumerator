// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on
`include "define.v"

`ifndef countones_DW
  // uncomment the following line to enable DW implementation
  //`define countones_DW
`endif

module countOnes
  #( width = 5 )
   ( input      [width         -1:0] vec ,
     output reg [`log2(width+1)-1:0] cnt );

  `ifdef countones_DW

    // DW count-ones
    `include "DW_dp_count_ones_function.inc"
    assign cnt = DWF_dp_count_ones(vec);

  `else

    // behavioral count-ones
    integer i;
    always @* begin 
      cnt = 0;
      for (i=0; i<width; i=i+1) cnt = cnt + vec[i];
    end

  `endif

endmodule
