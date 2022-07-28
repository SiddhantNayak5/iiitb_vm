# iiitb_vm - Vending Machine with Change System 
### INTRODUCTION
In this project, a vending machine with change system using
Verilog HDL is proposed based on finite state machine. A vending
machine is an automated machine that provides items such as snacks,
beverages and lottery tickets to consumers after payment into the machine
is made.

### STATE TRANSITION DIAGRAM
![image](https://user-images.githubusercontent.com/110079689/181303096-08f7500d-2916-4bd7-a4de-3958465a53e1.png)
The above figure is the state transition diagram of a vending machine with change system. In this project,the vending machine provides only one item(for example- a water bottle) whose cost is Rs15.

### STATE DIAGRAM DETAILS 
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

#### State 0: 0Rs in Vending Machine –
If nothing added: Stay on State 0, OUTPUT = 0, CHANGE = 0.
If 5Rs added: Move to State 1, OUTPUT = 0, CHANGE = 0.
If 10Rs added: Move to State 2, OUTPUT = 0, CHANGE = 0.

#### State 1: 5Rs in Vending Machine –
If nothing added: Here, this means the vending machine waited
sometime but no money was added signifying an incomplete
transaction, thus the vending machine should return back the
money added as CHANGE (5Rs). No bottle given.

Move to State 0, OUTPUT = 0, CHANGE = Rs5 (01).
If 5Rs added: Move to State 1, OUTPUT = 0, CHANGE = 0.
If 10Rs added: Adding 10Rs means the vending machine now has
15Rs total thus, a bottle will be returned with no CHANGE.
Move to State 0, OUTPUT = 1, CHANGE = Rs0.

#### State 2: 10Rs in Vending Machine –
If nothing added: Again, incomplete transaction thus vending
machine returns the money added as CHANGE (10Rs). No bottle
given.

Move to State 0, OUTPUT = 0, CHANGE = Rs10 (10).
If 5Rs added: Signifies a complete transaction, a bottle is returned
The product costs 15Rs. Move to State 0, OUTPUT = 1, CHANGE
= Rs5 (01).

### OUTPUT WAVEFORM

![image](https://user-images.githubusercontent.com/110079689/181305635-fb71da5b-36a0-4787-9c12-2a85ac31bb27.png)
In the above figure,the output waveform in gtkwave is being shown.

### TOOLS USED
#### IVERILOG

Icarus Verilog is a Verilog simulation and synthesis tool.
To install iverilog, type the following command in the terminal:

``` $ sudo apt install iverilog```

#### GTKWAVE

GTKWave is a VCD waveform viewer based on the GTK library. This viewer supports VCD and LXT formatsfor signal dumps.
To install GTKWave, type the following command in the terminal:

``` $ sudo apt install gtkwave```

**To clone the repository and download the netlist files for simulation,enter the following commands in your terminal**
``` 
 $ git clone https://github.com/SiddhantNayak5/iiitb_vm
 $ cd iiitb_vm
 $ cd iiitb_vm.v
 $ ./a.out
 $ gtkwave iiitb_vm.vcd 
 ```
 ### AUTHOR 
 - Siddhant Nayak
 ### CONTRIBUTORS
 
 - Kunal Ghosh
 - Arsh Kedia 
 - Rohit Raj
 - Lokesh Maji
 
 ### ACKNOWLEDGEMENTS
 - Kunal Ghosh
 
 ### CONTACT INFOMRATION
 - Siddhant Nayak, M.Tech VLSI, 2022-2024, International Institute of Information Technology, Bangalore siddhantn72@gmail.com
 - Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com
 - Arsh Kedia, M.Tech VLSI, 2022-2024, International Institute of Information Technology, arshkedia99@gmail.com
 - Rohit Raj, M.Tech VLSI, 2022-2024, International Institute of Information Technology, rohitraj116@gmail.com
 - Lokesh Maji, M.Tech VLSI, 2022-2024, International Institute of Information Technology, majilokesh10@gmail.com
