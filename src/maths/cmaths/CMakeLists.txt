include_directories(${CMAKE_CURRENT_LIST_DIR}/../poly)

# Collect all source files in this subfolder
file(GLOB SOURCES "*.c")

# Create a library or executable (adjust as necessary)
add_library(cmath_lib ${SOURCES})
