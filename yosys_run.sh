# read design
read_liberty -lib /Users/paras/Desktop/code/asic/gls/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog iiitb_sdMoore.v

# generic synthesis
synth -top iiitb_sdMoore

# mapping to mycells.lib
dfflibmap -liberty /Users/paras/Desktop/code/asic/gls/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty /Users/paras/Desktop/code/asic/gls/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
clean
#flatten
# write synthesized design
write_verilog -noattr synth_iiitb_sdMoore.v
