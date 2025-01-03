cmake_minimum_required(VERSION 3.28)
project(NGSPICE)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# # Include directories for header files
# include_directories(include)

# Add subdirectories for each module
add_subdirectory(src)
