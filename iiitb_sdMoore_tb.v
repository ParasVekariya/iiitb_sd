`timescale 1ns / 1ps
// fpga4student.com: FPGA projects, Verilog projects, VHDL projects
// Verilog project: Verilog code for Sequence Detector using Moore FSM
// Verilog Testbench for Sequence Detector using Moore FSM 
module iiitb_sdMoore_tb;

 // Inputs
 reg din;
 reg clk;
 reg reset;

 // Outputs
 wire dout;

 // Instantiate the Sequence Detector using Moore FSM
 iiitb_sdMoore uut (
  .din(din), 
  .clk(clk), 
  .reset(reset), 
  .dout(dout)
 );
 initial begin
 $dumpfile("test.vcd");
 $dumpvars(0, iiitb_sdMoore_tb);
 clk = 0;
 forever #5 clk = ~clk;
 end 
 initial begin
  // Initialize Inputs
  din = 0;
  reset = 1;
  // Wait 100 ns for global reset to finish
  #30;
  reset = 0;
  #40;
  din = 1;
  #10;
  din = 0;
  #10;
  din = 0; 
  #10;
  din = 1; 
  #10;
  din = 0; 
  #10;
  din = 1;
  #10;
  din = 0;
  #10;
  din = 0;
  #10;
  din = 1;
  #10;
  din = 0;
  #10
  din = 0;
  #10
  din = 1;
  #10
  din = 0;
  // Add stimulus here

 end
      
endmodule
