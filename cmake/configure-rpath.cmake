# Configure RPATH
string(TOLOWER ${CMAKE_BUILD_TYPE} build_type)
if(NOT WIN32)
    set(CMAKE_SKIP_BUILD_RPATH  FALSE)
    if(APPLE)
        set(CMAKE_MACOSX_RPATH 1)
    else()
        set(CMAKE_BUILD_RPATH_USE_ORIGIN TRUE)
    endif()
    set(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE)
    set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
    if(APPLE)
        set(CMAKE_INSTALL_RPATH "./;./lib;../lib;./out/${build_type};@rpath")
    else()
        set(CMAKE_INSTALL_RPATH "$ORIGIN/;./;./lib;../lib;./out/${build_type};@rpath")
    endif()
endif()
