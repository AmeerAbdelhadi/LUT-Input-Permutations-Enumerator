// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on
`include "define.v"

module enumerate
  #( parameter CLB_N = `CLB_N ,
     parameter CLB_M = `CLB_M ,
     parameter CLB_K = `CLB_K )
   ( input       [`log2 (CLB_M+CLB_N )*CLB_K-1:0] prm ,
     output reg  [`log2f(`fact(CLB_K))      -1:0] enm );

  localparam permWidth = `log2 (CLB_M+CLB_N );
  localparam enumWidth = `log2f(`fact(CLB_K));

  wire [CLB_K-1:0] lehmerIndicator [CLB_K-2:0];
  wire [permWidth-1:0] prmUnpacked [CLB_K-1:0];
  wire [`log2(CLB_K)-1:0] lehmer [CLB_K-2:0];

  // unpack permutation itnto 2-D array
  `UPARRAY(permWidth,CLB_K,prm,prmUnpacked);

  // generate and instantiate comparators
  genvar i;
  genvar j;
  generate
    for (  i=0 ; i<CLB_K-1 ; i=i+1  ) begin: CMPGRTi
      for (  j=i+1 ; j<CLB_K ; j=j+1  ) begin: CMPGRTj
        cmpGrt #(
          .width (permWidth)
        ) CMPGRT(
          .a(prmUnpacked[i]),
          .b(prmUnpacked[j]),
          .grt(lehmerIndicator[i][j])
        );
      end
    end 
  endgenerate

  // generate and instantiate count-ones
  genvar k;
  generate
    for (  k=0 ; k<CLB_K-1 ; k=k+1  ) begin: COUNTONESi
      countOnes #(
        .width (CLB_K-1-k)
      ) COUNTONES (
        .vec (lehmerIndicator[k][CLB_K-1:k+1]),
        .cnt (lehmer[k][`log2(CLB_K-k)-1:0])
      );
    end
  endgenerate

  // map final stage logic
  always @*
    begin
      enm[enumWidth-1] = lehmer[CLB_K-2][0];
      if ((CLB_K >= 3) && (CLB_K <= 5)) begin
        enm[enumWidth-2] = lehmer[CLB_K-3][0];
      end
      if ((CLB_K >= 4) && (CLB_K <= 5)) begin
        enm[enumWidth-3] = lehmer[CLB_K-4][0];
        enm[enumWidth-4] = lehmer[CLB_K-4][1];
      end
      if (CLB_K == 5) begin
        enm[1] = lehmer[0][0];
        enm[0] = lehmer[0][1];
      end
      if (CLB_K == 6) begin
        enm[3] = lehmer[1][0];
        enm[2] = lehmer[1][1];
      end
      if (CLB_K >= 6) begin
        enm[enumWidth-2] = lehmer[CLB_K-3][0] | lehmer[CLB_K-6][2];
        enm[enumWidth-3] = lehmer[CLB_K-3][1] | lehmer[CLB_K-6][2];
        enm[enumWidth-4] = lehmer[CLB_K-4][0];
        enm[enumWidth-5] = lehmer[CLB_K-4][1];
        enm[enumWidth-8] = lehmer[CLB_K-6][0];
        enm[enumWidth-9] = lehmer[CLB_K-6][1] | (lehmer[CLB_K-6][2] & lehmer[CLB_K-3][0]);
      end
      if (CLB_K >= 7) begin
        enm[enumWidth-6 ] = lehmer[CLB_K-5][0] | (lehmer[CLB_K-5][2] & lehmer[CLB_K-7][0]);
        enm[enumWidth-7 ] = lehmer[CLB_K-5][1] | (lehmer[CLB_K-5][2] & lehmer[CLB_K-7][1]);
        enm[enumWidth-10] = lehmer[CLB_K-7][0] |  lehmer[CLB_K-5][2];
        enm[enumWidth-11] = lehmer[CLB_K-7][1] |  lehmer[CLB_K-5][2];
        enm[enumWidth-12] = lehmer[CLB_K-7][2] |  lehmer[CLB_K-5][2];
      end
      if (CLB_K == 8) begin
        enm[2] = lehmer[0][0];
        enm[1] = lehmer[0][1];
        enm[0] = lehmer[0][2];
      end
    end

endmodule
