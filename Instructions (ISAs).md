# Definitions
- ISA (Instruction Set Architecture)
	- Dependent on hardware. Varies with system
- RISC (Reduced Instruction Set Computer) ex - ARM
- CISC (Complex Instruction Set Computer) ex - Intel, AMD
- Addressing mode
	- Indirect addressing - when pointer is used to access the memory
	- Direct addressing - Direct values are given
- ALU - The arithmetic block used to perform operations. They are fed direct values after resolving the pointers
- ==Throughput== - inversely proportional to the clock delay for an instruction

# CISC vs RISC

| Features                                     | CISC                                                                                                          | RISC                                                                                                            |
| -------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| Memory & ops                                 | Direct memory access- The result from an operation is send back to the memory block for storing using pointer | Load - store - The results are stored in registers                                                              |
| Instruction Length                           | Lesser Instruction Length                                                                                     | More instruction length                                                                                         |
| Complexity of instructions                   | More complex instructions. (Capable of resolving pointers automatically. Hence lesser code length)            | More simpler instructions. Uses register for it's operation. (ex. Hence requires more code to resolve pointers) |
| Addressing mode                              | More types                                                                                                    | Lesser types                                                                                                    |
| No. CLK cycles for execution of instructions | Variable throughput (Based on the complexity of instructions)                                                 | Fixed throughput (Registers make the throughput uniform)                                                        |
| Encoding                                     | Variable instruction encoding size because of different addressing modes                                      | All instructions are encoding using 32 bits                                                                     |
| Pipelining                                   |                                                                                                               |                                                                                                                 |
