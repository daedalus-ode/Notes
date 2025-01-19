# Fundamentals of Quantitative Design and Analysis

## Types of Parallelism
- Data Level Parallelism (DLP)
  - Independent data can be operated on at the same time
  - Simultaneous execution of the same function across the elements of a data set
- Task Level Parallelism (TLP)
  - Tasks of work that are independent of each other can be executed in parallel
  - Simultaneous execution of multiple and different functions across the same or different data sets

## Parallel Architectures
- Instructions Level Parallelism
  - Data level parallelism using pipelining and branch prediction
- Vector Architecture and GPUs
  - Data level parallelism by applying single instruction on a collection of data
- Thread Level Parallelism
  - Data level parallelism or task level parallelism in *tightly coupled hardware* by allowing interaction between parallel threads
- Request Level Parallelism
  - Parallelism in decoupled tasks at the request of programmer

## Micheal Fynn Class of Parallelism
- SISD
- SIMD
- MISD
- MIMD


---
## Classifications of Computer Architecture
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
> - $TAG Bits = ( Address lines from Processor – (Number of address lines for Index  (n) + Number of address line for Block interims of words + byte offset))$
> - $TAG bits = = ( Address lines from Processor – (n+m+2))$
> m - No. Address lines for block interims of words
> n - No. Address lines for index
> 
> - Format of cache
>   - Least significant of 2 bytes - byte offset
>   - Next n bits - Word offset
>   - Next n bits - Indexing offset
>   - Rest bits - TAG
