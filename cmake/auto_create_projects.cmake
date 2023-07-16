# 设置输出目录函数，根据构建类型设置生成的文件的输出目录
function(set_output_directories target)
  string(TOLOWER ${CMAKE_BUILD_TYPE} build_type)
  set(output_dir "${CMAKE_BINARY_DIR}/../out/${build_type}")
  set_target_properties(${target}
    PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "${output_dir}/lib"
    LIBRARY_OUTPUT_DIRECTORY "${output_dir}/lib"
    RUNTIME_OUTPUT_DIRECTORY "${output_dir}/bin"
  )
endfunction()

# 根据给定的目录创建项目（可执行文件或库）
# 参数:
#   - project_dir: 项目目录路径
#   - target_type: 目标类型，可选值为 "executable" 或 "library" 或 "shared_library"
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
  set_output_directories(${project_name})
endfunction()

# 遍历子目录并为每个子目录创建项目（可执行文件或共享库）
# 参数:
#   - projects_dir: 子目录所在的父目录路径
function(create_projects projects_dir)
  file(GLOB children RELATIVE ${projects_dir} ${projects_dir}/*)
  foreach (child ${children})
    if (IS_DIRECTORY ${projects_dir}/${child})
      # 如果子目录中存在 CMakeLists.txt 文件则跳过
      if (EXISTS ${projects_dir}/${child}/CMakeLists.txt)
        continue()
      endif()

      file(GLOB main_cpp_files ${projects_dir}/${child}/main.cpp)
      if (main_cpp_files)
        create_project(${projects_dir}/${child} "executable")
      else()
        create_project(${projects_dir}/${child} "shared_library")
      endif()
    endif()
  endforeach()
endfunction()
