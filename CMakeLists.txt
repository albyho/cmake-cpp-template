cmake_minimum_required(VERSION 3.25)
project(tubumu VERSION 0.1.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE release CACHE STRING "Build Type" FORCE)
endif()
string(TOLOWER ${CMAKE_BUILD_TYPE} build_type)

# 生成 compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS True)

# Debug 版增加 `d` 后缀
set(CMAKE_DEBUG_POSTFIX "d")

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

include(CTest)
enable_testing()

include(${PROJECT_SOURCE_DIR}/cmake/auto_create_projects.cmake)
target_include_directories(tubumu-test PRIVATE ${CMAKE_SOURCE_DIR}/projects/tubumu)
target_link_libraries(tubumu-test PRIVATE tubumu)
