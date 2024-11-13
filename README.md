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
### Example: 
- Image: '{'{1, 2, 3}, '{4, 5, 6}, '{1, 2, 3}}
- Kernel: '{'{2, 0}, '{1, 2}}
- Output: '{'{16, 21}, '{13, 18}}
