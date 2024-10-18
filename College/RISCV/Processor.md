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

# Hazards (contd.)
## Structural
## Control
- They arise when there is a need to make decisions based on the results of an instruction while the other instructions are executed.
- Ex. Conditional branch instructions
## Flushing

# Branch prediction
```asm
.data
a: .byte 0x78
.text
la x10, a
lbu x6, 0(x10)
addi x5, x6, 0x5a
addi x7, x5, 0x5a
```

| Processor    | No. Of Instructions | CPI | IPC | Ideal Case | Comments |
| ------------ | ------------------- | --- | --- | ---------- | -------- |
| Single cycle |                     |     |     |            |          |
| 5 Stage w/o  |                     |     |     |            |          |
| 5 Stage w/o  |                     |     |     |            |          |
| 5 Stage w/o  |                     |     |     |            |          |
| 5 Stage w/o  |                     |     |     |            |          |
| 6 Stage w/o  |                     |     |     |            |          |

> [!Note]
> The hazard detector in the ripes simulator is taking care of resolving all type of data dependencies, by including `nop`

>[!Note] 
>## 1 Markers
>1. In  a pipelined architecture, if we use von-nuemann bus arch (common memory for both code and memory). What is the type of hazard it leads to:-
>	- Data hazards
>	- Control hazards
>	- ***Structural hazards*** 
>	- None hazards
>	Ans - structural
>2. In the riscv 5 stage pipelined architecture. In which stage outcome of branch instruction will be known?
>	- ans. Mem-access stage
>	1. In this arch., what type of hazard it leads to and how many clocks would get wasted in order to resolve the hazard?
>		- Data hazard, 3 clks
>		- Structural, 3 clks
>		- Control, 1 clks
>		- ***Control, 3 clks***
>
>3. Which technique is used in-order to address the control hazards of a 5 stage pipelined architecture?
>	- Branch predictor
>	- Flushing the instruction in the pipeline after branch pipeline
>	- Flushing the instructions in pipeline before branch pipeline
>	- ***Both 1 and 2***
>
>4. If the comparator and adder which were present in the ex stage are moved to decoder stage, so that the outcome of the branch is known in the decode stage. What will be the number of clocks will be wasted in flushing the instructions if the outcome of the branch is true?
>	1. 3 clks
>	2. 2 clks
>	3. ***1 clks***
>	4. 0 clks
>
>5. Consider the program that is executed in the 5 stage pipelined architecture
>	```asm
>	36: sub x10, x4, x8
>	40: beq x1, x3, 16
>	44: and 
>	```
>	1. In the program given if `beq` is in memory access stage, then which are the instructions which are there in ex, id and if stage.
>	2. If the outcome of branch is true, what will be the value updated in program counter?
>	3. If the outcome of branch is true, which addressing mode do you use in order to calculate PCnew?
>	4. If the outcome of branch is true, which are the instructions to be flushed and how many clks getting wasted

# Exceptions
Exceptions and interrupts are unexpected events generated internally (within CPU) or externally (External I/O controllers) requesting for a service

>[!Note]
>- Interrupt - a signal generated external to the code to trap the processor and request for a service (Asynchronous signals)
>- Exception - a signal (an unexpected event) generated internally within a CPU to trap the processor and request for the service (Synchronous signals)

## Exception
- Illegal instruction
- Instruction address misalignment
- Load store
## Interrupts

# Privilege modes
- Machine (M) - simple embedded systems
	- It allows access to all control and status level register
	- Any program running in M mode has virtually no restrictions
- Supervisor (S) - secure embedded
	- It allows the program to modify any supervisor level control and status registers
	- Designed for running a kernel
- User/ Application (U)  - Systems running UNIX like OSes
	- A program running here cannot modify any of the hardware or control or status registers
	- It must use system call instructions so that higher privilege modes can take actions

>[!Note]
>Switch between privilege levels with following commands
>`ecall` - environmental call
>`eval` - 

- Super Exception Program Counter - In case of interrupt or exception, we store the address of the instruction which is there in `EX` stage to `SEPC` to return back after handling the exception/ interrupt
- `SCAUSE` - Stores the cause of exception/ interrupt (Supervise Level)
- `MCAUSE` - Stores the cause of exception/ interrupt (Machine Level)

