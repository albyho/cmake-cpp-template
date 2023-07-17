# 指定所需的最低 CMake 版本。
cmake_minimum_required(VERSION 3.25)
# 定义项目名称、版本号和支持的编程语言。
project(tubumu VERSION 0.1.0 LANGUAGES C CXX)

# 设置 C++ 标准为 C++17。
set(CMAKE_CXX_STANDARD 17)
# 要求编译器严格遵循所设置的 C++ 标准。
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# 禁用任何编译器特定的扩展。
set(CMAKE_CXX_EXTENSIONS OFF)

# 如果未设置构建类型，则将构建类型设置为 "release"。
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE release CACHE STRING "Build Type" FORCE)
endif()
string(TOLOWER ${CMAKE_BUILD_TYPE} build_type)

# 生成 compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS True)

# 在生成的文件名后添加 "d" 后缀，用于区分 Debug 版本和 Release 版本的文件。
set(CMAKE_DEBUG_POSTFIX "d")

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

include(CTest)
enable_testing()

include(${PROJECT_SOURCE_DIR}/cmake/auto_create_projects.cmake)
create_projects(${CMAKE_SOURCE_DIR}/src)

# 添加 tubumu-test 的包含目录
target_include_directories(example-test PRIVATE ${CMAKE_SOURCE_DIR}/src/example)
# 添加 tubumu-test 的链接库
target_link_libraries(example-test PRIVATE example)
