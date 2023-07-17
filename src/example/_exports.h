#pragma once

#ifdef NO_EXAMPLE_EXPORTS
    #define EXPORT_API
#elif defined(EXAMPLE_EXPORTS)
    #if _WIN32
        #define EXPORT_API __declspec(dllexport)
    #elif defined(__APPLE__) || (defined(__GNUC__) && (__GNUC__ >= 4))
        #define EXPORT_API __attribute__((visibility("default")))
    #else
        #define EXPORT_API
    #endif
#else
    #if defined(_WIN32)
        #define EXPORT_API __declspec(dllimport)
    #else
        #define EXPORT_API
    #endif
#endif

#ifndef _WIN32
    #ifndef __cdecl
        #ifdef cdecl
            #define __cdecl __attribute__((cdecl))
        #else
            #define __cdecl
        #endif // cdecl
    #endif // !__cdecl
#endif // _WIN32
