#!/bin/csh -f
# Ameer  Abdelhadi
# ameer@ece.ubc.ca
# June, 2011

# simulate enumerate_tb with ncverilog

ncverilog /CMC/kits/tsmc_65nm_libs/tcbn65lp/TSMCHOME/digital/Front_End/verilog/tcbn65lp_200a/tcbn65lp.v net/enumerate_gates.vh enumerate_tb.v 
