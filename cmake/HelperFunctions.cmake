# Function to get the name of the current directory
function(get_current_directory_name out_var)
    # Get the current directory
    get_filename_component(current_dir "${CMAKE_CURRENT_LIST_DIR}" NAME)
    
    # Set the output variable
    set(${out_var} "${current_dir}" PARENT_SCOPE)
endfunction()

# Function to add libraries from subdirectories
function(add_subdir_library lib_name)
    # Get the current directory name
    get_current_directory_name(current_folder_name)

    # Collect all source files in this subfolder
    file(GLOB SOURCES "*.c")

    set(full_lib_name "${current_folder_name}_lib")

    # Create a library or executable (adjust as necessary)
    add_library(${full_lib_name} ${SOURCES})

    message("Added library: ${full_lib_name}")

    set(${lib_name} "${full_lib_name}" PARENT_SCOPE)
endfunction()


# Define a function to glob files based on a pattern, excluding specified ones
function(glob_files_with_exclusions glob_pattern exclude_files output_var)
    # Glob all files matching the given pattern in the source directory
    file(GLOB ALL_FILES "${glob_pattern}")

    # Create a list to hold the filtered files
    set(FILTERED_FILES)

    # Loop through all found files and exclude specified ones
    foreach(FILE ${ALL_FILES})
        get_filename_component(FILENAME ${FILE} NAME)
        if(NOT FILENAME IN_LIST exclude_files)
            list(APPEND FILTERED_FILES ${FILE})
        endif()
    endforeach()

    # Set the output variable with filtered file list
    set(${output_var} ${FILTERED_FILES} PARENT_SCOPE)
endfunction()