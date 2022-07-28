read_verilog iiitb_vm.v

# generic synthesis
synth -top iiitb_vm

# mapping to mycells.lib
dfflibmap -liberty /home/siddhant/asic/sky130RTLDesignAndSynthesisWorkshop-main/my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

abc -liberty /home/siddhant/asic/sky130RTLDesignAndSynthesisWorkshop-main/my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

clean
flatten
# write synthesized design
write_verilog iiitb_vm_synth.v
