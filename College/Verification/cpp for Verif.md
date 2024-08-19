# Intro
We can do functional verification with C code on system verilog modules. This page covers an intro into this topic. <br>
(This extra topic is not part of syllabus.)

# Verilator
A (System/) Verilog compiler that compiles your source code to systemC!!. Unlike commercial compilers like questaSim and Model sim which are sadly not available for Linux platform natively. And vivado v++ compiler which is honestly overkill for beginners, Verilator is an Open Source free alternative which is still being developed. <br>
The drawback of verilator include 
- limited support for non-synthesizable verilog code
- under development for UVM (Universal Verification Method)
- relatively new support for System Verilog Testbenches

# Testbenches in C
Yes it exists

# External Sources
- [Verilator docs](https://verilator.org/guide/latest/)
- [GH Intro to verilator basics](https://github.com/n-kremeris/verilator_basics)
- [ZipCPU 101 formal verif](https://zipcpu.com/tutorial/)
