# Structure

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

# Stages
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


# Pipelining #todo 
- Added hardware
	- 4 Pipelining Registers between all stages
	- More control signals
# Hazards
When pipelining the instructions due to data dependencies, corruption of results occur. To solve this following methods are implemented
## Stalling 
- Pausing the execution of cycles by stalling
	- Done by using manually inserting `nop` (no operation) instructions
	- Increases clock latency

> [!Example]
> Assume the following sequence of instructions are executed in pipeilined arch. 
> 
> 
```asm
add x15, x12,x11
lw x13, 8(x15)
lw x12, 0(x12)
or x13, x15,x13
sw x13, 0(x15)
```
Latency:- 9 clk cycles
```asm
add x15, x12,x11
nop
nop
lw x13, 8(x15)
lw x12, 0(x12)
nop
or x13, x15,x13
nop
nop
sw x13, 0(x15)
```
Latency:- 14 clk cycles

## Forwarding 
-  Solving data inter dependency issues
	- By bypassing (tapping) the results from certain stages before the register is ready (after the write back stage) and forwarding to next stage
	- Requires additional hardware, using direct wires instead of registers 
### Forwarding unit
- Ex-hazard
- Mem-hazard
	- Potential/ double hazard

> [!question]
> 1. Assuming stalling 2
```asm
ld x2, x1, x3
and x12, x2, x5
```
## Reordering