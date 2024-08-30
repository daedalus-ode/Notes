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

