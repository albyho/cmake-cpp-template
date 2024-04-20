# Configure RPATH
# RPATH stuff
# see https://gitlab.kitware.com/cmake/community/-/wikis/doc/cmake/RPATH-handling
string(TOLOWER ${CMAKE_BUILD_TYPE} build_type)
if(NOT WIN32)
    set(CMAKE_SKIP_BUILD_RPATH FALSE)
    if(APPLE)
        # Enable RPATH support for generated binaries
        set(CMAKE_MACOSX_RPATH TRUE)
    else()
        set(CMAKE_BUILD_RPATH_USE_ORIGIN TRUE)
    endif()
    set(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE)
    # Add the automatically determined parts of the RPATH
    # which point to directories outside the build tree to the install RPATH
    set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

    set(COMMON_INSTALL_RPATH "./;./lib;../lib;./out/${build_type}")
    if(APPLE)
        set(CMAKE_INSTALL_RPATH "${COMMON_INSTALL_RPATH};@rpath")
    else()
        set(CMAKE_INSTALL_RPATH "$ORIGIN;${COMMON_INSTALL_RPATH}")
    endif()

    # PIC
    set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
endif()
