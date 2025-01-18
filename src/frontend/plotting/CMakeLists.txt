# Collect all source files in this subfolder
file(GLOB SOURCES "*.c")

# Create a library or executable (adjust as necessary)
add_library(frontend_plotting_lib ${SOURCES})

target_include_directories(frontend_plotting_lib PRIVATE ..)
