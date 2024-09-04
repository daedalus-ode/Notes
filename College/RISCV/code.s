# Transalate the following C into asm B[8] = A[i] + A[j]
# x5 -> f
# x6 -> g
# x7 -> h
# x28 -> i
# x29 -> j
# Base (A) -> x10
# Base (B) -> x11

.data 
a: .byte 0x12, 0x23, 0x34, 0x45
b: .byte 0x42, 0x33, 0x68, 0x75

.text
la x10, a
la x11, b

addi x28, x0, 3
addi x29, x0, 1

// fetch A[i]
loop:
lw x5, 0(x10)
addi x10, x10, 
addi x28, x28, -1
bnez x28, loop

lw x5, 


# Transalate the following C into asm 
# if(i == j) 
# 	f = g + h; 
# 	else f= g - h;
#
# x19 -> f
# x20 -> g
# x21 -> h
# x22 -> i
# x23 -> j

.text


# Check if a given 8 bit number is a 2 out of 5 code
# Most significant of the 3 bits must be zero
# If the least significant 5 bits there must only be 2 1's

.data 
a: .byte 0xab, 0xe0

.text
la x10, a
lb x11, 0(x10)
lb x12, 1(x10)
and x13, x11, x12
seqz x20, x13



//and x13, x11, 0x07

# Write a program to swap the content of 2 memory locations. 
# Assume 2 elements in the memory location, as a[0], location 2 holds a[1].
# if a[0] is less than a[1]  swap memory, else no action


# Using bubble sort
