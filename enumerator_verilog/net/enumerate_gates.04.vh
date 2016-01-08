
module enumerate ( prm, enm );
  input [23:0] prm;
  output [3:0] enm;
  wire   n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61;

  CKND0 U10 ( .I(n36), .ZN(enm[0]) );
  CKND0 U11 ( .I(prm[6]), .ZN(n49) );
  CKND0 U12 ( .I(prm[8]), .ZN(n53) );
  CKND0 U13 ( .I(prm[10]), .ZN(n57) );
  CKND0 U14 ( .I(prm[22]), .ZN(n12) );
  CKND0 U15 ( .I(prm[20]), .ZN(n9) );
  CKND0 U16 ( .I(prm[12]), .ZN(n7) );
  CKND0 U17 ( .I(n40), .ZN(enm[1]) );
  CKND0 U18 ( .I(prm[9]), .ZN(n30) );
  CKND0 U19 ( .I(prm[7]), .ZN(n27) );
  CKND0 U20 ( .I(prm[11]), .ZN(n35) );
  CKND0 U21 ( .I(prm[15]), .ZN(n44) );
  CKND0 U22 ( .I(prm[13]), .ZN(n41) );
  CKND0 U23 ( .I(prm[17]), .ZN(n48) );
  CKND0 U24 ( .I(prm[21]), .ZN(n54) );
  CKND0 U25 ( .I(prm[0]), .ZN(n25) );
  CKND0 U26 ( .I(prm[19]), .ZN(n51) );
  CKND0 U27 ( .I(prm[2]), .ZN(n29) );
  CKND0 U28 ( .I(prm[4]), .ZN(n33) );
  CKND0 U29 ( .I(prm[23]), .ZN(n59) );
  CKXOR2D1 U30 ( .A1(n61), .A2(n60), .Z(enm[2]) );
  MAOI222D1 U31 ( .A(prm[11]), .B(n59), .C(n58), .ZN(n60) );
  MAOI222D1 U32 ( .A(prm[22]), .B(n57), .C(n56), .ZN(n58) );
  MAOI222D1 U33 ( .A(prm[9]), .B(n55), .C(n54), .ZN(n56) );
  MAOI222D1 U34 ( .A(prm[20]), .B(n53), .C(n52), .ZN(n55) );
  MAOI222D1 U35 ( .A(prm[7]), .B(n51), .C(n50), .ZN(n52) );
  NR2D1 U36 ( .A1(n49), .A2(prm[18]), .ZN(n50) );
  MAOI222D1 U37 ( .A(prm[11]), .B(n48), .C(n47), .ZN(n61) );
  MAOI222D1 U38 ( .A(prm[16]), .B(n57), .C(n46), .ZN(n47) );
  MAOI222D1 U39 ( .A(prm[9]), .B(n45), .C(n44), .ZN(n46) );
  MAOI222D1 U40 ( .A(prm[14]), .B(n53), .C(n43), .ZN(n45) );
  MAOI222D1 U41 ( .A(prm[7]), .B(n42), .C(n41), .ZN(n43) );
  NR2D1 U42 ( .A1(prm[12]), .A2(n49), .ZN(n42) );
  MAOI222D1 U43 ( .A(prm[23]), .B(n14), .C(n48), .ZN(enm[3]) );
  MAOI222D1 U44 ( .A(prm[16]), .B(n13), .C(n12), .ZN(n14) );
  MAOI222D1 U45 ( .A(prm[21]), .B(n44), .C(n11), .ZN(n13) );
  MAOI222D1 U46 ( .A(prm[14]), .B(n10), .C(n9), .ZN(n11) );
  OAI32D1 U47 ( .A1(n8), .A2(n7), .A3(prm[18]), .B1(prm[19]), .B2(n41), .ZN(
        n10) );
  NR2D1 U48 ( .A1(prm[13]), .A2(n51), .ZN(n8) );
  MAOI222D1 U49 ( .A(prm[5]), .B(n35), .C(n34), .ZN(n37) );
  MAOI222D1 U50 ( .A(prm[10]), .B(n33), .C(n32), .ZN(n34) );
  MAOI222D1 U51 ( .A(prm[3]), .B(n31), .C(n30), .ZN(n32) );
  MAOI222D1 U52 ( .A(prm[8]), .B(n29), .C(n28), .ZN(n31) );
  MAOI222D1 U53 ( .A(prm[1]), .B(n27), .C(n26), .ZN(n28) );
  NR2D1 U54 ( .A1(n25), .A2(prm[6]), .ZN(n26) );
  MAOI222D1 U55 ( .A(prm[5]), .B(n48), .C(n24), .ZN(n38) );
  MAOI222D1 U56 ( .A(prm[16]), .B(n33), .C(n23), .ZN(n24) );
  MAOI222D1 U57 ( .A(prm[3]), .B(n22), .C(n44), .ZN(n23) );
  MAOI222D1 U58 ( .A(prm[14]), .B(n29), .C(n21), .ZN(n22) );
  MAOI222D1 U59 ( .A(prm[1]), .B(n41), .C(n20), .ZN(n21) );
  NR2D1 U60 ( .A1(n25), .A2(prm[12]), .ZN(n20) );
  MAOI222D1 U61 ( .A(prm[5]), .B(n59), .C(n19), .ZN(n39) );
  MAOI222D1 U62 ( .A(prm[22]), .B(n33), .C(n18), .ZN(n19) );
  MAOI222D1 U63 ( .A(prm[3]), .B(n17), .C(n54), .ZN(n18) );
  MAOI222D1 U64 ( .A(prm[20]), .B(n29), .C(n16), .ZN(n17) );
  MAOI222D1 U65 ( .A(prm[1]), .B(n51), .C(n15), .ZN(n16) );
  NR2D1 U66 ( .A1(n25), .A2(prm[18]), .ZN(n15) );
  FA1D0 U67 ( .A(n39), .B(n38), .CI(n37), .CO(n36), .S(n40) );
endmodule

