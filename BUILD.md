# Building the System Monitor Tool

## Prerequisites

- **Linux/Unix system** (or WSL on Windows)
- CMake 3.10 or higher
- C++11 compatible compiler (g++, clang++)
- Access to `/proc` filesystem (Linux)

## Building on Linux/WSL

```bash
# Create build directory
mkdir -p build
cd build

# Configure with CMake
cmake ..

# Build the project
make

# Run the executable
./system_monitor
```

## Building on Windows (with WSL)

1. Open WSL (Windows Subsystem for Linux)
2. Navigate to the project directory
3. Follow the Linux build instructions above

## Building on Windows (Native - Limited Support)

**Note:** Native Windows build has limited functionality as the project uses Linux-specific `/proc` filesystem.

```bash
# Create build directory
mkdir build
cd build

# Configure with CMake
cmake ..

# Build (using Visual Studio or MinGW)
cmake --build .

# Run
.\system_monitor.exe
```

## Troubleshooting

- **CMake not found**: Install CMake from https://cmake.org/
- **Compiler not found**: Install build-essential (Linux) or Visual Studio (Windows)
- **Permission denied**: Ensure you have read access to `/proc` filesystem
- **Process killing fails**: Run with appropriate permissions (may require sudo)

