# 16-bit-Arithmetic-Unit-
A 16-bit Arithmetic Logic Unit (ALU) implemented in Verilog. Supports ADD, SUB, MUL, AND, OR, NAND, NOR, XOR operations with carry and zero flags. Synchronous design updates outputs on clock edges and includes reset for reliable FPGA/HDL simulation.

# 16-Bit ALU in Verilog

## Description
A 16-bit Arithmetic Logic Unit (ALU) in Verilog. Supports ADD, SUB, MUL, AND, OR, NAND, NOR, XOR operations with carry and zero flags. Synchronous design updates outputs on clock edges and supports reset.

## Ports
- `clk` : Clock input  
- `reset` : Synchronous reset  
- `operation` : 3-bit ALU operation selector  
- `operand_A`, `operand_B` : 16-bit inputs  
- `result` : 32-bit output  
- `carry_flag`, `zero_flag` : Status flags  

## Usage
1. Open in Xilinx ISE/Vivado/ModelSim.  
2. Add `alu16bit.v` and `alu16bit_tb.v`.  
3. Simulate to verify operations.

## Author
Sounder47
