# # Collect all source files in the src directory and its subfolders
add_subdirectory(maths)
add_subdirectory(spicelib)
add_subdirectory(frontend)
add_subdirectory(misc)

# Create a library or executable (adjust as necessary)
# add_executable(ngspice_main main2.c conf.c ngspice.c winmain.c hist_info.c)
add_executable(ngspice_main main.c conf.c ngspice.c winmain.c hist_info.c)

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

target_link_libraries(ngspice_main PRIVATE frontend_lib)
target_link_libraries(ngspice_main PRIVATE misc)
target_link_libraries(ngspice_main PRIVATE math)
target_link_libraries(ngspice_main PRIVATE spicelib)
