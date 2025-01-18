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

# Create a library or executable (adjust as necessary)
add_library(frontend_lib ${SOURCES})
target_link_libraries(frontend_lib PRIVATE 
    frontend_help_lib frontend_numparam_lib frontend_parser_lib frontend_plotting_lib frontend_trannoise_lib frontend_wdisp_lib)

target_link_libraries(frontend_lib PRIVATE misc_lib)
