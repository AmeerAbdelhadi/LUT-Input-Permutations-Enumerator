
module enumerate ( prm, enm );
  input [17:0] prm;
  output [1:0] enm;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30;

  CKND0 U4 ( .I(prm[10]), .ZN(n25) );
  CKND0 U5 ( .I(prm[8]), .ZN(n21) );
  CKND0 U6 ( .I(prm[5]), .ZN(n27) );
  CKND0 U7 ( .I(prm[1]), .ZN(n19) );
  CKND2D0 U8 ( .A1(prm[0]), .A2(n11), .ZN(n12) );
  CKND0 U9 ( .I(prm[3]), .ZN(n23) );
  CKND0 U10 ( .I(prm[11]), .ZN(n9) );
  CKND0 U11 ( .I(prm[16]), .ZN(n16) );
  CKND0 U12 ( .I(prm[14]), .ZN(n13) );
  CKND2D0 U13 ( .A1(prm[6]), .A2(n11), .ZN(n3) );
  CKND0 U14 ( .I(prm[12]), .ZN(n11) );
  CKND0 U15 ( .I(prm[7]), .ZN(n4) );
  CKND0 U16 ( .I(prm[9]), .ZN(n7) );
  CKXOR2D1 U17 ( .A1(n30), .A2(n29), .Z(enm[0]) );
  MAOI222D1 U18 ( .A(prm[11]), .B(n28), .C(n27), .ZN(n29) );
  MAOI222D1 U19 ( .A(prm[4]), .B(n26), .C(n25), .ZN(n28) );
  MAOI222D1 U20 ( .A(prm[9]), .B(n24), .C(n23), .ZN(n26) );
  MAOI222D1 U21 ( .A(n22), .B(prm[2]), .C(n21), .ZN(n24) );
  MAOI222D1 U22 ( .A(prm[7]), .B(n20), .C(n19), .ZN(n22) );
  IND2D1 U23 ( .A1(prm[6]), .B1(prm[0]), .ZN(n20) );
  MAOI222D1 U24 ( .A(prm[17]), .B(n18), .C(n27), .ZN(n30) );
  MAOI222D1 U25 ( .A(prm[4]), .B(n17), .C(n16), .ZN(n18) );
  MAOI222D1 U26 ( .A(prm[15]), .B(n23), .C(n15), .ZN(n17) );
  MAOI222D1 U27 ( .A(prm[2]), .B(n14), .C(n13), .ZN(n15) );
  MAOI222D1 U28 ( .A(prm[13]), .B(n12), .C(n19), .ZN(n14) );
  MAOI222D1 U29 ( .A(prm[17]), .B(n10), .C(n9), .ZN(enm[1]) );
  MAOI222D1 U30 ( .A(prm[10]), .B(n8), .C(n16), .ZN(n10) );
  MAOI222D1 U31 ( .A(prm[15]), .B(n7), .C(n6), .ZN(n8) );
  MAOI222D1 U32 ( .A(prm[8]), .B(n5), .C(n13), .ZN(n6) );
  MAOI222D1 U33 ( .A(prm[13]), .B(n4), .C(n3), .ZN(n5) );
endmodule

