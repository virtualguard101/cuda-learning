#include <stdio.h>

#include "kernels.cuh"

__global__ void DummyKernel() {
  printf("Block %d, Thread %d\n", blockIdx.x, threadIdx.x);
}
