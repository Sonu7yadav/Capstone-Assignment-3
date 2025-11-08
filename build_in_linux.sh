#!/bin/bash
# Build script that copies project to Linux filesystem to avoid permission issues

echo "========================================="
echo "System Monitor Tool - Build Script"
echo "========================================="
echo ""

# Copy project to Linux filesystem to avoid Windows filesystem permission issues
LINUX_BUILD_DIR="$HOME/system_monitor_build"

echo "Step 1: Copying project to Linux filesystem..."
mkdir -p "$LINUX_BUILD_DIR"
cp -r /mnt/c/Users/DELL/wipro/* "$LINUX_BUILD_DIR/" 2>/dev/null
cp -r /mnt/c/Users/DELL/wipro/.* "$LINUX_BUILD_DIR/" 2>/dev/null

cd "$LINUX_BUILD_DIR"

echo "Step 2: Creating build directory..."
mkdir -p build
cd build

echo "Step 3: Configuring with CMake..."
cmake ..
if [ $? -ne 0 ]; then
    echo "ERROR: CMake configuration failed!"
    exit 1
fi

echo ""
echo "Step 4: Building project..."
make
if [ $? -ne 0 ]; then
    echo "ERROR: Build failed!"
    exit 1
fi

echo ""
echo "Step 5: Checking executable..."
if [ -f "system_monitor" ]; then
    echo "✓ SUCCESS! Executable created:"
    ls -lh system_monitor
    echo ""
    echo "========================================="
    echo "Build completed successfully!"
    echo "========================================="
    echo ""
    echo "Executable location: $LINUX_BUILD_DIR/build/system_monitor"
    echo ""
    echo "To run the monitor:"
    echo "  cd $LINUX_BUILD_DIR/build"
    echo "  ./system_monitor"
    echo ""
    echo "Or press Enter to run it now..."
    read
    ./system_monitor
else
    echo "ERROR: Executable not found!"
    exit 1
fi

