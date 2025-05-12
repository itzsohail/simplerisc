# simplerisc
this is a simple risc verilog code.
top module->it is simple risc processor using all other module
PC-INST conatin the program counter as well as instruction memory.
control -> it decode thre instruction to give all recquired signal .
register-> it have register memory , op1 and op2 are taken out here and register write operation.
fetch-> it will calculate immediate value and branch target.
alu->it will do mathematic operation except mul and div.
branchunit->it will calculate whether branch is taken or not and which.
memory-> memory write and memory read id done here.
test bench->simulate the top module.

