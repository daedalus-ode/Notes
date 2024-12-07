# Vector Extensions

## Basics

- The RISC-V Vector Extension (RVV) aims at providing vector computation capabilities to the RISC-V architecture
- RVV wants to have wide applicability, so the design is very flexible
- The flexibility also allows RVV to be used in more classical SIMD approaches
- The ISAs for Vector extensions usually support their arithmetic counterpart and more instructions specific to handling the memory access and vector element manipulation
- This results in the design not being able to be encoded in 32 bit instructions

## Design

- RVV defines 32 vector registers
  - Number of registers -> v0, v31
  - VLEN -> constant parameter chosen by the implementor and must be a power of two
  - ELEN -> Maximum Element size

>[!note]
> ### Default
> - 8 <= ELEN <= VLEN
> - ELEN must be a power of 2
> ### Zv standard
> - 64, 128 <= VLEN
> - 32, 64 <= ELEN

## Operations
- Two type of  registers used:
	- `vtype` - Vector Type
		- `sew` - Standard Element Width
		- `lmul` - Length Multiplier
	- `vl` - Vector Length
	- $0 <= vl <= vlmax(sew, lmul)$
	- $vlmax(sew, lmul) = \frac{VLEN}{sew} * lmul$

## Instructions
- `vadd.vv v5, v4, v2`
![Picture](<../Assets/vadd.png>)
