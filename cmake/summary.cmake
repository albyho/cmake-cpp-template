function (summary)
  message(STATUS "")
  message(STATUS "******** Summary ********")
  message(STATUS "  CMake version             : ${CMAKE_VERSION}")
  message(STATUS "  CMake command             : ${CMAKE_COMMAND}")
  message(STATUS "  System                    : ${CMAKE_SYSTEM_NAME}")
  message(STATUS "  C++ compiler              : ${CMAKE_CXX_COMPILER}")
  message(STATUS "  C++ compiler version      : ${CMAKE_CXX_COMPILER_VERSION}")
  message(STATUS "  CXX flags                 : ${CMAKE_CXX_FLAGS}")
  message(STATUS "  Build type                : ${CMAKE_BUILD_TYPE}")
  get_directory_property(tmp DIRECTORY ${PROJECT_SOURCE_DIR} COMPILE_DEFINITIONS)
  message(STATUS "  Compile definitions       : ${tmp}")
  message(STATUS "  CMAKE_PREFIX_PATH         : ${CMAKE_PREFIX_PATH}")
  message(STATUS "  CMAKE_INSTALL_PREFIX      : ${CMAKE_INSTALL_PREFIX}")
  message(STATUS "  CMAKE_MODULE_PATH         : ${CMAKE_MODULE_PATH}")
  message(STATUS "")
endfunction()
