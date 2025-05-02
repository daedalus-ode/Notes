# Order of Execution
## What is Scheduling
### In Order
- All subsequent instructions after the dependent instruction must wait until the dependency is clear

### Out of Order
- The subsequent instruction after a dependant instruction need not wait if the subsequent instructions are clear of dependencies
- Introduces possibility of WAR and WAW

#### Scheduling
- The program has to be arranged in an optimal way to reduce the number of stalls introduced to deal with the dependencies.

##### Types:
- Compiler Scheduling (static)
  - Con
    - Complete microarchitecture H/W details need to be shared with compiler dev company
    - Cannot detect true dependencies wrt to memory address
- Hardware Scheduling (dynamic)
  - Pro
    - Need not share complete microarchitecture details with compiler dev company
    - Can deal with all types of dependencies

## Tomasulo's Approach for Dynamic Scheduling

#### Instruction Queue
This instruction queue operates in FIFO pattern. The instruction will be updated in the corresponding 

<!-- TODO: Incomplete -->


# Chaining
- When the vector operations does not need to wait for all the elements of the vector to be fetched from memory. The Next operation is carried out when 1st element is fetched itself

## Vector Length Registers

> [!NOTE]
> Question
> WAP to use the DAXPY operation for vector length n>32
> ```cpp
> i = 0;
> while (n!=0){
> 	vl = min(MVL, n);
> 	for (j = 0; j < vl; j++, i++)
> 		Y[i] = a*X[i] + Y[i];
> 	n = n - vl;
> }
> ```

`FMV.X.D` moves the double precision value in floating point precision value in floating point register rs1 to a representation in IEEE754-2008 standard encoding in integer register rd

**Load Instructions**
- `vl`
- `vldx` - Indexed Load with vector whose elements are at `R[rs2]` + `V[rs2]` is an index (gather)

> [!NOTE]
> **Question**
> If `vldx v3`

```asm
vld 
```
