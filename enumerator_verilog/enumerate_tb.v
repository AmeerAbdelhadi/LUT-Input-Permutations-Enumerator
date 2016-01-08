// synthesis translate_off
`timescale 1ns / 1ps
`include "define.v"

module enumerate_tb
  #( parameter CLB_N     = `CLB_N     ,
     parameter CLB_M     = `CLB_M     ,
     parameter CLB_K     = `CLB_K     ,
     parameter TBVERBOSE = `TBVERBOSE );

  localparam permWidth = `log2(CLB_M+CLB_N);
  localparam permCount = 1<<`log2f(`fact(CLB_K));
  localparam enumWidth = `log2f(`fact(CLB_K));

  integer zpi,i;
  integer errCnt;

  reg  [4*CLB_K-1:0] map [permCount-1:0];
  reg  [permWidth*CLB_K-1:0] prm;
  wire [enumWidth      -1:0] enm;

  // DUT instantiation
  enumerate enumerate_dut (
    .prm(prm),
    .enm(enm)
  );
  
  initial begin

    // init varialbles
    i = 0;
    errCnt = 0;

    // reade map file into memory
    $readmemh({CLB_K+48,"LUT.map"},map);

  end // initial begin

  always begin

    // pack each permutations with zero padding
    for(zpi=0;zpi<CLB_K;zpi=zpi+1) begin
      prm[permWidth*(zpi+1)-1-:permWidth] = {{(permWidth-4){1'b0}},map[i][4*(zpi+1)-1-:4]};
    end

    // if verbose, dump current numbers
    if (TBVERBOSE)
      #10 $write("%d: prm:%h enm:%h expecting:%4h", i, prm, enm, i);

    // check for errors, increment errors counter and display messages
    if (enm != i) begin
      if (TBVERBOSE) $display(", mismatch!");
      errCnt = errCnt + 1;
    end else if (TBVERBOSE) $display(", match!");

    // next memory line
    i = i + 1 ;                    

    // if last memory line, display final message and finish
    if (i == permCount ) begin
      if (errCnt > 0) $display("\nFinished with %d errors!\n",errCnt);
      else            $display("\nFinished successfully!\n");     
      $finish;
    end

   end // always begin

endmodule // enumerate_tb

// synthesis translate_on
