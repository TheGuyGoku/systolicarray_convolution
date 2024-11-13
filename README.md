# systolicarray_convolution
Convolution using Systolic Array

## V1
### Features:
- 3x3 Image with a 2x2 Kernel
- 2x2 Output
- No. of PEs = No. of output elements
- Only takes 1 input and 1 filter value at a time. 
- No. of cycles = No. of elements in the Input
### Improvements for the next version:
- Increase number of memory reads per cycle, thus reducing the total time
- Spanning for larger Image and Kernel Size
- Reduce FIFO/ interal registers usage
