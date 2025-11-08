# How to Test Your System Monitor Tool

## ✅ Current Status
- ✅ All source files are present (5 .cpp files)
- ✅ All header files are present (4 .h files)
- ✅ Project structure is complete
- ⚠️ Need WSL Ubuntu to run (Linux project)

## 🚀 Step-by-Step Testing Guide

### Step 1: Install WSL Ubuntu (One-time setup)

Open PowerShell **as Administrator** and run:

```powershell
# Check available distributions
wsl --list --online

# Install Ubuntu
wsl --install -d Ubuntu
```

**Note:** This will:
- Download Ubuntu (about 500MB)
- Install it
- May require a computer restart
- Takes 5-10 minutes

### Step 2: After Installation

1. **Restart your computer** if prompted
2. **Open Ubuntu** from Start Menu (or type `wsl` in PowerShell)
3. **Set up Ubuntu** (create username and password when prompted)

### Step 3: Build the Project in WSL

Once Ubuntu is open, run these commands:

```bash
# Navigate to your project (Windows files are in /mnt/c/)
cd /mnt/c/Users/DELL/wipro

# Install build tools (first time only)
sudo apt-get update
sudo apt-get install -y cmake build-essential

# Build the project
mkdir -p build
cd build
cmake ..
make
```

**Expected output:**
```
-- The CXX compiler identification is GNU 11.x.x
-- Configuring done
-- Generating done
-- Build files have been written to: /mnt/c/Users/DELL/wipro/build
[ 16%] Building CXX object CMakeFiles/system_monitor.dir/src/main.cpp.o
[ 33%] Building CXX object CMakeFiles/system_monitor.dir/src/system_monitor.cpp.o
...
[100%] Built target system_monitor
```

### Step 4: Run the Monitor

```bash
# Run the executable
./system_monitor
```

**What you should see:**
- Screen clears
- Header with "SYSTEM MONITOR TOOL"
- CPU usage percentage
- Memory usage (used/total)
- System uptime
- List of running processes with:
  - PID, USER, CPU%, MEM%, MEMORY, STATE, COMMAND
- Updates every second

### Step 5: Test Features

While the monitor is running, test these keys:

1. **Press `s`** - Processes should sort by CPU usage (highest first)
2. **Press `m`** - Processes should sort by memory usage (highest first)
3. **Press `p`** - Updates should pause (you'll see [PAUSED] in footer)
4. **Press `p` again** - Updates should resume
5. **Press `r`** - Should force immediate refresh
6. **Press `q`** - Should exit cleanly

## 🎯 Success Indicators

### ✅ Build Success:
- No compilation errors
- Executable `system_monitor` is created
- File size should be around 50-100 KB

### ✅ Run Success:
- Monitor starts without errors
- Header displays correctly
- Process list shows running processes
- CPU and memory stats are displayed
- Updates happen automatically
- Keyboard controls work

### ❌ Common Issues:

**"CMake not found"**
```bash
sudo apt-get install cmake
```

**"g++ not found"**
```bash
sudo apt-get install build-essential
```

**"Permission denied"**
```bash
chmod +x system_monitor
```

**"No such file: /proc/stat"**
- You're not in WSL/Linux
- Make sure you're running in Ubuntu terminal

## 📊 What the Output Should Look Like

```
═══════════════════════════════════════════════════════════════════════════════
                          SYSTEM MONITOR TOOL                                  
═══════════════════════════════════════════════════════════════════════════════
CPU Usage: 12.5%  |  Memory: 2.1 GB / 8.0 GB (26.2%)  |  Uptime: 1d 3h 15m
Load Average: 0.35, 0.42, 0.38

PID     USER                 CPU%    MEM%      MEMORY      S    COMMAND
───────────────────────────────────────────────────────────────────────────────
   1234 dell                 5.2     2.1       168 MB     R    /usr/bin/firefox
   5678 dell                 3.1     1.5       120 MB     S    /usr/bin/code
   9012 dell                 2.5     1.2        96 MB     S    /usr/bin/gnome-terminal
   ...
───────────────────────────────────────────────────────────────────────────────
Press 'q' to quit, 's' to sort by CPU, 'm' to sort by Memory, 'k' to kill, 'p' to pause
```

## 🔍 Quick Verification (Without Running)

Even without WSL, you can verify the code structure:

```powershell
# Run the verification script
.\verify_project.ps1

# Check file counts
(Get-ChildItem -Recurse -Filter *.cpp).Count  # Should be 5
(Get-ChildItem -Recurse -Filter *.h).Count    # Should be 4

# Check CMakeLists.txt exists
Test-Path CMakeLists.txt  # Should be True
```

## 📝 Testing Checklist

- [ ] WSL Ubuntu installed
- [ ] Build tools installed (cmake, g++)
- [ ] Project builds successfully
- [ ] Executable created
- [ ] Monitor starts and displays header
- [ ] Process list is shown
- [ ] CPU/Memory stats are displayed
- [ ] Updates happen automatically
- [ ] Sort by CPU works (press 's')
- [ ] Sort by Memory works (press 'm')
- [ ] Pause works (press 'p')
- [ ] Exit works (press 'q')

## 🆘 Need Help?

If you encounter issues:
1. Make sure you're in WSL Ubuntu (not PowerShell)
2. Check you're in the right directory: `/mnt/c/Users/DELL/wipro`
3. Verify all files exist: `ls -la src/` and `ls -la include/`
4. Check build errors carefully
5. Make sure terminal is large enough (at least 80x24)

## 🎉 Once It Works

When everything is working:
- You'll see real-time system information
- Process list updates every second
- You can sort and interact with processes
- The monitor behaves like the `top` command

**Congratulations! Your System Monitor Tool is working! 🎊**

