/* Generated by Yosys 0.20 (git sha1 4fcb95ed087, clang 13.1.6 -fPIC -Os) */

module iiitb_sdMoore(clk, reset, din, dout);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  input clk;
  wire clk;
  input din;
  wire din;
  output dout;
  wire dout;
  input reset;
  wire reset;
  wire [4:0] state;
  sky130_fd_sc_hd__clkinv_1 _16_ (
    .A(state[4]),
    .Y(_12_)
  );
  sky130_fd_sc_hd__clkinv_1 _17_ (
    .A(reset),
    .Y(_05_)
  );
  sky130_fd_sc_hd__nor2_1 _18_ (
    .A(state[1]),
    .B(state[3]),
    .Y(_13_)
  );
  sky130_fd_sc_hd__nor4_1 _19_ (
    .A(state[1]),
    .B(state[2]),
    .C(state[0]),
    .D(state[3]),
    .Y(_14_)
  );
  sky130_fd_sc_hd__a31o_1 _20_ (
    .A1(dout),
    .A2(_12_),
    .A3(_14_),
    .B1(state[1]),
    .X(_11_)
  );
  sky130_fd_sc_hd__nor2b_1 _21_ (
    .A(din),
    .B_N(state[2]),
    .Y(_04_)
  );
  sky130_fd_sc_hd__nor2_1 _22_ (
    .A(din),
    .B(_13_),
    .Y(_02_)
  );
  sky130_fd_sc_hd__nor2b_1 _23_ (
    .A(_14_),
    .B_N(din),
    .Y(_03_)
  );
  sky130_fd_sc_hd__nor2_1 _24_ (
    .A(state[0]),
    .B(state[4]),
    .Y(_15_)
  );
  sky130_fd_sc_hd__nor2_1 _25_ (
    .A(din),
    .B(_15_),
    .Y(_00_)
  );
  sky130_fd_sc_hd__and2_0 _26_ (
    .A(state[4]),
    .B(din),
    .X(_01_)
  );
  sky130_fd_sc_hd__clkinv_1 _27_ (
    .A(reset),
    .Y(_06_)
  );
  sky130_fd_sc_hd__clkinv_1 _28_ (
    .A(reset),
    .Y(_07_)
  );
  sky130_fd_sc_hd__clkinv_1 _29_ (
    .A(reset),
    .Y(_08_)
  );
  sky130_fd_sc_hd__clkinv_1 _30_ (
    .A(reset),
    .Y(_09_)
  );
  sky130_fd_sc_hd__clkinv_1 _31_ (
    .A(reset),
    .Y(_10_)
  );
  sky130_fd_sc_hd__dfstp_2 _32_ (
    .CLK(clk),
    .D(_00_),
    .Q(state[0]),
    .SET_B(_05_)
  );
  sky130_fd_sc_hd__dfrtp_1 _33_ (
    .CLK(clk),
    .D(_01_),
    .Q(state[1]),
    .RESET_B(_06_)
  );
  sky130_fd_sc_hd__dfrtp_1 _34_ (
    .CLK(clk),
    .D(_02_),
    .Q(state[2]),
    .RESET_B(_07_)
  );
  sky130_fd_sc_hd__dfrtp_1 _35_ (
    .CLK(clk),
    .D(_03_),
    .Q(state[3]),
    .RESET_B(_08_)
  );
  sky130_fd_sc_hd__dfrtp_1 _36_ (
    .CLK(clk),
    .D(_04_),
    .Q(state[4]),
    .RESET_B(_09_)
  );
  sky130_fd_sc_hd__dfrtp_1 _37_ (
    .CLK(clk),
    .D(_11_),
    .Q(dout),
    .RESET_B(_10_)
  );
endmodule
