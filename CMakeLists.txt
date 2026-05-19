cmake_minimum_required(VERSION 3.18)

project(cuda_learning LANGUAGES CXX CUDA)

set(CMAKE_CUDA_STANDARD 17)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
# Put -I flags in compile_commands.json so clangd can read them (not .rsp files).
set(CMAKE_CUDA_USE_RESPONSE_FILE_FOR_INCLUDES OFF)

add_subdirectory(src/multi ${CMAKE_CURRENT_SOURCE_DIR}/src/multi/build)
