# 🚀 START HERE - How to Test Your System Monitor

## ✅ Good News!
Your project is **100% ready** - all files are in place:
- ✅ 5 source files (.cpp)
- ✅ 4 header files (.h)
- ✅ All configuration files

## 🎯 To Test It, You Need WSL Ubuntu

Since this is a **Linux project**, you need to run it in WSL (Windows Subsystem for Linux).

### Quick Start (3 Steps):

#### Step 1: Install WSL Ubuntu
```powershell
# Open PowerShell as Administrator, then run:
wsl --install -d Ubuntu
```
⏱️ Takes 5-10 minutes, may need restart

#### Step 2: Open Ubuntu and Build
```bash
# After Ubuntu opens, run:
cd /mnt/c/Users/DELL/wipro
sudo apt-get update
sudo apt-get install -y cmake build-essential
mkdir -p build && cd build
cmake ..
make
```

#### Step 3: Run It!
```bash
./system_monitor
```

## 📺 What You'll See

When it works, you'll see:
- Real-time CPU usage
- Memory statistics  
- List of all running processes
- Updates every second
- Interactive controls

## 🎮 Test These Keys:
- `s` = Sort by CPU
- `m` = Sort by Memory  
- `p` = Pause/Resume
- `r` = Refresh
- `q` = Quit

## 📚 Detailed Guides

- **HOW_TO_TEST.md** - Complete step-by-step guide
- **TEST_GUIDE.md** - Troubleshooting and verification
- **QUICK_TEST.md** - Quick reference

## ⚡ Quick Verification (Right Now)

You can verify your project structure is correct:

```powershell
# Check files exist
Get-ChildItem src\*.cpp
Get-ChildItem include\*.h
```

✅ If you see 5 .cpp files and 4 .h files, you're ready to build!

## 🆘 Common First-Time Issues

**"WSL not installed"**
→ Run: `wsl --install -d Ubuntu` (as Administrator)

**"CMake not found"**  
→ Run: `sudo apt-get install cmake build-essential`

**"Permission denied"**
→ Make sure you're in WSL, not PowerShell

## 🎉 Success = You'll See This:

```
═══════════════════════════════════════════════════════════════════════════════
                          SYSTEM MONITOR TOOL                                  
═══════════════════════════════════════════════════════════════════════════════
CPU Usage: 12.5%  |  Memory: 2.1 GB / 8.0 GB (26.2%)  |  Uptime: 1d 3h 15m

PID     USER    CPU%    MEM%    MEMORY    S    COMMAND
───────────────────────────────────────────────────────────────────────────────
  1234  dell    5.2     2.1     168 MB    R    /usr/bin/firefox
  ...
```

**That's it! Your project is ready to test! 🚀**

