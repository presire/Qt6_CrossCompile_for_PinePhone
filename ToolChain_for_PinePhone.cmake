cmake_minimum_required(VERSION 3.18)
include_guard(GLOBAL)

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Set path to PinePhone's system root.
set(TARGET_SYSROOT "/Path/to/PinePhone's System Root")
set(CMAKE_SYSROOT ${TARGET_SYSROOT})

# Set pkg-config.
set(ENV{PKG_CONFIG_PATH}        ${TARGET_SYSROOT}/usr/lib/pkgconfig)
set(ENV{PKG_CONFIG_LIBDIR}      ${TARGET_SYSROOT}/usr/lib/pkgconfig:${TARGET_SYSROOT}/usr/share/pkgconfig)
set(ENV{PKG_CONFIG_SYSROOT_DIR} ${CMAKE_SYSROOT})

# Set path to AArch64 cross compiler.
set(CMAKE_C_COMPILER    "/Path/to/GCC ToolChain/bin/aarch64-unknown-linux-gnu-gcc")
set(CMAKE_CXX_COMPILER  "/Path/to/G++ ToolChain/bin/aarch64-unknown-linux-gnu-g++")

set(CMAKE_C_FLAGS   "${CMAKE_CXX_FLAGS} -fPIC -Wl,-rpath-link,${TARGET_SYSROOT}/usr/lib -L${TARGET_SYSROOT}/usr/lib")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC -Wl,-rpath-link,${TARGET_SYSROOT}/usr/lib -L${TARGET_SYSROOT}/usr/lib")

set(QT_COMPILER_FLAGS           "-march=armv8-a -mtune=cortex-a53")
set(QT_COMPILER_FLAGS_RELEASE   "-O3")
set(QT_LINKER_FLAGS             "-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_THREAD_LIBS_INIT "-lrt -lpthread -ldl")
set(CMAKE_HAVE_THREADS_LIBRARY 1)
set(CMAKE_USE_WIN32_THREADS_INIT 0)
set(CMAKE_USE_PTHREADS_INIT 1)
set(THREADS_PREFER_PTHREAD_FLAG ON)
