cmake_minimum_required(VERSION 3.28)
project(NGSPICE)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Define the WITH_PSS option
option(WITH_PSS "Enable PSS support" ON)

# Add a preprocessor definition if WITH_PSS is enabled
if(WITH_PSS)
  add_definitions(-DWITH_PSS)
endif()

add_definitions(-DSIMULATOR)

# Include the helper functions from the cmake directory
include(cmake/HelperFunctions.cmake)

# Include directories for header files
include_directories(${CMAKE_SOURCE_DIR}/src/include)

# Add subdirectories for each module
add_subdirectory(src)
