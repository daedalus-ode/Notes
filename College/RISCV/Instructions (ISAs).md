# Definitions
- ISA (Instruction Set Architecture)
	- Dependent on hardware. Varies with system
- RISC (Reduced Instruction Set Computer) ex - ARM
- CISC (Complex Instruction Set Computer) ex - Intel, AMD
- Addressing mode
	- Indirect addressing - when pointer is used to access the memory
	- Direct addressing - Direct values are given
- ALU - The arithmetic block used to perform operations. They are fed direct values after resolving the pointers
- ==Throughput== - inversely proportional to the clock delay for an instruction. This value decrease as the complexity of each increases
- Data types
	- double word - 64 bits (8 bytes)
	- word - 32 bits (4 bytes)
	- half word - 16 bits (2 bytes)
	- byte - 8 bits
- Instructions
	- `lw` - load word, is used to read memory from the data memory. It functions by adding an offset value to the address that is given as a parameter
	- ex. `lw rd, imm(rs1)`
		- Here, we offset the address in rs1 by `imm` value and access the memory from that address.
		- So `lw rd, 2(rs1)` adds a memory offset of 2 to the address stored in rs1 and stores the value from the that location in the memory into the `rd` register.  

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
# Addressing Modes
- Immediate
	- These are hard coded constants in the code itself. They are not stored in a specific register. Instead they are directly send to the execution unit (ex. ALU).
	- ex. `add x5, x6, 0x10`
- Direct
	- These are variables in an assembly code. These values are stored in specific registers before processing/execution
	- ex. `add x5, x6, x7`
- Indirect
	- These use pointer like method for accessing data in the memory. The address is used to point to the memory location of the actual data. This location need to be stored in a register to be called indirect addressing. 
	- ex. `add x5, x6, [x7]`
- Complex
	- Both indirect and direct can be used together to represent the physical address of the memory
	- ex. `add x5, x6, [x7 + 0x10]`

> [!Note] 
>*Physical Address*
>- PA (Physical address) = BA (Base address) + offset
>- ex. This is used in the program counter to set the next address which contains the next instruction. The offset is determined by the size of each instruction.

>[!Note] 
>*More clarification on direct vs indirect*
>- `[x2]` is direct addressing as it need to extract the physical memory location from a register and decipher the physical address before the data can be accessed.
>- `[1000H]` is not indirect addressing as it doesn't require an extra step to retrieve the physical memory address. This would come under direct addressing

# Instruction Format
- Fields
	- Opcode: Determines the operation to be perform based on the instructions given in the code
	- Operand: The data (or the pointer to the data) on which the operation is being performed on
- Size
	- CISC - The binary encoded instruction size is variable based on the instructions and addressing types. This is cause each instruction is complex and it would be inefficient to use same instruction size.
	- RISC - The binary encoded instruction size is kept constant irrespective of the instructions. This is possible because the instructions on RISCV is simple (perform simple operations) and it supports limited number of addressing modes. (ex. RV32 uses 32 bits for each instruction) 
# Basic Architecture
## Memory
- Code memory
	- Holds all the instructions from the code in binary format
- Data memory
	- This memory holds all the data used for the execution of the instructions
## Program Counter
- Register that is used to determine the execution flow of the processor. This register holds the address of the code memory location in which the next instruction to be executed is stored.
- It functions on the basis of offsets. So in a linear execution flow (i.e. without if statements and loops) after every execution of an instruction the register is updated to the next address by adding an offset (equal to the instruction bit size) to the current address. (This is in RISC architecture cos of the constant instruction size)
- On reset PC always holds address of the 1st instruction of program.

## Datapath
- Collection of state elements, computation elements, and interconnections that together provide a part for flow and transformation of data in processor during execution.

## Types of Instructions
- R-Type (Register)
	- In this type of instructions, only data from the registers are used for execution of instructions. 
- I-Type (Immediate)
	- In this type of instructions, data from the registers and immediate value from the code are send to the ALU for computation. 
> [!NOTE]
> In an ALU the operand 1 is always from the register and operand 2 can be from a register or immediate values depending on I or R types instruction.


![RISCV_Basic_Architecture.png](<../Assets/RISCV_Basic_Architecture.png>)