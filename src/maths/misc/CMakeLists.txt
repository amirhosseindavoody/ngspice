# Collect all source files in this subfolder
file(GLOB SOURCES "*.c")

# Create a library or executable (adjust as necessary)
add_library(maths_misc ${SOURCES})
