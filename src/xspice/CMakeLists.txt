# Add subdirectories
add_subdirectory(evt)


# Create a larger library that bundles all subdirectory libraries
add_library(xspice INTERFACE)

# Link the subdirectory libraries to the larger library
target_link_libraries(xspice INTERFACE evt)
