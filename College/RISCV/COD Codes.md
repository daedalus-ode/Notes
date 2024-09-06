# Procedures
- Compile to asm
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
	add t0, x10, x11
	add t1, x12, x13
	sub x20, t0, t1
	jalr x1
```
