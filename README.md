# Physical Design Of ASIC's

This project simulates the overlapping Moore Design for Sequence Detection of 1010.

# Introduction
Sequence detector is used to detect a particular type of sequence. It goes High or (bit 1) when it detects a particular sequence inside the input or else it stays Low or (bit 0). This design consists of 5 different states namely, S0,S1,S2,S3,S4. This design sets the output High or (bit 1) only if the sequence '1010' is received and since it's overlapping, it will continue to takes inputs after that respond accordingly.

# Block Diagram of FSM
Mainly two types of FSM are known, Moore and Mealy machine. In Moore, output state is only defined with the help of current input contrary to how a Mealy machine works which takes current state as well as input to determine the output.Our major focus will be on Sequence Detection using Moore Finite State Machine (FSM). 

![Moore](https://user-images.githubusercontent.com/81183082/183687725-b0854148-0e79-4d09-965d-6db56baa5cd1.jpg)

S0 (Reset or Zero State)
Design of the Moore machine starts with the state S0 where we receive our first input signal. If we receive bit 1, we move to the next state of S1 or else we loop back to this state. We can also refer this state as the Reset State because every time we do not get the next desired input bit, we can always hop back to this state and restart the process.

S1 (One State)
We now have received the bit 1 and on receiving the bit 1 again, we will stay in this state, or else we move to next state of S2.

S2 (OneZero State)
We will advance to next state of S2 if we receive the bit 1 or else we will go back to state S0 because the sequence will be broken now.

S3(OneZeroOne State)
On receiving the bit 0, we will advance to next state or else we will move back to S1 state on receiving bit 1.

S4 (OneZeroOneZero State)
If we receive the bit 0, we will be going to state S1 as we can continue it for the next sequence or we will move to state S3 if we receive the bit 1. Irrespective of what bit is recieved in this state, output will trigger to high and then change corresponding to the inputs provided.
Below shown is the wave file's output n testing the verilog code out against the testbench provided


# About Verilog
Icarus Verilog is an implementation of the Verilog hardware description language. We have used this for our implementations of Sequence Detection.

# About GTKWave
GTKWave is a fully featured GTK+ v1. 2 based wave viewer for Unix and Win32 which reads Ver Structural Verilog Compiler generated AET files as well as standard Verilog VCD/EVCD files and allows their viewing

# Installing GTKWave and iverilog
## For Mac OSX
Open the terminal on your mac and type this command to install iverilog and gtkwave

`brew install icarus-verilog
sudo port install gtkwave`

## Functional Simulation

To clone this repository and clone this netlist files for simulation, type the following commands

`cd (to a directory where you want to clone)
git clone https://github.com/ParasVekariya/Physical-Design-Of-ASIC-s.git
cd Physical-Design-Of-ASIC-s
iverilog iiitb_sdMoore.v iiitb_sdMoore_tb.v
./a.out
gtkwave test.vcd`

# Simulations
On following the above steps, you will be able to see something like this. You will have to add clk, y and din traces while simulating in gtkwave to see the result

<img width="255" alt="Screenshot%202022-08-05%20at%203 55 09%20PM" src="https://user-images.githubusercontent.com/81183082/183825242-d1b2c734-9bcb-47db-aa10-a827f5a71dcb.png">

* **Note** The above waveform was generated using a Visual Studio Code Extension called [WaveTrace](https://marketplace.visualstudio.com/items?itemName=wavetrace.wavetrace) *
