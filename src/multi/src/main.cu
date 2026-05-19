#include <cuda_runtime.h>

#include "kernels.cuh"

int main() {
  DummyKernel<<<5, 5>>>();
  cudaDeviceSynchronize();
  return 0;
}
