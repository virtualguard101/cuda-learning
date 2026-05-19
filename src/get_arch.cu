#include <cuda_runtime.h>

#include <iostream>

cudaDeviceProp get_device_properties(int device_id) {
  cudaDeviceProp props;
  cudaGetDeviceProperties(&props, device_id);
  return props;
}

int main() {
  int device_count;
  cudaGetDeviceCount(&device_count);

  std::cout << "Found " << device_count << " GPU(s)\n\n";
  for (int i = 0; i < device_count; i++) {
    cudaDeviceProp props = get_device_properties(i);
    std::cout << "-----------GPU " << i << "-----------\n";
    std::cout << "GPU " << i << ": " << props.name << '\n';
    std::cout << "Compute capability: " << props.major << "." << props.minor
              << '\n';
    std::cout << "Total memory: " << props.totalGlobalMem << " bytes\n";
    std::cout << "Shared memory per block: " << props.sharedMemPerBlock
              << " bytes\n";
    std::cout << "Registers per block: " << props.regsPerBlock << '\n';
    std::cout << "Threads per block: " << props.maxThreadsPerBlock << '\n';
    std::cout << "Max threads per multiprocessor: " << props.maxThreadsDim[0]
              << "x" << props.maxThreadsDim[1] << "x" << props.maxThreadsDim[2]
              << '\n';
    std::cout << "Max grid size: " << props.maxGridSize[0] << "x"
              << props.maxGridSize[1] << "x" << props.maxGridSize[2] << '\n';
    std::cout << "Max threads per block: " << props.maxThreadsPerBlock << '\n';
  }

  return 0;
}
