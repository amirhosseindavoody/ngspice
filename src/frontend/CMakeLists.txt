add_subdirectory(help)
add_subdirectory(numparam)
add_subdirectory(parser)
add_subdirectory(plotting)
add_subdirectory(trannoise)
add_subdirectory(wdisp)

# Collect all source files in this subfolder
file(GLOB SOURCES "*.c")

set(EXCLUDE_FILES "testcommands.c")
glob_files_with_exclusions("*.c" ${EXCLUDE_FILES} SOURCES)

# Add a custom command to run Bison
add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/parse-bison.c ${CMAKE_CURRENT_BINARY_DIR}/parse-bison.h
    COMMAND bison -d -o ${CMAKE_CURRENT_BINARY_DIR}/parse-bison.c ${CMAKE_CURRENT_SOURCE_DIR}/parse-bison.y
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/parse-bison.y
    COMMENT "Generating parser files with Bison"
)

# Add a custom target to ensure the Bison files are generated before building
add_custom_target(
    generate_parser_files
    DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/parse-bison.c ${CMAKE_CURRENT_BINARY_DIR}/parse-bison.h
)

# Include the generated header file directory
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

# Add the generated parser file to the source list
list(APPEND SOURCES ${CMAKE_CURRENT_BINARY_DIR}/parse-bison.c)

# Create the library target first
add_library(frontend_lib ${SOURCES})

# Add the dependency to ensure Bison files are generated before building the library
add_dependencies(frontend_lib generate_parser_files)

# Link libraries
target_link_libraries(frontend_lib PRIVATE 
    frontend_help_lib frontend_numparam_lib frontend_parser_lib frontend_plotting_lib frontend_trannoise_lib frontend_wdisp_lib
    misc_lib
)
