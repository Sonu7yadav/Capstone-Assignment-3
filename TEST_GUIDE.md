# Testing Guide - System Monitor Tool

## Prerequisites

This project requires **Linux** or **WSL (Windows Subsystem for Linux)** to run properly because it uses the `/proc` filesystem which is Linux-specific.

## Option 1: Test Using WSL (Recommended for Windows)

### Step 1: Check if WSL is installed
```powershell
wsl --list
```

If WSL is not installed, install it:
```powershell
wsl --install
```

### Step 2: Open WSL and navigate to project
```powershell
# In PowerShell
wsl

# In WSL terminal
cd /mnt/c/Users/DELL/wipro
```

### Step 3: Build the project
```bash
# Make test script executable
chmod +x test_project.sh

# Run the test script
./test_project.sh
```

Or build manually:
```bash
mkdir -p build
cd build
cmake ..
make
```

### Step 4: Run the monitor
```bash
./system_monitor
```

## Option 2: Test on Native Linux

If you have a Linux machine or VM:

```bash
# Navigate to project directory
cd /path/to/wipro

# Build
mkdir -p build
cd build
cmake ..
make

# Run
./system_monitor
```

## What to Expect When Running

### Successful Run:
1. **Screen clears** and shows a header with:
   - System Monitor Tool title
   - CPU Usage percentage
   - Memory usage (used/total with percentage)
   - System uptime
   - Load average

2. **Process list** displays with columns:
   - PID (Process ID)
   - USER (Process owner)
   - CPU% (CPU usage percentage)
   - MEM% (Memory usage percentage)
   - MEMORY (Memory in KB/MB/GB)
   - S (Process state: R=running, S=sleeping, etc.)
   - COMMAND (Process command line)

3. **Updates every 1 second** automatically

### Keyboard Controls to Test:
- Press `s` - Should sort processes by CPU usage
- Press `m` - Should sort processes by memory usage
- Press `p` - Should pause/resume updates
- Press `r` - Should force immediate refresh
- Press `q` or `ESC` - Should exit the monitor

## Troubleshooting

### Error: "CMake not found"
```bash
# Install CMake (Ubuntu/Debian)
sudo apt-get update
sudo apt-get install cmake build-essential
```

### Error: "Permission denied" when reading /proc
- This should not happen for reading, but if it does, check file permissions
- For killing processes, you may need sudo (but reading should work without it)

### Error: "No such file or directory: /proc/stat"
- You're not on Linux/WSL
- The project requires Linux filesystem

### Build Errors:
1. **Compiler not found**: Install build-essential
   ```bash
   sudo apt-get install build-essential
   ```

2. **Missing headers**: Install development packages
   ```bash
   sudo apt-get install libc6-dev
   ```

### Runtime Errors:
1. **Terminal too small**: Resize your terminal window (minimum 80x24)

2. **ANSI colors not working**: 
   - Check terminal supports ANSI escape codes
   - Try a different terminal (Windows Terminal, PowerShell, etc.)

## Quick Test Commands

```bash
# Quick build and run
cd build && cmake .. && make && ./system_monitor

# Check if executable was created
ls -lh build/system_monitor

# Check file permissions
file build/system_monitor

# Run with output redirection for debugging
./system_monitor 2>&1 | tee monitor_output.txt
```

## Expected Output Format

```
═══════════════════════════════════════════════════════════════════════════════
                          SYSTEM MONITOR TOOL                                  
═══════════════════════════════════════════════════════════════════════════════
CPU Usage: 15.2%  |  Memory: 2.5 GB / 8.0 GB (31.2%)  |  Uptime: 2d 5h 30m
Load Average: 0.45, 0.52, 0.48

PID     USER                 CPU%    MEM%      MEMORY      S    COMMAND
───────────────────────────────────────────────────────────────────────────────
1234    user                 5.2     2.1       168 MB     R    /usr/bin/firefox
5678    user                 3.1     1.5       120 MB     S    /usr/bin/code
...
───────────────────────────────────────────────────────────────────────────────
Press 'q' to quit, 's' to sort by CPU, 'm' to sort by Memory, 'k' to kill, 'p' to pause
```

## Verification Checklist

- [ ] Project builds without errors
- [ ] Executable `system_monitor` is created
- [ ] Monitor starts and displays header
- [ ] Process list is displayed
- [ ] CPU and memory statistics are shown
- [ ] Processes update every second
- [ ] Keyboard controls work (s, m, p, r, q)
- [ ] Can exit cleanly with 'q' or ESC

## Need Help?

If you encounter issues:
1. Check you're running in WSL or Linux
2. Verify all dependencies are installed
3. Check terminal size (should be at least 80x24)
4. Review error messages carefully
5. Try running with verbose output

