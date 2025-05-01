# Add subdirectories
add_subdirectory(analysis)
add_subdirectory(devices)
add_subdirectory(parser)

# Create a larger library that bundles all subdirectory libraries
add_library(spicelib INTERFACE)

# Link the subdirectory libraries to the larger library
target_link_libraries(spicelib INTERFACE analysis_lib devices_lib parser_lib)
