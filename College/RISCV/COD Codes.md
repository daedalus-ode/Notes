# Procedures
- Compile to assembly
	```cpp
	int main(){
		int y;
		y = diffosums(2, 3, 4, 5);
	}
	
	int diffosums(int f, int g, int h, int i){
		int results;
		results = (f + g) - (h + i);
		return results
	}
	```

	```asm
	addi x10, x0, 2
	addi x11, x0, 3
	addi x12, x0, 4
	addi x13, x0, 5
	
	jal x1, diffosums
	
	diffosums:
		addi sp, sp, -12 # Allocate stack memory
		sw x5, 8(sp) # pushing the register values into stack
		sw x6, 4(sp)
		sw x7, 0(sp)
		
		add t0, x10, x11
		add t1, x12, x13
		sub x20, t0, t1
		addi x10, x20, 0 # why?
		
		lw x20, 0(sp) # popping the register values from stack
		lw x6, 4(sp)
		lw x5, 8(sp)
		addi sp, sp, 12 # De-allocating Stack memory
		
		jalr x0, 0(x1)
	
	addi x21, x10, 0
	```
