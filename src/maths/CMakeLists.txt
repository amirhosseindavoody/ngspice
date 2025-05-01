add_subdirectory(cmaths)
add_subdirectory(poly)
add_subdirectory(misc)

# Create a larger library that bundles all subdirectory libraries
add_library(math INTERFACE)

# Link the subdirectory libraries to the larger library
target_link_libraries(math INTERFACE cmaths_lib poly_lib maths_misc)
