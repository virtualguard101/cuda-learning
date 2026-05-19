# Standalone:  cd src/multi && cmake -B build && cmake --build build
# Superbuild: cmake -B build (from repo root) && cmake --build build
if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    cmake_minimum_required(VERSION 3.18)
    project(cuda_app LANGUAGES CXX CUDA)

    set(CMAKE_CUDA_STANDARD 17)
    set(CMAKE_CXX_STANDARD 17)
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
endif()

add_executable(cuda_app
    src/main.cu
    src/kernels.cu
)

target_include_directories(cuda_app PRIVATE include)

set_target_properties(cuda_app PROPERTIES
    CUDA_ARCHITECTURES 89
)

target_compile_options(cuda_app PRIVATE
    $<$<COMPILE_LANGUAGE:CUDA>:-Xcompiler=-Wall,-O2>
)
