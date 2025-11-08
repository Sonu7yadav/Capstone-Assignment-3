# Solution: Build on Linux Filesystem

## Problem
- "Operation not permitted" errors when building on `/mnt/c/` (Windows filesystem)
- WSL has permission issues writing to Windows drives

## Solution
Build on Linux native filesystem instead of Windows filesystem.

## Quick Fix - Run These Commands in WSL:

```bash
# Copy project to Linux filesystem
cp -r /mnt/c/Users/DELL/wipro ~/wipro_build

# Navigate to copied project
cd ~/wipro_build

# Build
mkdir -p build && cd build
cmake ..
make

# Run
./system_monitor
```

## Or Use the Automated Script:

```bash
# Make script executable
chmod +x /mnt/c/Users/DELL/wipro/build_in_linux.sh

# Run it
/mnt/c/Users/DELL/wipro/build_in_linux.sh
```

This will automatically:
1. Copy project to ~/system_monitor_build
2. Build there (no permission issues)
3. Run the executable

