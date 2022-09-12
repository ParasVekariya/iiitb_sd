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

## Gate Level Simulation(GLS)
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

<img width="566" alt="docker-check" src="https://user-images.githubusercontent.com/81183082/189618245-4936c03c-318f-4630-be0e-d2bf43d2fb0f.png">
To check the status of docker, running the above command will confirm the installation of docker is suscessfull.


## OpenLane Installation
OpenLane is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, CVC, SPEF-Extractor, CU-GR, Klayout and a number of custom scripts for design exploration and optimization. The flow performs full ASIC implementation steps from RTL all the way down to GDSII.
To run this design as per screenshots go to your design folder and perform the cloning process, else go to home directory and perform the commands nothing will change except the paths in the magic commandline.

```
git clone https://github.com/The-OpenROAD-Project/OpenLane.git

cd OpenLane/

make

make test
```
Make test usually takes 5 minutes to complete.

## Magic Installation
Magic tool is used for visualization of the floorplan and placement. Below given are the steps for installation of magic on macOS.

**Note:** Before installing magic, tcl-tk libraries should be installed. And the libraries are to be imported from /usr/local/opt2/. For more information please visit GitHub link of [magic]([url](https://github.com/RTimothyEdwards/magic))

```
brew install tcl-tk

git clone https://github.com/RTimothyEdwards/magic

cd magic/

./configure --with-tcl=/usr/local/opt2/tcl-tk/lib --with-tk=/usr/local/opt2/tcl-tk/lib --x-includes=/opt/X11/include --x-libraries=/opt/X11/lib CFLAGS=-Wno-error=implicit-function-declaration

make

make install
```
It might take some time to complete the installtion process.

## Creating a Custom Inverter cell using magic

A Custom Inverter Cell is required to create an inverter that can be tweaked based on our requirements and locally used in our design files.

Run the following commands in the terminal for generating the inverter cell

```
git clone https://github.com/nickson-jose/vsdstdcelldesign.git

cd vsdstdcelldesign

cp ./libs/sky130A.tech sky130A.tech

magic -T sky130A.tech sky130_inv.mag &
```

Two windows will be displayed, where one will show the magic display and other one is tcl console.

<img width="272" alt="customInverter" src="https://user-images.githubusercontent.com/81183082/189718536-78451125-e7d3-4a7d-a37b-6a5b1de2213a.png">

The above layout can be seen in the magic viewport.The design can be verified here and different layers can be seen and examined by selecting the area of examination and typing ```what``` in the tcl window.

To extract Spice netlist, type the following commands in tcl window.
```
extract all

ext2spice cthresh 0 rthresh 0

ext2spice
```
**cthresh 0 rthresh 0** are for extract parasitic capacitances and resitances from the netlist.
<img width="543" alt="tcl-1" src="https://user-images.githubusercontent.com/81183082/189719465-c9cd2831-1110-4e59-bdba-170b89985d25.png">

After this step we will have to edit the **sky130_inv.spice** file that will be located inside the vsdstdcelldesign folder.

Final contents of sky130_inv.spice and save the file.

<img width="654" alt="Screenshot 2022-09-12 at 11 09 32 PM" src="https://user-images.githubusercontent.com/81183082/189720413-07a84ead-9ee8-4d55-8a06-4f024280d125.png">

For installation og ngspice 
``` 
brew install ngspice 
```

Now opne the terminal in the folder where the sky130_inv.spice is located and type the following code.

```
ngspice sky130_inv.spice 
```
![ngspice](https://user-images.githubusercontent.com/81183082/189721060-96483354-0993-4fdb-bde7-3ed841c45142.png)

Now we can the plot the graph for the inverter using following commands

``` 
plot y vs time a
```
![plot](https://user-images.githubusercontent.com/81183082/189721332-3d0ed708-1a33-418c-97e8-91fe62791780.png)

Four timing parameters are used to characterize the inverter standard cell:

- Rise time: Time taken for the output to rise from 20% of max value to 80% of max value
  ``` 
  Rise time = (2.23843 - 2.17935) = 59.08ps
  ```
- Fall time- Time taken for the output to fall from 80% of max value to 20% of max value
   ``` 
   Fall time = (4.09291 - 4.05004) = 42.87ps
   ```
- Cell rise delay = time(50% output rise) - time(50% input fall)
  ``` 
  Cell rise delay = (2.20636 - 2.15) = 56.36ps
  ```
- Cell fall delay = time(50% output fall) - time(50% input rise) 
  ```
  Cell fall delay = (4.07479 - 4.05) = 24.79ps
  ```

To get a grid and to ensure the ports are placed correctly we can use this command in the tcl console
``` 
grid 0.46um 0.34um 0.23um 0.17um
```
<img width="272" alt="customInverter" src="https://user-images.githubusercontent.com/81183082/189718536-78451125-e7d3-4a7d-a37b-6a5b1de2213a.png">

To save the file with a different name, use the folllowing command in tcl window
```
save sky130_vsdinv.mag
```
Now open the sky130_vsdinv.mag using the magic command in terminal
```
magic -T sky130A.tech sky130_vsdinv.mag
```
In the tcl window type the following command to generate sky130_vsdinv.lef
```lef write```
<img width="442" alt="lefWrite" src="https://user-images.githubusercontent.com/81183082/189722563-c0842a8d-0790-4fe4-8169-caf53a022a34.png">

# Layout

## Preparation
The layout for the design we have been working on can be created using OpenLANE. But before this we have to perform some preparatory steps to run our custom design in OpenLANE. Navigate to the openlane folder and run the following commands:

```
cd designs

mkdir iiitb_sd

cd iiitb_sd

touch config.json

mkdir src

cd src
```
Next copy ```iiitb_seq_det_moore_fsm.v```, ```sky130_fd_sc_hd__fast.lib```, ```sky130_fd_sc_hd__slow.lib```, ```sky130_fd_sc_hd__typical.lib``` and ```sky130_vsdinv.lef``` in the ```src``` folder. The ```iiitb_sdMoore.v``` should be copied from the main repository, and the whole layout procedure will be carried out on this RTL design file.

Next we shall edit the **cofig.json** file
<img width="521" alt="config" src="https://user-images.githubusercontent.com/81183082/189723399-5b58188f-9664-46f1-b860-e4cce3a4141f.png">

In this file the **DESIGN_NAME** corresponds to the name of the module in your design file also note to change the **CLOCK_PORT** and **CLOCK_NET** variables as per clock used in your design file.

Save all the changes made above and navigate to the OpenLane folder in terminal and run the command
**Note**: You will have to start docker explicitly to be able to mount when compiling in macOS.
```
sudo make mount
```
<img width="650" alt="Openlane start" src="https://user-images.githubusercontent.com/81183082/189724193-fb51c9a6-7866-4b08-8da0-2bcfb53113f1.png">

After entering the openlane container give the following command for a step by step procedure:

``` 
./flow.tcl -interactive
```
This will open the tcl console. Type the comamnds every time we access the tcl console

``` 
package require openlane 0.9

prep -design iiitb_sd
```
<img width="632" alt="1 - prepDesign" src="https://user-images.githubusercontent.com/81183082/189724963-8a6d596e-d718-421c-be5e-5d79ed43758b.png">

The following commands are to merge the external lef files to the **merged.nom.lef**. In our case **sky130_vsdiat.lef** is the external .lef file that gets merged to the lef file.

```
set lefs [glob $::env(DESIGN_DIR)/src/*.lef]

add_lefs -src $lefs
```
<img width="522" alt="2-setLefs" src="https://user-images.githubusercontent.com/81183082/189725107-9add33bb-9481-4ff4-86b1-4f43d3b84aad.png">

After the merging step the contents of the merged.nom.lef file should contain the Macro definition of sky130_vsdinv
<img width="351" alt="4-Macro" src="https://user-images.githubusercontent.com/81183082/189725695-80d04fc6-55a6-4e27-8f16-9d97fceb26e2.png">

## Synthesis
``` 
run_synthesis 
```
<img width="648" alt="3-runsynth" src="https://user-images.githubusercontent.com/81183082/189725824-f1fdb896-06f3-4eb0-a314-45e6c0dd664f.png">

### Sythesis Report

<img width="468" alt="5-synthReport" src="https://user-images.githubusercontent.com/81183082/189725921-d9321843-e56a-4000-86b6-e14ee5e4f2fc.png">

Setup and Hold Slack

<img width="550" alt="6-setupSlack" src="https://user-images.githubusercontent.com/81183082/189725965-27c06690-4e94-432e-8ec9-3787ab87aa0b.png">

The sky130_vsdinv should also reflect in your netlist after Synthesis

<img width="179" alt="7-netlistPostSynthesis" src="https://user-images.githubusercontent.com/81183082/189726007-9071b0b4-d30c-4bec-9f49-9c14dc8a44c9.png">


## Floorplan

``` 
run_floorplan
```
<img width="650" alt="8-runFloorplan" src="https://user-images.githubusercontent.com/81183082/189726091-67054e03-108a-4ef7-9bb9-feb3d6fd423d.png">

Floorplan report

**Die Area**

<img width="192" alt="9-dieArea" src="https://user-images.githubusercontent.com/81183082/189726825-caed2252-a29d-4b1f-a2c4-eec14c346345.png">

**Core Area**

<img width="201" alt="10-CoreArea" src="https://user-images.githubusercontent.com/81183082/189726880-f540b596-b1eb-4138-ab88-3cc0f8424cc1.png">

Navigate to results -> floorplan and type the Magic command in terminal to open the floorplan

```
magic -T /Users/paras/Desktop/code/iiitb_sd/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read ../../tmp/merged.nom.lef def read iiitb_sdMoore.def & 
```

### Floorplan View

<img width="448" alt="11-floorview" src="https://user-images.githubusercontent.com/81183082/189734637-ad520646-9c87-4ab9-b879-0c82ac5863d8.png">

Bottom view before placement ,here its currently stacked.

<img width="800" alt="12-floorview bottom" src="https://user-images.githubusercontent.com/81183082/189734679-8ac958c4-e2cb-483d-8e8f-5db2e5c24412.png">

## Placement

``` 
run_placement
```
<img width="646" alt="13-runPlacement" src="https://user-images.githubusercontent.com/81183082/189734921-69857df4-694a-473b-8923-1eaa1e44610e.png">

### Placement Report
Navigate to results->placement and type the Magic command in terminal to open the placement view

```
magic -T /Users/paras/Desktop/code/iiitb_sd/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read ../../tmp/merged.nom.lef def read iiitb_sdMoore.def &
```

![14-placement](https://user-images.githubusercontent.com/81183082/189735114-d246dea1-4271-45de-9c7e-bf5b944640bd.png)

Zooming the layout we can find the sky130 inverter inside th design.

![15-inv](https://user-images.githubusercontent.com/81183082/189735206-fe9dd0f8-e5c4-4f2d-ba7a-7f376f980a8f.png)

The sky130_vsdinv should also reflect in your netlist after placement

<img width="280" alt="netlistPlacement" src="https://user-images.githubusercontent.com/81183082/189735501-253be44a-5913-4be5-af28-6926902fb661.png">

## Clock Tree Synthesis

``` 
run_cts 
```
<img width="650" alt="16-cts" src="https://user-images.githubusercontent.com/81183082/189735655-e76e7d53-78fb-4160-9d1a-451fd57981b6.png">

## Routing

``` 
run_routing
```
<img width="779" alt="17-routing" src="https://user-images.githubusercontent.com/81183082/189737028-147c009d-de6f-4ad5-bd8c-f0c1fe9b7cbc.png">

### Routing Report
Navigate to results->routing and type the Magic command in terminal to open the placement view.

```
magic -T /Users/paras/Desktop/code/iiitb_sd/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read ../../tmp/merged.nom.lef def read iiitb_sdMoore.def &
```

**Routing View**
![18-routing](https://user-images.githubusercontent.com/81183082/189737605-b8155ed3-0d81-4449-81c8-044c2c6b0db9.png)

Wiring in routing.
![19-wire](https://user-images.githubusercontent.com/81183082/189737650-561150f6-d4d1-41ed-85e4-060b1f965dd8.png)

Inverter in routing.

![20-inv](https://user-images.githubusercontent.com/81183082/189737872-8b0d62b4-7998-4abc-9326-e7114012eb7a.png)

**Area Report by magic**:

![21-area](https://user-images.githubusercontent.com/81183082/189737957-037e3da8-13e9-4957-a084-12d9d1e103fa.png)

The sky130_vsdinv should also reflect in your netlist after routing
<img width="276" alt="netlistRouting" src="https://user-images.githubusercontent.com/81183082/189738146-a27ae248-8182-48d4-81fd-68ebf01e6531.png">



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
