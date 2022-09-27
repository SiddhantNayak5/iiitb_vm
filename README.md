# iiitb_vm - Vending Machine with Change System 
## INTRODUCTION
In this project, a vending machine with change system using
Verilog HDL is proposed based on finite state machine. A vending
machine is an automated machine that provides items such as snacks,
beverages and lottery tickets to consumers after payment into the machine
is made.

## STATE TRANSITION DIAGRAM
![image](https://user-images.githubusercontent.com/110079689/181303096-08f7500d-2916-4bd7-a4de-3958465a53e1.png)

The above figure is the state transition diagram of a vending machine with change system. In this project,the vending machine provides only one item(for example- a water bottle) whose cost is Rs15.

## STATE DIAGRAM DETAILS 
Any sequential digital circuit can be converted into a state machine
using state diagram. In a State machine the circuit’s output is
defined in a different set of states i.e. each output is a state. There
is a State Register to hold the state of the machine and a next state
logic to decode the next state. There is also an output register that
defines the output of the machine. The next state logic is the
sequential part of the machine and the Output and current state are
the Register part of the logic. There are two types of state machines
i.e. Moore machine and Mealy machine.

In this project, we will use Mealy machine. In a Mealy machine the
output depends on the input as well as the present state. Here we
have taken the product cost as Rs15.

### State 0: 0Rs in Vending Machine –
If nothing added: Stay on State 0, OUTPUT = 0, CHANGE = 0.
If 5Rs added: Move to State 1, OUTPUT = 0, CHANGE = 0.
If 10Rs added: Move to State 2, OUTPUT = 0, CHANGE = 0.

### State 1: 5Rs in Vending Machine –
If nothing added: Here, this means the vending machine waited
sometime but no money was added signifying an incomplete
transaction, thus the vending machine should return back the
money added as CHANGE (5Rs). No bottle given.

Move to State 0, OUTPUT = 0, CHANGE = Rs5 (01).
If 5Rs added: Move to State 1, OUTPUT = 0, CHANGE = 0.
If 10Rs added: Adding 10Rs means the vending machine now has
15Rs total thus, a bottle will be returned with no CHANGE.
Move to State 0, OUTPUT = 1, CHANGE = Rs0.

### State 2: 10Rs in Vending Machine –
If nothing added: Again, incomplete transaction thus vending
machine returns the money added as CHANGE (10Rs). No bottle
given.

Move to State 0, OUTPUT = 0, CHANGE = Rs10 (10).
If 5Rs added: Signifies a complete transaction, a bottle is returned
The product costs 15Rs. Move to State 0, OUTPUT = 1, CHANGE
= Rs5 (01).

## OUTPUT WAVEFORM

![Screenshot from 2022-08-16 21-59-41](https://user-images.githubusercontent.com/110079689/184931399-b520750c-0de7-41c6-b064-0ceb91fa4aba.png)



In the above figure,the output waveform in gtkwave is being shown.

## TOOLS USED
### IVERILOG

Icarus Verilog is a Verilog simulation and synthesis tool.
To install iverilog, type the following command in the terminal:

``` $ sudo apt install iverilog```

### GTKWAVE

GTKWave is a VCD waveform viewer based on the GTK library. This viewer supports VCD and LXT formatsfor signal dumps.
To install GTKWave, type the following command in the terminal:

``` $ sudo apt install gtkwave```

**To clone the repository and download the netlist files for simulation,enter the following commands in your terminal**
``` 
 $ git clone https://github.com/SiddhantNayak5/iiitb_vm
 $ cd iiitb_vm
 $ iverilog iiitb_vm.v iiitb_vm_tb.v
 $ ./a.out
 $ gtkwave iiitb_vm.vcd 
 ```
## yosys – Yosys Open SYnthesis Suite
Yosys is a framework for Verilog RTL synthesis. It currently has extensive Verilog-2005 support and provides a basic set of synthesis algorithms for various application domains.

Synthesis transforms the simple RTL design into a gate-level netlist with all the constraints as specified by the designer. In simple language, Synthesis is a process that converts the abstract form of design to a properly implemented chip in terms of logic gates.

Synthesis takes place in multiple steps:
  * Converting RTL into simple logic gates.
  * Mapping those gates to actual technology-dependent logic gates available in the technology libraries.
  * Optimizing the mapped netlist keeping the constraints set by the designer intact.

Yosys can be adapted to perform any synthesis job by combining the existing passes (algorithms) using synthesis scripts and adding additional passes as needed by extending the yosys C++ code base.

Yosys is free software licensed under the ISC license (a GPL compatible license that is similar in terms to the MIT license or the 2-clause BSD license).

You need a C++ compiler with C++11 support (up-to-date CLANG or GCC is recommended) and some standard tools such as GNU Flex, GNU Bison, and GNU Make. TCL, readline and libffi are optional (see `ENABLE_*` settings in Makefile). Xdot (graphviz) is used by the ``show`` command in yosys to display schematics.

For example on Ubuntu the following commands will install all prerequisites for building yosys:
```
$ sudo apt-get install build-essential clang bison flex \ libreadline-dev gawk tcl-dev libffi-dev git \ graphviz xdot pkg-config python3 libboost-system-dev \ libboost-python-dev libboost-filesystem-dev zlib1g-dev
```
To configure the build system to use a specific compiler, use one of the following command:
```
$ make config-clang
$ make config-gcc
```
For other compilers and build configurations it might be necessary to make some changes to the config section of the Makefile.
```
$ vi Makefile            # ..or..
$ vi Makefile.conf
```
To build Yosys simply type 'make' in this directory.
```
$ make
$ sudo make install
```
Note that this also downloads, builds and installs ABC (using yosys-abc as executable name).

Tests are located in the tests subdirectory and can be executed using the test target. Note that you need gawk as well as a recent version of iverilog (i.e. build from git). Then, execute tests via:
```
$ make test
```
## GLS - Gate Level Simulation
GLS is generating the simulation output by running test bench with netlist file generated from synthesis as design under test. Netlist is logically same as RTL code, therefore, same test bench can be used for it.

**Why GLS?**

The main reasons for running GLS are as follows:

  * To verify the power up and reset operation of the design and also to check that the design does not have any unintentional dependencies on initial conditions.
  * To give confidence in verification of low power structures, absent in RTL and added during synthesis. 
  * It is a probable method to catch multicycle paths if tests exercising them are available.
  * Power estimation is done on netlist for the power numbers. 
  * To verify DFT structures absent in RTL and added during or after synthesis. Scan chains are generally inserted after the gate level netlist has been created. Hence, gate level simulations are often used to determine whether scan chains are correct. GLS is also required to simulate ATPG patterns. 
  * Tester patterns (patterns to screen parts for functional or structural defects on tester) simulations are done on gate level netlist.
  * To help reveal glitches on edge sensitive signals due to combination logic. Using both worst and best-case timing may be necessary.
  * It is a probable method to check the critical timing paths of asynchronous designs that are skipped by STA.
  * To avoid simulation artifacts that can mask bugs at RTL level (because of no delays at RTL level).
  * Could give insight to constructs that can cause simulation-synthesis mismatch and can cause issues at the netlist level.
  * To check special logic circuits and design topology that may include feedback and/or initial state considerations, or circuit tricks. If a designer is concerned about some logic then this is good candidate for gate simulation. Typically, it is a good idea to check reset circuits in gate simulation. Also, to check if we have any uninitialized logic in the design which is not intended and can cause issues on silicon.
  * To check if design works at the desired frequency with actual delays in place.
  * It is a probable method to find out the need for synchronizers if absent in design. It will cause “x” propagation on timing violation on that flop.

Below picture gives an insight of the procedure. Here while using iverilog, you also include gate level verilog models to generate GLS simulation.

![image](https://user-images.githubusercontent.com/72696170/183296780-4bad9547-69e9-4cee-b791-acb5a38951bf.png)


***To clone the repository and download the netlist files for simulation, enter the following command in your terminal***<br/>
```
$ git clone https://github.com/SiddhantNayak5/iiitb_vm
```
***After cloning the git repository, type the following in "iiitb_vm" directory in the terminal for RTL Simulation.***<br/>
```
$ iverilog iiitb_vm.v iiitb_vm_tb.v
$ ./a.out 
$ gtkwave iiitb_vm.vcd
```
***For synthesis, run "yosys_run.sh" file in the same directory in terminal.***<br/>
```
$ yosys -s yosys_run.sh
```
The above commands create the netlist of iverilog code.<br/><br/>
***For Gate level syntheses(GLS), type the following in the same directory in terminal***<br/>
```
$ iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 ../iiitb_vm/verilog_model/primitives.v ../iiitb_vm/verilog_model/sky130_fd_sc_hd.v iiitb_vm_net.v iiitb_vm_tb.v
```
***To generate the simulation, type the following in the same directory in terminal***<br/>
```
$ ./a.out
$ gtkwave iiitb_vm.vcd
```


## NETLIST <br/>
In electronic design, a netlist is a description of the connectivity of an electronic circuit.In its simplest form, a netlist consists of a list of the electronic components in a circuit and a list of the nodes they are connected to. A network (net) is a collection of two or more interconnected components.<br/>

On running the yosys script, we get the following output:

- Stats <br/>

 ![Screenshot from 2022-08-16 21-24-12](https://user-images.githubusercontent.com/110079689/184926571-d4ef5dd3-f328-44ec-b7a9-30267cdfb29d.png)
 
 
## POST SYNTHESIS SIMULATION <br/>

![Screenshot from 2022-08-16 21-30-21](https://user-images.githubusercontent.com/110079689/184927296-9f68e1c8-111e-489c-9f77-b13b083ad75b.png)


## PHYSICAL DESIGN 
### Openlane
OpenLane is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, CVC, SPEF-Extractor, CU-GR, Klayout and a number of custom scripts for design exploration and optimization. The flow performs full ASIC implementation steps from RTL all the way down to GDSII.

more at https://github.com/The-OpenROAD-Project/OpenLane
### Installation instructions 
```
$   apt install -y build-essential python3 python3-venv python3-pip
```
Docker installation process: https://docs.docker.com/engine/install/ubuntu/

goto home directory->
```
$   git clone https://github.com/The-OpenROAD-Project/OpenLane.git
$   cd OpenLane/
$   sudo make
```
To test the open lane
```
$ sudo make test
```
It takes approximate time of 5min to complete. After 43 steps, if it ended with saying **Basic test passed** then open lane installed succesfully.

### Magic
Magic is a venerable VLSI layout tool, written in the 1980's at Berkeley by John Ousterhout, now famous primarily for writing the scripting interpreter language Tcl. Due largely in part to its liberal Berkeley open-source license, magic has remained popular with universities and small companies. The open-source license has allowed VLSI engineers with a bent toward programming to implement clever ideas and help magic stay abreast of fabrication technology. However, it is the well thought-out core algorithms which lend to magic the greatest part of its popularity. Magic is widely cited as being the easiest tool to use for circuit layout, even for people who ultimately rely on commercial tools for their product design flow.
More about magic at http://opencircuitdesign.com/magic/index.html

Run following commands one by one to fulfill the system requirement.

```
$   sudo apt-get install m4
$   sudo apt-get install tcsh
$   sudo apt-get install csh
$   sudo apt-get install libx11-dev
$   sudo apt-get install tcl-dev tk-dev
$   sudo apt-get install libcairo2-dev
$   sudo apt-get install mesa-common-dev libglu1-mesa-dev
$   sudo apt-get install libncurses-dev
```
**To install magic**
goto home directory

```
$   git clone https://github.com/RTimothyEdwards/magic
$   cd magic/
$   ./configure
$   sudo make
$   sudo make install
```
type **magic** terminal to check whether it installed succesfully or not. type **exit** to exit magic.

### Generating Layout

Open terminal in home directory
```
$   cd OpenLane/
$   cd designs/
$   mkdir iiitb_vm
$   cd iiitb_vm/
```
Then copy the config.json file in the current directory and type the following commands:
```
$   mkdir src
$   cd src/
```
Copy the iiitb_vm.v file in the current directory and type the following commands:
```
$   cd ../../../
$   sudo make mount
$   ./flow.tcl -design iitb_vm

```
To see the layout we use a tool called magic which we installed earlier.Type the following command in the terminal opened in the path to your design/runs/latest run folder/results/final/def/
 
```
$ magic -T /home/siddhant/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../../tmp/merged.min.lef def read iiitb_vm.def

```


## COUSTOMIZING THE LAYOUT
### PREPERATION
The layout is generated using OpenLane. To run a custom design on openlane, Navigate to the openlane folder and run the following commands:<br>
```
$ cd designs

$ mkdir iiitb_vm

$ cd iiitb_vm

$ mkdir src

$ touch config.json

$ cd src

$ touch iiitb_vm.v
```

The iiitb_vm.v file should contain the verilog RTL code you have used and got the post synthesis simulation for. <br>

Copy  `sky130_fd_sc_hd__fast.lib`, `sky130_fd_sc_hd__slow.lib`, `sky130_fd_sc_hd__typical.lib` and `sky130_vsdinv.lef` files to `src` folder in your design. <br>


### INCLUDING THE SKY130_VSDINV CELL

Modify the json file by including the following lines:

    ```
    "PL_RANDOM_GLB_PLACEMENT": 1,
    "PL_TARGET_DENSITY": 0.5,
    "FP_SIZING": "relative",
    "LIB_SYNTH":"dir::src/sky130_fd_sc_hd__typical.lib",
    "LIB_FASTEST":"dir::src/sky130_fd_sc_hd__fast.lib",
    "LIB_SLOWEST":"dir::src/sky130_fd_sc_hd__slow.lib",
    "LIB_TYPICAL":"dir::src/sky130_fd_sc_hd__typical.lib",
    "TEST_EXTERNAL_GLOB":"dir::../iiitb_vm/src/*",
    "SYNTH_DRIVING_CELL":"sky130_vsdinv"
    ```
    
Now we have to do following steps:

```
 cd OpenLane
 sudo make mount
 ./flow.tcl -interactive
 package require openlane 0.9
 prep -design iiitb_wm
 set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
 add_lefs -src $lefs
```
### SYNTHESIS
In this part we will do sythesis of the project using following code:
```
 run_synthesis
```
This is synthesized output:

![stat](https://user-images.githubusercontent.com/110079689/187496738-73cb42f0-802f-4f91-a664-629e9880967a.png)

### FLOOR PLANNING
In floorplanning we will do following steps:
```
 run_floorplan
```
Then we will go to ``` results/floorplan``` and type following command on terminal
```
$ magic -T /home/siddhant/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def read iiitb_vm.def &
```
 We will get following floorplan:
 
 
 ![floor](https://user-images.githubusercontent.com/110079689/187497731-b2e5f896-cf3a-40cd-ad6a-fda4ec9f9570.png)
### PLACEMENT
In placement we will do following steps:
```
 run_placement
```
Then we will go to ``` results/placement``` and type following command on terminal
```
$ magic -T /home/siddhant/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def read iiitb_vm.def &
```
We will get following layout:
 
 ![Screenshot from 2022-08-30 20-13-06](https://user-images.githubusercontent.com/110079689/187467484-bbce2dfe-d13e-4f82-87b7-0bbc10e0aea6.png)

 ![vsdinv](https://user-images.githubusercontent.com/110079689/187409832-4a01061c-479d-4ae2-b22c-a6a4ec9f44a5.png)
 
### CLOCK TREE SYNTHESIS
In this section we wil do following step:
```
 run_cts
 ```
We will get following reports after clock tree synthesis:


![Screenshot from 2022-09-27 14-36-20](https://user-images.githubusercontent.com/110079689/192485519-060e6244-fa01-4907-8e43-5400f1da396a.png)



![image](https://user-images.githubusercontent.com/110079689/192492148-ebbd143e-f3ff-42c7-89d0-8cfea7a201cd.png)


 ### ROUTING
 In this step we will do routing of our projects using:
 ```
  run_routing
 ```
 
Then we will go to ``` results/routing``` and type following command on terminal
```
$ magic -T /home/siddhant/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def read iiitb_vm.def &
```

We will get following layout after routing:

![routing](https://user-images.githubusercontent.com/110079689/187500273-3484c4a4-6622-4eb0-9afc-1350617ef41d.png)



 ## AUTHOR
 - Siddhant Nayak 
 
 ## CONTRIBUTORS
 
 - Kunal Ghosh
 - Arsh Kedia 
 - Rohit Raj
 - Lokesh Maji
 
 ## ACKNOWLEDGEMENTS
 - Kunal Ghosh,Director,VSD Corp. Pvt. Ltd.
 - Nickson Jose, VLSI Engineer, VSD Corp. Pvt. Ltd.
 - Madhav Rao, Professor, IIIT-Bangalore.
 - Nanditha Rao, Professor, IIIT-Bangalore
 
 ## CONTACT INFOMRATION
 - Siddhant Nayak, M.Tech VLSI, 2022-2024, International Institute of Information Technology, Bangalore siddhantn72@gmail.com
 - Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com
 - Arsh Kedia, M.Tech VLSI, 2022-2024, International Institute of Information Technology, arshkedia99@gmail.com
 - Rohit Raj, M.Tech VLSI, 2022-2024, International Institute of Information Technology, rohitraj116@gmail.com
 - Lokesh Maji, M.Tech VLSI, 2022-2024, International Institute of Information Technology, majilokesh10@gmail.com
