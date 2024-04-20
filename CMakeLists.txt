# 指定所需的最低 CMake 版本。
cmake_minimum_required(VERSION 3.25)
# 定义项目名称、版本号和支持的编程语言。
project(root VERSION 0.1.0 LANGUAGES C CXX)

# 设置 C++ 标准为 C++17。
set(CMAKE_CXX_STANDARD 17)
# 要求编译器严格遵循所设置的 C++ 标准。
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# 禁用任何编译器特定的扩展。
set(CMAKE_CXX_EXTENSIONS OFF)

# 如果未设置构建类型，则将构建类型设置为 "Release"。
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Build Type" FORCE)
endif()

# 生成 compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS True)

# 在生成的文件名后添加 "_debug" 后缀，用于区分 Debug 版本和 Release 版本的文件。
set(CMAKE_DEBUG_POSTFIX "_debug")

# 配置 rpath
include(${PROJECT_SOURCE_DIR}/cmake/configure_rpath.cmake)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

include(CTest)
enable_testing()

include(${PROJECT_SOURCE_DIR}/cmake/create_projects.cmake)
create_projects(${CMAKE_SOURCE_DIR}/src)

# 自动创建的 example_test 项目需要额外的配置
target_include_directories(example_test PRIVATE ${CMAKE_SOURCE_DIR}/src/example)
target_link_libraries(example_test PRIVATE example)
