# Optimisations

## Basic

- Larger block size
- Larger cache size
- Higher Associativity
- Multi level cache
        - Inclusive cache
        - Exclusive cache
        - Non inclusive cache
- Priority to read miss over writes
- Avoid Address translation during Indexing of cache

## Advanced

- Simple and small L1 caches - reduce hit time & power
- Way Prediction - reduce hit time
- Pipelined cache - improve bandwidth
- Non Blocking caches - increase bandwidth
- Multi banked caches - increase bandwidth & power
- Critical word first and early restart - reduce miss penalty
- Merging write buffer - reduce miss penalty
- Compiler Optimisations - reduce miss rate
        - Looping
        - Blocking
- Hardware prefetch of instructions & data - reduce miss rate
- Compiler controlled prefetch - reduce miss rate
        - Register prefetch
        - Cache prefetch


# Virtual Memory


# Virtual Machines


# Instruction Level Parallelism

## Loop Level Parallelism


## Dependance

### Data
#### Register
- Easy to detect

#### Memory
- Hard to detect

### Name
- Two instructions use the same register or memory location
- There is no flow of data between the instructions associated with that name
- Types
    - Anti Dependance
    - Output Dependance

### Control


## Data Hazards

### Types

#### RAW
- Gets old value after instruction contention

#### WAW
- Overwrites value through wrong ordering of execution

#### WAR
- Gets new value after instruction contention