>[!Note]
>- The MSB of the interrupt signal indicate `SCAUSE` / `MCAUSE`
>- 1 -> interrupt
>- 0 -> Exception
>### Questions
>1. Assume there is an illegal instruction getting executed. What will be the value to `SCAUSE`. Refer table for exception code or interrupt.
>	- ***exception, code - 2***
>
>2. If the SCAUSE MSB is 1 what does it mean (What is the cause for trapping)?
>	- exception
>	- ***interrupt***
>	- both
>	- None of these

## Direct and Vectored mode of trap handling
- In case of direct mode, all synchronous exception and asynchronous interrupts, traps to the base address defined in empty vector register
- Once control of execution changes to the trap handler, the software must be `scause` or `mcause` register to determine what triggered the trap
- The `scause` / `mcause` are the register used depending on the privilege mode, to identify the reason for the exception
## Steps involved in exception/interrupts
1. The processor completes the execution of the instructions which are in memory access stage and write back stage
2. It flushes the instructions with the help of control unit and the control status registers, which are present in `ex`, `id` and `if` stages
3. The `SEPC` and `SCAUSE` registers gets updates upon unexpected events.
4. The `SEPC` is loaded with the address of the instruction and `SCAUSE` is loaded with code indicating the cause on the trapping
5. The control of trapping moves from main program to the trap handler using either the 
	- Direct approach 
	- Vectored approach
6. Upon execution of the trap handle, the control of execution will come back to the main program 
	- If is restartable otherwise it terminates the program
	- If it is restartable `PC` == `SEPC`

>[!Note]
>MIE (machine Interrupt Enable) - This register can be used to enable or disable. 
>- This can be set by settingthe register value as 1 or 0
>- If MIE is set as 1 -> machine mode timer is available
>- This mie register is gloablly enabled or disabled by using mie bit in the S
>- if there is more than 1 interrupt /exception is enabled. more than 1 trappings can occur, In this case, the processor will check the priority of interrupt / exception to service 1st. The reset if the i/e will be  pending traps to be serviced later. 
>- Pending e/i will be updated in the MIPS (Machine Interrupt Pending).
>
>Qs. Assume instruction to invoked on the exception begin like this
>Show what happened in the pipeline of the hardware malfunction exception occurs when add instruction is in the EX stage of pipeline.
>- Content of `SEPC` and `SCAUSE`
>	- `4C`
>	- refer table
>- Where the control of execution transfer (value in PC)
>	- 
>- Which are the instructions in the pipelined which are getting flushed and which will be executed

# Timer vs Counter
## Counter
An n-bit counter that increments on each posedge of clocks
## Timer
A device that contains a counter, a register and a comparator. It gives the value when the value of the register matches the counter value. The comparison occurs in comparator and target value is stored in the register.
## Used in interrupts
### `mtime`
It starts running from the time processor is started up. It provides the current real time ticks
### `mtimecmp`
Register used to store value after which the timer interrupt should be generated. The value of `mtimecmp` register is compared with `mtime` register,. When `mtime` value becomes >= `mtimecmp`, the timer interrupt is generated
# Parallelism via Instructions
1. Static  2 Issue Processor
	- In a dual issue processor, the result of the `lw` instruction. It means, the next 2 instruction followed by load cannot use the result produced by load without introducing `nop`
	- Compile stages
		1. Reorder the instructions to reduce ``nop`

>[!Note]
>qs. How would the loop be scheduled on a static 2 issue pipeline processor?
>```asm
>Loop: 
>	lw x31, 0(x20)
>	add x31, x31, x21
>	sw x31, 0(x20)
>	addi x20, x20, -4
>	blt x22, x20, Loop
>```
>Assume branches are predicted, so that control hazards are handled by hardware


|     |                                           | ALU+Branch Issues | L/S Issues |
| --- | ----------------------------------------- | ----------------- | ---------- |
| C1  | `lw x31, 0(x20)` and `addi x20, x20 -4`   | `addi`            | `lw`       |
| C2  |                                           | `nop`             | `nop`      |
| C3  | `add x31, x31, x21`                       | `add`             | `nop`      |
| C4  | `blt x22, x20, Loop` and `sw x31, 0(x20)` | `blt`             | `sw`       |
