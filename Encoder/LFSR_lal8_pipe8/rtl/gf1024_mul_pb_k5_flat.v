// ============================================================================
// GF(2^10) multiplier — PB‑Karatsuba‑5 (pure polynomial basis, fully flattened)
//   p(x) = x^10 + x^3 + 1
//   Split A = A0 + x^5*A1, B = B0 + x^5*B1   (A0,A1,B0,B1 are 5-bit polynomials)
//   T0 = A0*B0 (5x5 poly-mul → 9b)
//   T1 = A1*B1 (5x5 poly-mul → 9b)
//   T2 = (A0^A1)*(B0^B1) (5x5 poly-mul → 9b)
//   C = (T0^T1) ^ x^5*(T2^T0^T1) ^ x^3*T1   (all reductions are fixed XOR maps)
// Mapping per bit (Si = T2[i]^T0[i]^T1[i], Ui = T0[i]^T1[i]):
//   P0 = U0 ^ S5 ^ T1[7]
//   P1 = U1 ^ S6 ^ T1[8]
//   P2 = U2 ^ S7
//   P3 = U3 ^ S5 ^ S8 ^ T1[0] ^ T1[7]
//   P4 = U4 ^ S6 ^ T1[1] ^ T1[8]
//   P5 = U5 ^ S0 ^ S7 ^ T1[2]
//   P6 = U6 ^ S1 ^ S8 ^ T1[3]
//   P7 = U7 ^ S2 ^ T1[4]
//   P8 = U8 ^ S3 ^ T1[5]
//   P9 =      S4 ^       T1[6]
// ----------------------------------------------------------------------------
// Notes:
//  * mul5x5_poly below is a 5x5 polynomial multiplier (not GF(2^5) field mul!)
//    Output is degree ≤8 (9 bits).
//  * This top is purely combinational, assign-only (no for/if), suitable for
//    tight timing and CSE/fanout-controlled synthesis.
// ============================================================================

module gf1024_mul_pb_k5_flat (
  input  wire [9:0] A,  // polynomial-basis: bit i is coeff of x^i
  input  wire [9:0] B,
  output wire [9:0] P
);
  // Split 5+5
  wire [4:0] A0 = A[4:0];
  wire [4:0] A1 = A[9:5];
  wire [4:0] B0 = B[4:0];
  wire [4:0] B1 = B[9:5];

  // 5x5 polynomial multipliers (degree ≤8)
  wire [8:0] T0, T1, T2;
  mul5x5_poly u_mul00 (.a(A0),        .b(B0),        .p(T0));
  mul5x5_poly u_mul11 (.a(A1),        .b(B1),        .p(T1));
  mul5x5_poly u_mulX  (.a(A0 ^ A1),   .b(B0 ^ B1),   .p(T2));

  // Helper signals: U = T0^T1, S = T2^T0^T1
  wire U0 = T0[0] ^ T1[0];
  wire U1 = T0[1] ^ T1[1];
  wire U2 = T0[2] ^ T1[2];
  wire U3 = T0[3] ^ T1[3];
  wire U4 = T0[4] ^ T1[4];
  wire U5 = T0[5] ^ T1[5];
  wire U6 = T0[6] ^ T1[6];
  wire U7 = T0[7] ^ T1[7];
  wire U8 = T0[8] ^ T1[8];

  wire S0 = T2[0] ^ T0[0] ^ T1[0];
  wire S1 = T2[1] ^ T0[1] ^ T1[1];
  wire S2 = T2[2] ^ T0[2] ^ T1[2];
  wire S3 = T2[3] ^ T0[3] ^ T1[3];
  wire S4 = T2[4] ^ T0[4] ^ T1[4];
  wire S5 = T2[5] ^ T0[5] ^ T1[5];
  wire S6 = T2[6] ^ T0[6] ^ T1[6];
  wire S7 = T2[7] ^ T0[7] ^ T1[7];
  wire S8 = T2[8] ^ T0[8] ^ T1[8];

  // Output bits (fully flattened assigns)
  assign P[0] = U0 ^ S5 ^ T1[7];
  assign P[1] = U1 ^ S6 ^ T1[8];
  assign P[2] = U2 ^ S7;
  assign P[3] = U3 ^ S5 ^ S8 ^ T1[0] ^ T1[7];
  assign P[4] = U4 ^ S6 ^ T1[1] ^ T1[8];
  assign P[5] = U5 ^ S0 ^ S7 ^ T1[2];
  assign P[6] = U6 ^ S1 ^ S8 ^ T1[3];
  assign P[7] = U7 ^ S2 ^ T1[4];
  assign P[8] = U8 ^ S3 ^ T1[5];
  assign P[9] =      S4 ^       T1[6];
endmodule

// ---------------------------------------------------------------------------
// 5x5 polynomial multiplier (GF(2)[x], degree ≤4 × degree ≤4 → degree ≤8)
// AND-only partial products, XOR reductions; no control, no muxes.
// ---------------------------------------------------------------------------
module mul5x5_poly (
  input  wire [4:0] a,
  input  wire [4:0] b,
  output wire [8:0] p
);
  wire a0=a[0], a1=a[1], a2=a[2], a3=a[3], a4=a[4];
  wire b0=b[0], b1=b[1], b2=b[2], b3=b[3], b4=b[4];

  assign p[0] = (a0 & b0);
  assign p[1] = (a0 & b1) ^ (a1 & b0);
  assign p[2] = (a0 & b2) ^ (a1 & b1) ^ (a2 & b0);
  assign p[3] = (a0 & b3) ^ (a1 & b2) ^ (a2 & b1) ^ (a3 & b0);
  assign p[4] = (a0 & b4) ^ (a1 & b3) ^ (a2 & b2) ^ (a3 & b1) ^ (a4 & b0);
  assign p[5] = (a1 & b4) ^ (a2 & b3) ^ (a3 & b2) ^ (a4 & b1);
  assign p[6] = (a2 & b4) ^ (a3 & b3) ^ (a4 & b2);
  assign p[7] = (a3 & b4) ^ (a4 & b3);
  assign p[8] = (a4 & b4);
endmodule
