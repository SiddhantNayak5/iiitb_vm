read_verilog iiitb_vm.v

# generic synthesis
synth -top iiitb_vm

# mapping to mycells.lib
dfflibmap -liberty /home/siddhant/asic/iiitb_vm/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
proc
opt
abc -liberty /home/siddhant/asic/iiitb_vm/lib/sky130_fd_sc_hd__tt_025C_1v80.lib -script +strash;scorr;ifraig;retime,{D};strash;dch,-f;map,-M,1,{D}

proc
flatten
clean
# write synthesized design
write_verilog iiitb_vm_synth.v
stat
show
