
|                    |                                                                                        |         | EU                                      |
| ------------------ | -------------------------------------------------------------------------------------- | ------- | --------------------------------------- |
| Memory             | `lw rd, imm12(rs1)` <br> `sw rs2, imm12(rs1)`                                          | I <br>S | add <br>add                             |
| Arithmetic         | `add rd, rs1, rs2` <br>`sub rd, rs1, rs2` <br>`and rd, rs1, rs2` <br>`or rd, rs1, rs2` | R       | add <br> add <br> and unit <br> or unit |
| Conditional branch | `beq rs1, rs2, label`                                                                  | B       | add                                     |
|                    |                                                                                        |         |                                         |
# Control unit
- Signals
	- opcode[6:0]
	- ALUsrc
	- MemRead
	- MemWrite
	- MemToReg
	- Branch
	- RegWrite
	- ALUop [1:0]
		- 00 - R-type 
		- 01 - 
		- 10
		- 11
		- ALUoperation (from ALU control unit)
			- 0000 - and
			- 0001 - or
			- 0010 - add
			- 0110 - subtract

# stages
1) Instruction fetch
2) Instruction decoding
3) Execution
4) Memory Access
5) Write Back

> [!Question]
>Calculate the time taken to execute the R-type and Branch on input by considering following timestamps
>- T1 (IF) = 200n 
>- T2 (ID) = 100n
>- T3 (Exec) = 200n
>- T4 (Memory Access) = 200n
>- T5 (Write Back)= 100n

> [!note]
> - Register read is the time needed after rising clock edge for the new register value to appear on the output. This value applies to the PC only.
> - Register setup is the amount of time a register's data input must be stable before the rising edge of the clock. This value applies to both PC and Register File

> [!Question]
> Assume that logic blocks used o implement a processor's single cycle datapath have following latencies
> 
> 1) what is the latency of R-type instruction (how long the clock period be to ensure instruction works correctly)