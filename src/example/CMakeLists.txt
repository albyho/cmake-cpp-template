project(example)

set(SOURCES
  example.cpp
)

add_compile_definitions(Example_EXPORTS)
add_library(example SHARED ${SOURCES})

include(${CMAKE_SOURCE_DIR}/cmake/summary.cmake)
summary(${PROJECT_NAME})
