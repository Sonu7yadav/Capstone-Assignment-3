cmake_minimum_required(VERSION 3.10)
project(SystemMonitor)

# Set C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Include directories
include_directories(include)

# Source files
set(SOURCES
    src/main.cpp
    src/system_monitor.cpp
    src/system_info.cpp
    src/process_info.cpp
    src/ui.cpp
)

# Header files
set(HEADERS
    include/system_monitor.h
    include/system_info.h
    include/process_info.h
    include/ui.h
)

# Create executable
add_executable(system_monitor ${SOURCES} ${HEADERS})

# Platform-specific settings
if(WIN32)
    # Windows-specific settings
    message(STATUS "Building for Windows")
    # Windows API libraries would be linked here if needed
else()
    # Linux/Unix-specific settings
    message(STATUS "Building for Linux/Unix")
    # Link math library if needed
    target_link_libraries(system_monitor m)
endif()
