
module enumerate ( prm, enm );
  input [29:0] prm;
  output [5:0] enm;
  wire   n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107;

  ND2D1 U20 ( .A1(n54), .A2(n53), .ZN(n52) );
  ND2D1 U21 ( .A1(n51), .A2(n50), .ZN(n53) );
  XNR2D1 U22 ( .A1(n107), .A2(n106), .ZN(enm[4]) );
  INVD1 U23 ( .I(prm[22]), .ZN(n91) );
  ND2D1 U24 ( .A1(prm[12]), .A2(n84), .ZN(n86) );
  INVD1 U25 ( .I(n83), .ZN(enm[3]) );
  INVD1 U26 ( .I(prm[28]), .ZN(n19) );
  INVD1 U27 ( .I(prm[26]), .ZN(n16) );
  INVD1 U28 ( .I(n79), .ZN(enm[2]) );
  INVD1 U29 ( .I(prm[15]), .ZN(n90) );
  INVD1 U30 ( .I(prm[13]), .ZN(n85) );
  INVD1 U31 ( .I(prm[17]), .ZN(n93) );
  INVD1 U32 ( .I(prm[21]), .ZN(n66) );
  INVD1 U33 ( .I(prm[19]), .ZN(n64) );
  ND2D1 U34 ( .A1(n57), .A2(n56), .ZN(n55) );
  INVD1 U35 ( .I(prm[10]), .ZN(n77) );
  INVD1 U36 ( .I(prm[8]), .ZN(n74) );
  ND2D1 U37 ( .A1(prm[0]), .A2(n71), .ZN(n41) );
  INVD1 U38 ( .I(prm[6]), .ZN(n71) );
  INVD1 U39 ( .I(prm[5]), .ZN(n46) );
  INVD1 U40 ( .I(prm[16]), .ZN(n103) );
  INVD1 U41 ( .I(prm[14]), .ZN(n99) );
  ND2D1 U42 ( .A1(prm[0]), .A2(n95), .ZN(n35) );
  INVD1 U43 ( .I(prm[12]), .ZN(n95) );
  INVD1 U44 ( .I(n25), .ZN(n26) );
  INVD1 U45 ( .I(prm[20]), .ZN(n87) );
  INVD1 U46 ( .I(prm[1]), .ZN(n40) );
  ND2D1 U47 ( .A1(prm[0]), .A2(n84), .ZN(n22) );
  INVD1 U48 ( .I(prm[18]), .ZN(n84) );
  INVD1 U49 ( .I(prm[3]), .ZN(n43) );
  INVD1 U50 ( .I(prm[23]), .ZN(n70) );
  INVD1 U51 ( .I(prm[27]), .ZN(n100) );
  INVD1 U52 ( .I(prm[25]), .ZN(n97) );
  INVD1 U53 ( .I(prm[2]), .ZN(n30) );
  INVD1 U54 ( .I(prm[4]), .ZN(n33) );
  INVD1 U55 ( .I(prm[29]), .ZN(n105) );
  OAI211D1 U56 ( .A1(n54), .A2(n53), .B(n55), .C(n52), .ZN(enm[0]) );
  NR2D1 U57 ( .A1(n48), .A2(n49), .ZN(n54) );
  MAOI222D1 U58 ( .A(prm[17]), .B(n105), .C(n104), .ZN(n106) );
  MAOI222D1 U59 ( .A(prm[28]), .B(n103), .C(n102), .ZN(n104) );
  MAOI222D1 U60 ( .A(prm[15]), .B(n101), .C(n100), .ZN(n102) );
  MAOI222D1 U61 ( .A(prm[26]), .B(n99), .C(n98), .ZN(n101) );
  MAOI222D1 U62 ( .A(prm[13]), .B(n97), .C(n96), .ZN(n98) );
  NR2D1 U63 ( .A1(n95), .A2(prm[24]), .ZN(n96) );
  MAOI222D1 U64 ( .A(prm[23]), .B(n94), .C(n93), .ZN(n107) );
  MAOI222D1 U65 ( .A(prm[16]), .B(n92), .C(n91), .ZN(n94) );
  MAOI222D1 U66 ( .A(prm[21]), .B(n90), .C(n89), .ZN(n92) );
  MAOI222D1 U67 ( .A(prm[14]), .B(n88), .C(n87), .ZN(n89) );
  MAOI222D1 U68 ( .A(prm[19]), .B(n86), .C(n85), .ZN(n88) );
  MAOI222D1 U69 ( .A(prm[29]), .B(n21), .C(n70), .ZN(enm[5]) );
  MAOI222D1 U70 ( .A(prm[22]), .B(n20), .C(n19), .ZN(n21) );
  MAOI222D1 U71 ( .A(prm[27]), .B(n66), .C(n18), .ZN(n20) );
  MAOI222D1 U72 ( .A(prm[20]), .B(n17), .C(n16), .ZN(n18) );
  OAI32D1 U73 ( .A1(n15), .A2(n84), .A3(prm[24]), .B1(prm[25]), .B2(n64), .ZN(
        n17) );
  NR2D1 U74 ( .A1(prm[19]), .A2(n97), .ZN(n15) );
  MAOI222D1 U75 ( .A(prm[11]), .B(n93), .C(n78), .ZN(n80) );
  MAOI222D1 U76 ( .A(prm[16]), .B(n77), .C(n76), .ZN(n78) );
  MAOI222D1 U77 ( .A(prm[9]), .B(n75), .C(n90), .ZN(n76) );
  MAOI222D1 U78 ( .A(prm[14]), .B(n74), .C(n73), .ZN(n75) );
  MAOI222D1 U79 ( .A(prm[7]), .B(n72), .C(n85), .ZN(n73) );
  NR2D1 U80 ( .A1(prm[12]), .A2(n71), .ZN(n72) );
  MAOI222D1 U81 ( .A(prm[11]), .B(n70), .C(n69), .ZN(n81) );
  MAOI222D1 U82 ( .A(prm[22]), .B(n77), .C(n68), .ZN(n69) );
  MAOI222D1 U83 ( .A(prm[9]), .B(n67), .C(n66), .ZN(n68) );
  MAOI222D1 U84 ( .A(prm[20]), .B(n74), .C(n65), .ZN(n67) );
  MAOI222D1 U85 ( .A(prm[7]), .B(n64), .C(n63), .ZN(n65) );
  NR2D1 U86 ( .A1(n71), .A2(prm[18]), .ZN(n63) );
  MAOI222D1 U87 ( .A(prm[11]), .B(n105), .C(n62), .ZN(n82) );
  MAOI222D1 U88 ( .A(prm[28]), .B(n77), .C(n61), .ZN(n62) );
  MAOI222D1 U89 ( .A(prm[9]), .B(n60), .C(n100), .ZN(n61) );
  MAOI222D1 U90 ( .A(prm[26]), .B(n74), .C(n59), .ZN(n60) );
  MAOI222D1 U91 ( .A(prm[7]), .B(n97), .C(n58), .ZN(n59) );
  NR2D1 U92 ( .A1(n71), .A2(prm[24]), .ZN(n58) );
  OA21D1 U93 ( .A1(n57), .A2(n56), .B(n55), .Z(enm[1]) );
  CKXOR2D1 U94 ( .A1(n51), .A2(n50), .Z(n56) );
  MAOI222D1 U95 ( .A(prm[11]), .B(n47), .C(n46), .ZN(n50) );
  MAOI222D1 U96 ( .A(prm[4]), .B(n45), .C(n77), .ZN(n47) );
  MAOI222D1 U97 ( .A(prm[9]), .B(n44), .C(n43), .ZN(n45) );
  MAOI222D1 U98 ( .A(n42), .B(prm[2]), .C(n74), .ZN(n44) );
  MAOI222D1 U99 ( .A(prm[7]), .B(n41), .C(n40), .ZN(n42) );
  MAOI222D1 U100 ( .A(prm[17]), .B(n39), .C(n46), .ZN(n51) );
  MAOI222D1 U101 ( .A(prm[4]), .B(n38), .C(n103), .ZN(n39) );
  MAOI222D1 U102 ( .A(prm[15]), .B(n43), .C(n37), .ZN(n38) );
  MAOI222D1 U103 ( .A(prm[2]), .B(n36), .C(n99), .ZN(n37) );
  MAOI222D1 U104 ( .A(prm[13]), .B(n35), .C(n40), .ZN(n36) );
  CKXOR2D1 U105 ( .A1(n49), .A2(n48), .Z(n57) );
  MAOI222D1 U106 ( .A(n70), .B(n27), .C(prm[5]), .ZN(n48) );
  MAOI222D1 U107 ( .A(n33), .B(n26), .C(prm[22]), .ZN(n27) );
  MAOI222D1 U108 ( .A(prm[21]), .B(n43), .C(n24), .ZN(n25) );
  MAOI222D1 U109 ( .A(prm[2]), .B(n23), .C(n87), .ZN(n24) );
  MAOI222D1 U110 ( .A(prm[19]), .B(n22), .C(n40), .ZN(n23) );
  MAOI222D1 U111 ( .A(prm[5]), .B(n105), .C(n34), .ZN(n49) );
  MAOI222D1 U112 ( .A(prm[28]), .B(n33), .C(n32), .ZN(n34) );
  MAOI222D1 U113 ( .A(prm[3]), .B(n31), .C(n100), .ZN(n32) );
  MAOI222D1 U114 ( .A(prm[26]), .B(n30), .C(n29), .ZN(n31) );
  MAOI222D1 U115 ( .A(prm[1]), .B(n97), .C(n28), .ZN(n29) );
  INR2D1 U116 ( .A1(prm[0]), .B1(prm[24]), .ZN(n28) );
  FA1D0 U117 ( .A(n82), .B(n81), .CI(n80), .CO(n79), .S(n83) );
endmodule

