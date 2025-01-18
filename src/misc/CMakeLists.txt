# Collect all source files in this subfolder
file(GLOB SOURCES "*.c")

# Create a library or executable (adjust as necessary)
add_library(misc_lib ${SOURCES})

target_link_libraries(misc_lib PRIVATE frontend_lib)