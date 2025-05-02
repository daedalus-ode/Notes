# Instruction Scheduling
## Need for scheduling
- A multi functional unit architecture is capable of processing multiple instructions in parrallel by avoiding structural hazards
- The limitation of such an architecture is the order of the instruction being issued which doesn't take advantage of the multiple functional units
- A scheduler optimises the order of the instruction to reduce the number of stalls required and hence improve the execution times of the program
- A scheduler has to keep track of all the data hazards to make sure the program functions properly

## Types
### Compiler Scheduler (Static)
- This is done after the program is created and the scheduling is done by the compiler itself on a software level
- The limitation of such an approach is the hazards caused by shared effective memory addresses which the compiler can't keep track of

### Hardware Scheduler (Dynamic)
- A h/w scheduler does the scheduling at a hardware level and overcomes the hazards that can't be handled by compiler
- An approach of this is [Tomasulo's Approach for Dynamic Scheduling](#mips-with-tomasulo-approach)

## MIPS With Tomasulo Approach
### The Hardware Components
  - Instruction Queue (FIFO)
  - Reservation Station
  - Address Registers
  - Floating Point Registers
  - Functional Units
  - Address Units
    - Load Buffer
    - Store Buffer
  - Common Data Bus
### Tables to track the flow
  - Issue Status - Tracks the clock cycles and stages for each instructions
    - Issue
    - Execute
    - Write Result
  - Reservation Stations - Tracks data dependencies between all the instructions, has a set number of entries for each type of instructions (ex. 3 ADDs, 3 LD, 3 MULs)
    - Busy
    - Op
    - Vi - Data Location of src1
    - Vk - Data Location of src2
    - Qi - Dependent Instruction of src1
    - Qj - Dependent Instruction of src2
    - A - Address for load and store
  - Register Status - Tracks which instruction the register is dependent on to finish and get data
    - Registers
    - Dependent Instruction
### What is Solves
- It takes care of problems like register renaming and data dependencies
- Can also introduce loop unrolling with branch predictors
- Data hazards with shared effective memory addresses by stalling the issue of the instructions by checking the store buffer and load buffers
- Control hazards (from branches) are dealt with by:
  - (No Branch Predictor) - no instructions are issued until branch instruction is resolved of dependencies
  - (With Branch predictor) - instructions are issued to the reservation stations but not executed to prevent overwriting of registers
  - (Modified With Hardware Speculation) - instructions are executed and the results are stored in a ROB (ReOrder Buffer) and only commited to the actual register file if the branch prediction is correct

### Changes because of Tomasulo Approach with Speculation
#### ROB Fields
- Instruction type
- Destination
- Value
- Ready

#### Hardware
1. Register file is updated by ROB not CDB
2. ROB also supplies operands and if ROB and Register file holds operands, priority is given to value in ROB (Most update value)
3. Store buffer is integrated with ROB
4. Output of Address Unit is fed to ROB
5. Broadcasting results using CDB to ROB and RSs but not Register file

#### Flow
1. Issue
2. Execute
3. Write Result
4. Commit (Addition)
  - Results are commited in order to the Register file if the prediction was correct
  - If prediction was wrong, the ROB is flushed
