# Physical Design Of ASIC's

This project simulates the overlapping Moore Design for Sequence Detection of 1010.

# Introduction
Sequence detector is used to detect a particular type of sequence. It goes High or (bit 1) when it detects a particular sequence inside the input or else it stays Low or (bit 0). This design consists of 5 different states namely, S0,S1,S2,S3,S4. This design sets the output High or (bit 1) only if the sequence '1010' is received and since it's overlapping, it will continue to takes inputs after that respond accordingly.

# Block Diagram of FSM
We start with the state S0 where we receive our first input signal. If we receive bit 1, we move to the next state of S1 or else we loop back to this state. We can also refer this state as the Reset State because every time we do not get the next desired input bit, we can always hop back to this state and restart the process.
S1
We now have received the bit 1 and on receiving the bit 1 again, we will stay in this state, else we move to next state.
S2
We will advance to next state if we receive the bit \textbf{1} or else we will go back to state S0 because the sequence will be broken now.
S3
On receiving the bit \textbf{0}, we will advance to next state or else we will move back to S1 state on receiving bit \textbf{1}.
S4
If we receive the bit 0, we will be going to state S1 as we can continue it for the next sequence or we will move to state S3 if we receive the bit 1. Irrespective of what bit is recieved in this state, output will trigger to high and then change corresponding to the inputs provided.

![Moore](https://user-images.githubusercontent.com/81183082/183687725-b0854148-0e79-4d09-965d-6db56baa5cd1.jpg)
