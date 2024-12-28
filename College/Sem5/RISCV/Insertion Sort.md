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
>- This technique is where the compiler looks for the number of times a subroutine is used in the code. 
>- If the subroutine is used once the overhead instructions that comes from managing stacks in subroutines is not worth it. In which case the body of the subroutine is replaced inline with the main body. And there is no need to use the stack.
>- If the subroutine is used more than once, and the stack overhead is justified. Subroutines are used as usual with stacks.

# Array vs pointers
## Arrays
>[!Note] Question
>Convert to assembly
>- x10 -> array[]
>- x11 -> size
>- x5 -> i
```cpp
clear1(int arrary[], int size)
{
	int i;;
	for (i = 0; i < size; i += 1)
		array[i] = 0;
}
```

```asm
addi x5, x0, 0
start:
	slli x6, x5, 2
	add x6, x10, x6
	sw x0, 0(x6)
	addi x5, x5, 1
	blt x5, x11, start
```
## Pointers
> [!Note] Question
> Convert to assembly
> - x10 -> BA of array
> - x5 -> p
> - x11 -> size of array
```cpp
clear2 (int *array, int size)
{
	int *p;
	for (p = &array[0]; p < &array[size]; p += 1)
		*p = 0; 
}
```

```asm
mv x5, x10        # p = x5 = &array[0]
slli x6, x5, 2    # x6 = size * 4
add x6, x10, x6   # x6 = address of array[size]
loop:
	sw x0, 0(x5)
	add x5, x5, 4
	blt x5, x6 back
```
 
 >[!Note]
 >- Using pointers to clear the array elements from the assemble equivalent code, it is clear that the body of the for loop has 3 instructions. 
 >- As it moves the scaling shift and array bound addition outside the loop
 >- Thereby reducing the instructions to be executed per iterations from 5 to 3

# Arithmetic
## Addition
## Subtraction
## [Multiplication](./M-extension.md)
## Division