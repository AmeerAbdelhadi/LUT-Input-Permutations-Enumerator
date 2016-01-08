// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on
`include "define.v"

`ifndef cmpgrt_DW
  // uncomment the following line to enable DW implementation
  //`define cmpgrt_DW
`endif

module cmpGrt
  #( width = 6 )
   ( input  [width-1:0] a   ,
     input  [width-1:0] b   ,
     output             grt );

  `ifdef cmpgrt_DW

    // synopsys dc_script_begin
    // set_implementation rpl DWCMPGRT
    // synopsys dc_script_end
    // Instance of DW01_cmp2
    DW01_cmp2 #(
      .width(width)
    )
    DWCMPGRT (
      .A(a)     ,
      .B(b)     ,
      .LEQ(1'b1),
      .TC(1'b0) ,
      .LT_LE()  ,
      .GE_GT(grt)
    );

  `else
  
    // behavioral comparator
    assign grt = a > b ? 1'b1 : 1'b0;

  `endif

endmodule
