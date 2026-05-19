#include <cuda_runtime.h>
#include <stdio.h>

__global__ void HelloFromGPU() {
  if (threadIdx.x == 0) {
    printf("Hello from GPU!\n");
  } else {
    printf("Hello from GPU! (threadIdx.x: %d)\n", threadIdx.x);
  }
}

int main() {
  // Launch the kernel with 1 block of 1 thread.
  HelloFromGPU<<<1, 1>>>();

  // Wait for the kernel to finish.
  cudaDeviceSynchronize();

  return 0;
}
