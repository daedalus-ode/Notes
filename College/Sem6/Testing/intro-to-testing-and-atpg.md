# Intro to Testing and ATPG
## Testing
- Classify fabricated chips between faulty and non faulty

## Stuck at Fault Testing
### Single
- Stuck at Fault types:
  - Stuck at 1 (Sa1)
  - Stuck at 0 (Sa0)
- Assumptions:
  - Only 1 line is faulty
  - Fault line is premenantly set to 1 or 0
  - Fault is at the input or output gate
- Procedure:
  - Propogate the the SaF from interconnects to observable outputs by setting the inputs such that the fault can be observered
  - Examples: ![]()
- Fault Equivalence
  - When test 1 and test 2 have the same test vectors and the same outputs, we say test 1 and 2 are equivalent
  - Example: ![]()
- Collapse ratio
  - $CR = \frac{set(collapsed faults)}{set(all faults)}$
  - Example: ![]()

### Multi
