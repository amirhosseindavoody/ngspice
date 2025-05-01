# Collect all source files in this subfolder
file(GLOB SOURCES "*.c")

include_directories("${CMAKE_SOURCE_DIR}/src/frontend")

# Add a custom command to run Bison
add_custom_command(
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/inpptree-parser.c
         ${CMAKE_CURRENT_BINARY_DIR}/inpptree-parser.h
  COMMAND bison -d -o ${CMAKE_CURRENT_BINARY_DIR}/inpptree-parser.c
          ${CMAKE_CURRENT_SOURCE_DIR}/inpptree-parser.y
  DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/inpptree-parser.y
  COMMENT "Generating parser files with Bison")

# Add a custom target to ensure the Bison files are generated before building
add_custom_target(
  generate_inpptree_parser_files
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/inpptree-parser.c
          ${CMAKE_CURRENT_BINARY_DIR}/inpptree-parser.h)

# Include the generated header file directory
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

# Add the generated parser file to the source list
list(APPEND SOURCES ${CMAKE_CURRENT_BINARY_DIR}/inpptree-parser.c)

# Create a library or executable (adjust as necessary)
add_library(parser_lib ${SOURCES})

# Add the dependency to ensure Bison files are generated before building the
# library
add_dependencies(parser_lib generate_inpptree_parser_files)
