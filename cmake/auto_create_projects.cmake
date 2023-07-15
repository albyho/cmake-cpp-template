function(create_output_directories build_type)
  set(output_dir "${CMAKE_BINARY_DIR}/../out/${build_type}")
  set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${output_dir}/lib")
  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${output_dir}/lib")
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${output_dir}/bin")
endfunction()

# Function to create a project for each project
function(create_project project_dir target_type)
  get_filename_component(project_name ${project_dir} NAME)
  file(GLOB_RECURSE src_files 
    ${project_dir}/*.c
    ${project_dir}/src/*.c
    ${project_dir}/*.cc
    ${project_dir}/src/*.cc
    ${project_dir}/*.cpp
    ${project_dir}/src/*.cpp
    ${project_dir}/*.h
    ${project_dir}/include/*.h
    ${project_dir}/*.hpp
    ${project_dir}/include/*.hpp
    )
  if (target_type STREQUAL "executable")
    message(STATUS "######## Create executable project: ${project_name}")
    add_executable(${project_name} ${src_files})
  elseif (target_type STREQUAL "library")
    message(STATUS "######## Create library project: ${project_name}")
    add_library(${project_name} ${src_files})
  elseif (target_type STREQUAL "shared_library")
    message(STATUS "######## Create shared library project: ${project_name}")
    add_library(${project_name} SHARED ${src_files})
  endif()
  create_output_directories(${CMAKE_BUILD_TYPE})
endfunction()

# Iterate through subdirectories and create an executable for each one with a main.cpp file
function(create_projects projects_dir)
  file(GLOB children RELATIVE ${projects_dir} ${projects_dir}/*)
  foreach (child ${children})
    if (IS_DIRECTORY ${projects_dir}/${child})
      file(GLOB main_cpp_files ${projects_dir}/${child}/main.cpp)
      if (main_cpp_files)
        create_project(${projects_dir}/${child} "executable")
      else()
        create_project(${projects_dir}/${child} "shared_library")
      endif ()
    endif ()
  endforeach ()
endfunction()

create_projects("${CMAKE_SOURCE_DIR}/projects")
