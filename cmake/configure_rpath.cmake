# Configure RPATH

# RPATH stuff
# see https://gitlab.kitware.com/cmake/community/-/wikis/doc/cmake/RPATH-handling

# Linux 动态库目录搜索顺序：
# RPATH - 链接到可执行文件的目录列表，大多数 UNIX 系统都支持。如果RUNPATH存在则被忽略。
# LD_LIBRARY_PATH - 保存目录列表的环境变量。
# RUNPATH - 与RPATH相同，但在LD_LIBRARY_PATH之后搜索，仅在最新的 UNIX 系统上受支持，例如在大多数当前的 Linux 系统上。
# /etc/ld.so.conf -ld.so列出其他库目录的配置文件。
# 内置目录 - 基本包括 /lib和/usr/lib。


string(TOLOWER ${CMAKE_BUILD_TYPE} build_type)
if(NOT WIN32)
    # use, i.e. don't skip the full RPATH for the build tree
    set(CMAKE_SKIP_BUILD_RPATH FALSE)
    if(APPLE)
        # Enable RPATH support for generated binaries
        set(CMAKE_MACOSX_RPATH TRUE)
    else()
        set(CMAKE_BUILD_RPATH_USE_ORIGIN TRUE)
    endif()
    # when building, don't use the install RPATH already
    # (but later on when installing)
    set(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE)
    # Add the automatically determined parts of the RPATH
    # which point to directories outside the build tree to the install RPATH
    set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

    if(APPLE)
        set(CMAKE_INSTALL_RPATH "@loader_path;@loader_path/lib")
    else()
        set(CMAKE_INSTALL_RPATH "$ORIGIN;$ORIGIN/lib")
    endif()
    # PIC
    set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
endif()

# otool -l lib/libexample_debug.dylib | grep LC_RPATH -A2
# otool -l example_test | grep LC_RPATH -A2
