
module enumerate ( prm, enm );
  input [11:0] prm;
  output [0:0] enm;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;

  CKND0 U3 ( .I(prm[5]), .ZN(n11) );
  CKND0 U4 ( .I(prm[10]), .ZN(n9) );
  CKND0 U5 ( .I(prm[8]), .ZN(n5) );
  CKND0 U6 ( .I(prm[1]), .ZN(n4) );
  CKND0 U7 ( .I(prm[3]), .ZN(n8) );
  MAOI222D1 U8 ( .A(prm[11]), .B(n12), .C(n11), .ZN(enm[0]) );
  MAOI222D1 U9 ( .A(prm[4]), .B(n10), .C(n9), .ZN(n12) );
  MAOI222D1 U10 ( .A(prm[9]), .B(n8), .C(n7), .ZN(n10) );
  MAOI222D1 U11 ( .A(prm[2]), .B(n6), .C(n5), .ZN(n7) );
  MAOI222D1 U12 ( .A(prm[7]), .B(n4), .C(n3), .ZN(n6) );
  IND2D1 U13 ( .A1(prm[6]), .B1(prm[0]), .ZN(n3) );
endmodule

