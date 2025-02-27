# Fundamentals of Quantitative Design and Analysis

## Architecture
### Types of Parallelism
- Data Level Parallelism (DLP)
  - Independent data can be operated on at the same time
  - Simultaneous execution of the same function across the elements of a data set
- Task Level Parallelism (TLP)
  - Tasks of work that are independent of each other can be executed in parallel
  - Simultaneous execution of multiple and different functions across the same or different data sets

### Parallel Architectures
- Instructions Level Parallelism
  - Data level parallelism using pipelining and branch prediction
- Vector Architecture and GPUs
  - Data level parallelism by applying single instruction on a collection of data
- Thread Level Parallelism
  - Data level parallelism or task level parallelism in *tightly coupled hardware* by allowing interaction between parallel threads
- Request Level Parallelism
  - Parallelism in decoupled tasks at the request of programmer

### Micheal Fynn Class of Parallelism
- SISD
- SIMD
- MISD
- MIMD


---
### Classifications of Computer Architecture
- Based on Parallelism
  - 

<!-- TODO: fill missed classes -->

---

## Cache memory
- Memory element present between main memory and processor
- Types:
  - Primary cache - embedded on the processor
  - Secondary cache - embedded outside the processor

### Block Placement
#### Direct Mapping
- Block placement is done using this formula - `Block address mod No. Blocks`
- Every entry in cache can hold only 1 of the mapped blocks from the lower level entry at a given point of time
- There are 32 blocks and each block is of 3 blocks
- Cache memory support direct mapping and has 8 entries

#### Block Identifiers
- Steps for accessing cache
  1. Compare the tag from cache with tag from processor (Comparator)
  2. Check for valid bit in the cache (Data stored or not)
  3. Fetch the data from cache (Hit) else main memory (Miss)

> [!NOTE]
> - $TAG Bits = (Address\ lines from Processor – (Number of address lines for Index  (n) + Number of address line for Block interims of words + byte offset))$
> - $TAG bits = = (Address\ lines from Processor – (n+m+2))$
> m - No. Address lines for block interims of words
> n - No. Address lines for index
> 
> - Format of cache
>   - Least significant of 2 bytes - byte offset
>   - Next n bits - Word offset
>   - Next n bits - Indexing offset
>   - Rest bits - TAG

<!-- TODO: fill -->

### Performance
#### Strategies
##### Set Associative
- The cache is split into sets. Hence increasing the number of entries in a block(set) but doesn't increase miss rate
###### Drawback
- Increased HIT time because block can go anywhere in the set therefore, all tags of the set must be searched
##### Fully Associative
###### Drawback
- Increased HIT time because block can go anywhere therefore, all tags of the block must be searched
- Size of Tag field increases with associativity
- Increased hardware size because of increased number of comparators for the tags

> [!NOTE]
> ### Questions
> ##### Implementation of 4 way set associative cache which has 1K block for each of words
> ##### Assuming a cache of 4096 blocks, a 4-word block size, and a 32-bit address, find the total number of sets and the total number of tag bits for caches that are direct mapped
> ###### Answer
> - two way - 70 Kb
> - four-way set associative - 74 Kb
> - fully associative - 115 Kb
> - Conclusion: Each degree of associativity decreases the number of sets by a factor of 2, thus decreases the number of bits used for indexing (m) by 1 and increases the number of bits in the tag field by 1
> ##### Assume the following 3 line cache is fully associative

> [!NOTE]
> ### Question
> - A system has a cache of 128 KB and a block size of 32 B. CPU generates the address of 32 bits. The address has 18 TAG bits. How many comparators are used in this cache implementation?
> 	- 4
> 	- ==8==
> 	- 6
> 	- 10
> 	- Answer:
> 		- $TAG = (32- (n+m+2)) \rightarrow n = 9$
> - In handling writes, the main memory and the cache consistency is maintained by writing the data into both the main memory and the cache on a write hit? #todo
> - For direct-mapped cache design with a 32 bit address the following bits of the address are used to access the cache with write back policy. What is total bits required for such a cache implementation
> 	- Tag - 31 - 10
> 	- Index - 9 - 5
> 	- Offset - 4 - 0

#### Splitting the cache
- Splitting the cache improves the performance of the cache
- Types:
	- Instruction cache
	- Data cache

#### Multi Level Cache
- Split into different levels of cache

> [!NOTE]
> Qs. $CPI = 1.0$, $Miss\ Rate (Primary\ Cache)_o = 0\%$, $Clk\ Rate = 4GHz$, $Mem\ Access\ Time = 100ns$, $Miss\ Rate (Primary\ Cache) = 2\%$. Improvement if we have secondary cache of 5ns access time for hit or miss and is large enough to reduce miss rate of main memory to 0.5%?
#### Average Memory Access Time (AMAT)
- Average Memory access time is the average time to access memory considering both hit and misses and frequency of different accesses
- $AMAT = Time\ for\ a\ hit + Miss\ Rate \times Miss\ Penalty$

> [!NOTE]
> - Qs. A computer has a single cache (off-chip) with a 2 ns hit time and a 98% hit rate. Main memory has a 40 ns access time. What is the computer’s effective access time? If we add an on-chip cache with a 0.5 ns hit time and a 94% hit rate, what is the computer’s effective access time? How much of a speedup does the on-chip cache give the computer? 
> - Qs. Assume off chip L1 cache is replaced with on chip L1 cache with saem hit rate but the hit time has reduced to 0.5 ns. Calculate the average access time
> - Qs. .... with 0.2 ns in time and 94% 

### Cache Optimisations
#### 1. Larger Block Size
#### 2. Larger Cache Size
#### 3. Higher Associativity
#### 4. Multilevel Cache
#### 5. Giving Priority to Read Misses over Writes to Reduce Miss Penalty 

> [!NOTE]
> - For the following basic cache optimisation technique, write which misses or miss penalty is reduced along with hardware complexity
> 	- If miss rate, mention the class of misses getting reduced
>
> |         Type         |          Reduction          |  Hardware   |
> | :------------------: | :-------------------------: | :---------: |
> |  Larger Block Size   | MR Due to Compulsory misses | Trivial(0)  |
> |  Larger Cache Size   | MR Due to Compulsory misses | Moderate(1) |
> | Higher Associativity | MR Due to Compulsory misses | Moderate(1) |
> |   Multilevel Cache   | MR Due to Compulsory misses | Trivial(0)  |


---
# Slides
## Types of Parallelism
- Data Level Parallelism
	- Simultaneous execution of same functions across multiple data sets
- Instruction Level Parallelism
	- Simultaneous execution of multiple and different functions across same/different data sets
## Application of these Parallelism types
- Instruction Level Parallelism
	- Pipelining, speculative execution
- Vector Architecture and GPUs
	- Single instruction on collection of data
- Thread Level Parallelism
	- Interaction between parallel threads
- Request Level Parallelism
	- Decoupled tasks specified by programmer or OS

## Micheal Flynn Classes of Parallelism
- SISD (Single Instruction, Single Data)
- SIMD (Single Instruction, Multiple Data)
- MISD (Multiple Instruction, Single Data)
- MIMD (Multiple Instruction, Multiple Data)
---
## Caches
### Block Placement
#### Mapping Techniques
##### Direct
- $Address\ in\ Cache = Block\ Address \mod no.\ blocks\ in\ cache$
##### Associative
##### Set Associative
### Block Identification
### Block Replacement
### Write Strategies