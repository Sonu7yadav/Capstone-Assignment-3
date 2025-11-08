#!/bin/bash
# Quick build script - copies to Linux filesystem and builds

echo "Copying project to Linux filesystem..."
cp -r /mnt/c/Users/DELL/wipro ~/wipro_build
cd ~/wipro_build

echo "Building..."
mkdir -p build && cd build
cmake .. && make

if [ -f "system_monitor" ]; then
    echo "✓ Build successful! Running monitor..."
    ./system_monitor
else
    echo "✗ Build failed!"
    exit 1
fi

