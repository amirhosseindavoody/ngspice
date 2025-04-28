# # Collect all source files in the src directory and its subfolders
add_subdirectory(maths)
add_subdirectory(spicelib)
add_subdirectory(frontend)
add_subdirectory(misc)

# Create a library or executable (adjust as necessary)
add_executable(ngspice_main main2.c conf.c ngspice.c winmain.c hist_info.c)

find_package(OpenMP REQUIRED)
if(OpenMP_CXX_FOUND)
    target_link_libraries(ngspice_main PRIVATE OpenMP::OpenMP_CXX)
endif()

find_library(TINFO_LIB tinfo REQUIRED)
target_link_libraries(ngspice_main PRIVATE ${TINFO_LIB})

# link math library
target_link_libraries(ngspice_main PRIVATE m)

find_package(X11 REQUIRED)
target_link_libraries(ngspice_main PRIVATE ${X11_LIBRARIES} Xt)

# Find the Readline package
target_link_libraries(ngspice_main PRIVATE readline)

target_link_libraries(frontend_lib PUBLIC cmaths_lib)

target_link_libraries(ngspice_main PUBLIC frontend_lib)
target_link_libraries(ngspice_main PUBLIC misc_lib)
target_link_libraries(ngspice_main PUBLIC cmaths_lib)
target_link_libraries(ngspice_main PUBLIC devices_lib)
target_link_libraries(ngspice_main PUBLIC analysis_lib)