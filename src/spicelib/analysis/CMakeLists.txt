# Collect all source files in this subfolder
file(GLOB SOURCES "*.c")

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/../devices")

# Create a library or executable (adjust as necessary)
add_library(analysis_lib ${SOURCES})
