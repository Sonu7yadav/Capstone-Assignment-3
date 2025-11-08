#!/bin/bash
# Build and Test Script for System Monitor Tool

echo "========================================="
echo "Building System Monitor Tool"
echo "========================================="
echo ""

cd /mnt/c/Users/DELL/wipro/build

# Clean previous build
echo "Cleaning previous build..."
rm -rf * 2>/dev/null

# Configure with CMake
echo ""
echo "Configuring with CMake..."
cmake ..
if [ $? -ne 0 ]; then
    echo "ERROR: CMake configuration failed!"
    exit 1
fi

# Build the project
echo ""
echo "Building project..."
make
if [ $? -ne 0 ]; then
    echo "ERROR: Build failed!"
    exit 1
fi

# Check if executable exists
echo ""
echo "Checking executable..."
if [ -f "system_monitor" ]; then
    echo "✓ SUCCESS! Executable created:"
    ls -lh system_monitor
    echo ""
    echo "========================================="
    echo "Build completed successfully!"
    echo "========================================="
    echo ""
    echo "To run the monitor, execute:"
    echo "  ./system_monitor"
    echo ""
    echo "Or press Enter to run it now (will run for 5 seconds)..."
    read -t 5
    if [ $? -eq 0 ]; then
        echo "Running system monitor..."
        ./system_monitor
    fi
else
    echo "ERROR: Executable not found!"
    exit 1
fi

