
# Multiplication
- Array
- Sequential
- Refined Version

>[!Note] Question
>1. Multiply 3 into 2
>2. Multiply 13 into 11
>3. Calculate the time necessary to perform a multiply using the approach. If integer is 8 bits wide and 
>	- each step of operation takes 4 time units.  
>	- Addition is always performed 
>	- all the registers are already initialised

| Iteration | Multiplier (n) | Steps/action   | Multiplcand (2n) | Product (2n)           |
| --------- | -------------- | -------------- | ---------------- | ---------------------- |
| 0         | 0 0 1 1        | Initialisation | 0000_0010        | 0000_0000<br>0000_0010 |
### Faster Multiplier
- Adder stacked vertically
- Parallel tree

>[!Note] Question
>Time taken for N = 32 multiplier
>1. Software approach of 1st version of sequential multiplier
>2. Hardware approach of 1st version of sequential multiplier
>3. Software approach of refined sequential multiplier
>4. Hardware approach of refined sequential multiplier
>5. Adder stacked vertically
>6. Fast multiplication using parallel tree


>[!Note] Question
>In the 1st version of the sequential circuit multiplier 

# M extension
## Multiplication
### Signed
- `mul rd, rs1, rs2` - used to store the least significant 32 bits of result in rd
- `mulh rd, rs1, rs2` - used to store the most significant 32 bits of the result in rd
### Unsigned
- `mul rd, rs1, rs2` - used to store the least significant 32 bits of result in rd
- `mulhu rd, rs1, rs2` - used to store the most significant 32 bits of the result in rd
### Signed and Unsigned
- `mul rd, rs1, rs2` - used to store the least significant 32 bits of result in rd
- `mulhsu rd, rs1, rs2` - used to store the most significant 32 bits of the result in rd

>[!Note]
>The least significant 32 bits of any type of multiplication (Signed, Unsigned or both) will be the same. Hence same `mul` instruction is used in all cases
## Division
>[!Note] Question
>- reminder = reminder - divisor
>- if ( < 0 ) restore the original value in the result register by adding the divisor register (remainder = remainder + divisor). Shift left the quotient and make `Q0` = 0
>- if ( > 0 ) make `Qo` =1

Qs. Divide 7/2
`111`/`010`

| Iteration                                                                     | Action | Remainder | Divisor     | Rem register |
| ----------------------------------------------------------------------------- | ------ | --------- | ----------- | ------------ |
| 0                                                                             | initia | 0000      | 0010\| 0000 | 0000 0111    |
| 1. rem = rem - divisor<br>2. rem < 0<br>    rem = rem + 2<br>     rem + 2<br> |        |           |             |              |
