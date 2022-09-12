# Physical Design Of ASIC's

This project simulates the overlapping Moore Design for Sequence Detection where it toggles the output high for a certain input sequence. Over here the example is taken for 1010 for detection.

# Introduction
Sequence detector is used to detect a particular type of sequence. It goes High or (bit 1) when it detects a particular sequence inside the input or else it stays Low or (bit 0). This design consists of 5 different states namely, S0,S1,S2,S3,S4. This design sets the output High or (bit 1) only if the sequence '1010' is received and since it's overlapping, it will continue to takes inputs after that respond accordingly.

# Applications
Sequence Detector uses in real life
- Elevator in our building or mall is an example of moore design where we give input to reach a particular level (consider that to a state) and then we change the states (climb up or down) and it does not need any input at that point.
- Used when we want to perform certain work for a certain input instructions in machines.For example, when robot is designed to do some work.

# Block Diagram of FSM
Mainly two types of FSM are known, Moore and Mealy machine. In Moore, output state is only defined with the help of current input contrary to how a Mealy machine works which takes current state as well as input to determine the output.Our major focus will be on Sequence Detection using Moore Finite State Machine (FSM). 

![Moore](https://user-images.githubusercontent.com/81183082/183687725-b0854148-0e79-4d09-965d-6db56baa5cd1.jpg)

Below is the explanations of how the design works and also shown the workflow for better understanding.

- **S0 (Reset or Zero State)**
Design of the Moore machine starts with the state S0 where we receive our first input signal. If we receive bit 1, we move to the next state of S1 or else we loop back to this state. We can also refer this state as the Reset State because every time we do not get the next desired input bit, we can always hop back to this state and restart the process.
- **S1 (One State)**
We now have received the bit 1 and on receiving the bit 1 again, we will stay in this state, or else we move to next state of S2.
- **S2 (OneZero State)**
We will advance to next state of S2 if we receive the bit 1 or else we will go back to state S0 because the sequence will be broken now.
- **S3(OneZeroOne State)**
On receiving the bit 0, we will advance to next state or else we will move back to S1 state on receiving bit 1.
- **S4 (OneZeroOneZero State)**
If we receive the bit 0, we will be going to state S0 as we can continue it for the next sequence or we will move to state S3 if we receive the bit 1. Irrespective of what bit is recieved in this state, output will trigger to high and then change corresponding to the inputs provided.
Below shown is the wave file's output n testing the verilog code out against the testbench provided

![WhatsApp Image 2022-08-11 at 12 30 48 PM](https://user-images.githubusercontent.com/81183082/184080610-8fca64a3-d2f4-45ef-8680-867b5e5ba77f.jpeg)

## About Verilog
Icarus Verilog is an implementation of the Verilog hardware description language. We have used this for our implementations of Sequence Detection.

## About GTKWave
GTKWave is a fully featured GTK+ v1. 2 based wave viewer for Unix and Win32 which reads Ver Structural Verilog Compiler generated AET files as well as standard Verilog VCD/EVCD files and allows their viewing

## Installing GTKWave and iverilog
### For Mac OSX
Open the terminal on your mac and type this command to install iverilog and gtkwave
```
brew install icarus-verilog
brew install --cask gtkwave
 ```

## Functional Simulation

To clone this repository and clone this netlist files for simulation, type the following commands.

*Note: First command is to change your current directory to the the directory where you want to clone. If you are already in the directory, you can ignore it*
```
cd (to a directory where you want to clone)
git clone https://github.com/ParasVekariya/Physical-Design-Of-ASIC-s.git
cd Physical-Design-Of-ASIC-s
iverilog iiitb_sdMoore.v iiitb_sdMoore_tb.v
./a.out
gtkwave test.vcd
```
**Note** : After writing ./a.out (if done manually), you will have to suspend it to get to the next step. Control + Z(^ + z) can be used for suspension.
# Simulations
For simulaion, I have used GTKWave tool. After suspending the output file, you will have to manually open the **.vcd** file. After that add the traces or signal for generating the output as shown.

<img width="888" alt="Output1" src="https://user-images.githubusercontent.com/81183082/189595809-48901e56-b44a-4eb6-a701-7fc114fc8113.png">

## Synthesis of Verilog Code

**Synthesis** means transforming RTL design to gate level netlist with the constraints specified as per the designer.
Synthesis is process as follows:
- Converting the RTL to simple logic gates.
- Mapping those gates to actual technology available gates.
- Optimizing the design while retaining the constraints.

**Synthesizer** is a tool that is used to synthesize the design. In my case, I have used yosys tool for synthesys.

### About Yosys
Yosys is a framework for Verilog RTL synthesis. It currently has extensive Verilog-2005 support and provides a basic set of synthesis algorithms for various application domains.

For yosys intallation (development purpose), please follow this [GitHub](https://github.com/YosysHQ/yosys) repository.
For yosys intallion through terminal, copy the command 
```
brew install yosys
```
After installing yosys we need to write a yosys_run.sh, which is a yosys script file to synthesize the design
**NOTE** : Identify the .lib file in the lib folder of this cloned repo. After that replace the underlined path with your local machine's path.
<img width="737" alt="Screenshot 2022-08-18 at 12 32 12 PM" src="https://user-images.githubusercontent.com/81183082/185329227-bf685877-064c-47a0-b341-b62452f7d91b.png">

Now, on the terminal inside the cloned repo folder, run the commands.

```
yosys
```
And it will open an interactive yosys terminal.

```
yosys>  script yosys_run.sh
```
It will generate the synthesys for our design. It will take 6 different steps to complete the synthesis.
```
yosys>  stat
```
<img width="339" alt="stat" src="https://user-images.githubusercontent.com/81183082/189597241-f7d56f7f-2edd-4809-922c-e428473b9453.png">
To view the statistics, we will use above command and it will generate this report.
```
yosys>  show
```
<img width="651" alt="show" src="https://user-images.githubusercontent.com/81183082/189597265-69afd714-996c-4746-bc2b-705321e9633c.png">
Terminal report

<img width="1288" alt="netlist" src="https://user-images.githubusercontent.com/81183082/189597963-fb3ae6e3-6cce-4b65-adfc-06f7fe78f1fd.png">
To generate the schematics. Now the synthesized netlist will be written in synth_iiitb_sdMoore.v file and it will show the netlist as shown above.

## Gate Level Simulation( (GLS)
GLS is generating the simulation output by running test bench with netlist file generated from synthesis as design under test. Netlist is logically same as RTL code, therefore, same test bench can be used for it.We perform this to verify logical correctness of the design after synthesizing it. Also ensuring the timing of the design is met. Folllowing are the commands to run the GLS simulation:

```
iverilog -DFUNTIONAL -DUNIT_DELAY=#1 verilog_model/primitives.v verilog_model/sky130_fd_sc_hd.v synth_iiitb_sdMoore.v iiitb_sdMoore_tb.v
./a.out
gtkwave test2.vcd
```
Note: If you are on a mac, you will have to manually open the .vcd file as it wont open from the terminal throught the code shown above.

The gtkwave output for the netlist should match the output waveform of the RTL design, since the inputs and outputs are same for synthesized netlist file and RTL file, we can use the same testbench for both.

### Pre synthesys output(O1)
<img width="997" alt="Presynth" src="https://user-images.githubusercontent.com/81183082/189598267-7ada5e27-031e-47b0-9868-5bbf63ee8f6c.png">

### Post synthesys output(O2)
<img width="1040" alt="Postsynth" src="https://user-images.githubusercontent.com/81183082/189598368-4b4bfeb6-b041-46c4-a8ae-51816a156b89.png">

Observing the above two images, we see that both the outputs post synthesis and pre synthesis are same. From here on, we will start the layout process.

## Docker Installation
```
brew install --cask docker
```
Above brew command will download the docker for mac.Once downloaded, open the spotlight ( cmd + space), type in docker and open the app. It requires some permission while opening the app which should be allowed, and then a whale icon will appear in the the menu bar which indicates that docker is ruunig. Now you can close the application but the docker will still run in the background.


# Contributors
- Paras Vekariya
- Kunal Ghosh

# Acknowledgements

Kunal Ghosh, Director, VCD Corp. Pvt. Ltd.

# Contact Informations
- [Paras Vekariya](mailto:Paras.Vekariya@iiitb.ac.in)
- [Kunal Ghosh](mailto:kunalghosh@gmail.com)

# References
- [Wikipaedia]( https://en.wikipedia.org/wiki/Moore_machine)
- [Moore Design](http://kaneriadhaval.blogspot.com/2013/11/fsm-code-in-verilog-for-1010-sequence.html)
- [Aplications](https://electronics-club.com/finite-state-machine-fsm-classification-application/#Applications_of_FSM)
