# System Monitor Tool - Capstone Project (Assignment 3)

A console-based system monitor tool in C++ that displays real-time information about system processes, memory usage, and CPU load, similar to the 'top' command.

## Features

- Real-time system monitoring
- Process list with CPU and memory usage
- Process sorting by CPU and memory usage
- Process killing functionality
- Interactive UI with keyboard controls
- System statistics (CPU load, memory usage, uptime)

## Project Structure

```
.
├── src/
│   ├── main.cpp              # Main entry point
│   ├── system_monitor.cpp    # Main monitor class
│   ├── system_info.cpp       # System data gathering
│   ├── process_info.cpp      # Process information handling
│   └── ui.cpp                # User interface and display
├── include/
│   ├── system_monitor.h
│   ├── system_info.h
│   ├── process_info.h
│   └── ui.h
├── CMakeLists.txt            # Build configuration
└── README.md
```

## Day-wise Implementation Plan

### Day 1: Design UI layout and gather system data using system calls
- [x] Project structure setup
- [x] System data gathering framework
- [x] Basic UI layout design
- [x] CPU information collection
- [x] Memory information collection

### Day 2: Display process list with CPU and memory usage
- [x] Process enumeration
- [x] Process CPU usage calculation
- [x] Process memory usage calculation
- [x] Display formatted process list
- [x] Real-time updates

### Day 3: Implement process sorting by CPU and memory usage
- [x] Sorting algorithms
- [x] Sort by CPU usage
- [x] Sort by memory usage
- [x] Toggle between sort modes
- [x] Maintain sort order during updates

### Day 4: Add functionality to kill processes
- [x] Process selection mechanism
- [x] Signal sending (SIGTERM, SIGKILL)
- [x] Permission checking
- [x] Error handling

## Building

### Linux/WSL
```bash
mkdir build
cd build
cmake ..
make
./system_monitor
```

### Windows (with MinGW or MSVC)
```bash
mkdir build
cd build
cmake ..
cmake --build .
./system_monitor.exe
```

**Note:** On Windows, some features may require adaptation to Windows API (Task Manager APIs).

## Usage

Run the system monitor:
```bash
./system_monitor
```

### Keyboard Controls
- `q` or `ESC` - Quit the monitor
- `k` - Kill selected process
- `s` - Sort by CPU usage
- `m` - Sort by memory usage
- `r` - Refresh/Update immediately
- `p` or `Enter` - Pause/Resume updates

## System Requirements

- Linux/Unix system (or WSL on Windows)
- C++11 or later
- Access to `/proc` filesystem (Linux)
- Terminal with ANSI escape code support for UI

## Notes

- This project is primarily designed for Linux/Unix systems
- Uses `/proc` filesystem for system information (Linux-specific)
- On Windows, would need to use Windows API (WMI, Performance Counters)
- Requires appropriate permissions to kill processes
