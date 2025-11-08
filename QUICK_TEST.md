# Quick Testing Guide

## Current Situation
- ✅ WSL is installed on your system
- ❌ WSL distribution (like Ubuntu) is not installed yet
- ✅ Project code is ready

## Option 1: Install WSL Distribution (Recommended)

### Step 1: Install Ubuntu (or another Linux distribution)
```powershell
# List available distributions
wsl --list --online

# Install Ubuntu (most common)
wsl --install -d Ubuntu

# Or install a specific version
wsl --install -d Ubuntu-22.04
```

### Step 2: After installation, open WSL
```powershell
wsl
```

### Step 3: In WSL, navigate to project and build
```bash
# Navigate to Windows drive
cd /mnt/c/Users/DELL/wipro

# Install build tools (first time only)
sudo apt-get update
sudo apt-get install -y cmake build-essential

# Build the project
mkdir -p build
cd build
cmake ..
make

# Run the monitor
./system_monitor
```

## Option 2: Test Code Compilation on Windows (Limited)

Even though the full functionality won't work on Windows, we can test if the code compiles:

### Using Visual Studio or MinGW:
```powershell
# If you have Visual Studio installed
cd build
cmake .. -G "Visual Studio 17 2022"
cmake --build .

# Or with MinGW
cmake .. -G "MinGW Makefiles"
cmake --build .
```

**Note:** The program will compile but won't work fully on Windows because it needs `/proc` filesystem.

## Option 3: Use Online Linux Environment

You can also test using:
- **GitHub Codespaces** (free tier available)
- **Replit** (online IDE with Linux)
- **Any Linux VM** (VirtualBox, VMware)

## What Success Looks Like

When the monitor runs successfully, you should see:

```
═══════════════════════════════════════════════════════════════════════════════
                          SYSTEM MONITOR TOOL                                  
═══════════════════════════════════════════════════════════════════════════════
CPU Usage: 12.5%  |  Memory: 2.1 GB / 8.0 GB (26.2%)  |  Uptime: 1d 3h 15m
Load Average: 0.35, 0.42, 0.38

PID     USER                 CPU%    MEM%      MEMORY      S    COMMAND
───────────────────────────────────────────────────────────────────────────────
   1234 user                 5.2     2.1       168 MB     R    /usr/bin/firefox
   5678 user                 3.1     1.5       120 MB     S    /usr/bin/code
   ...
───────────────────────────────────────────────────────────────────────────────
Press 'q' to quit, 's' to sort by CPU, 'm' to sort by Memory, 'k' to kill, 'p' to pause
```

## Quick Verification Commands

### Check if code structure is correct:
```powershell
# Check all source files exist
Get-ChildItem -Recurse -Filter *.cpp | Select-Object Name
Get-ChildItem -Recurse -Filter *.h | Select-Object Name

# Check CMakeLists.txt
Get-Content CMakeLists.txt
```

### Verify file structure:
```powershell
tree /F /A
```

## Next Steps

1. **Install WSL Ubuntu** (takes 5-10 minutes):
   ```powershell
   wsl --install -d Ubuntu
   ```

2. **Wait for installation** and restart if prompted

3. **Open WSL** and follow the build steps above

4. **Run the monitor** and test all features

## Troubleshooting

### WSL Installation Issues:
- Make sure Windows features are enabled: "Virtual Machine Platform" and "Windows Subsystem for Linux"
- Restart computer after enabling features
- Run PowerShell as Administrator

### Build Issues:
- Make sure `cmake` and `g++` are installed in WSL
- Check you're in the correct directory
- Verify all source files are present

### Runtime Issues:
- Terminal must be at least 80x24 characters
- Make sure you're running in a terminal that supports ANSI colors
- Check `/proc` filesystem is accessible (should be automatic in WSL)

