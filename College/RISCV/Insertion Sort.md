# Insertion Sort
```cpp
void sort (int v[], size_t int n)
{
	size_t i, j;
	for (i = 0; i < n; i += 1){
		for (j = 0; j < n && v[i] < v[j] ; j -= 1){
			swap(i,j);
		}
	}
}
```

```asm
# v[] = x10, n = x11, i = x19, j = x20
addi x21, x10, 0 # x
addi x22, x11, 0

addi x19, x0, 0
bge x19, x22, exit1
addi x20, x19, -1
blt x20, x0, exit2

slli x5, x20, 2
add x5, x20, x5
lw x6, 0(x5)
lw x7, 4(x5)
ble x0, x7, exit2
```

# Procedure inlining
>[!Note]
>In compilers, there exists optimisation techniques which reduce the overhead that comes with assembly programs. 
>### Procedure inlining
>This technique is where the compiler looks for the number of times a subroutine is used in the code. If the subroutine is used ones the overhead instructions that comes from 