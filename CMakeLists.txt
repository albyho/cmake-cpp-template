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

set( SHARED_LIB_SOURCES
    tubumu.cpp
)
add_library(tubumu SHARED ${SHARED_LIB_SOURCES})
set_target_properties(tubumu
    PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/../out/${build_type}/lib"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/../out/${build_type}/lib"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/../out/${build_type}/bin"
)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

include(CTest)
enable_testing()

add_executable(tubumu-test tubumu-test.cpp)
target_link_libraries(tubumu-test PRIVATE tubumu)
set_target_properties(tubumu-test
    PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/../out/${build_type}/lib"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/../out/${build_type}/lib"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/../out/${build_type}/bin"
)

# foreach( OUTPUTCONFIG ${CMAKE_CONFIGURATION_TYPES} )
#     string( TOUPPER ${OUTPUTCONFIG} OUTPUTCONFIG )
#     set( CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${CMAKE_SOURCE_DIR}/../out/${build_type}/lib )
#     set( CMAKE_LIBRARY_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${CMAKE_SOURCE_DIR}/../out/${build_type}/lib )
#     set( CMAKE_RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${CMAKE_SOURCE_DIR}/../out/${build_type}/bin )
#     message("CMAKE_RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG} : ${CMAKE_RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG}}")
# endforeach( OUTPUTCONFIG CMAKE_CONFIGURATION_TYPES )
