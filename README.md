# MyLinux - Lightweight Arch Linux Environment for Termux

![MyLinux Banner](https://i.imgur.com/5y3fX9a.png)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Android-green.svg)](https://android.com)
[![Termux](https://img.shields.io/badge/Requires-Termux-blue.svg)](https://termux.com)

##  Table of Contents

- [Introduction](#-introduction)
- [Key Features](#-key-features)
- [System Requirements](#-system-requirements)
- [Installation Guide](#-installation-guide)
- [Usage Guide](#-usage-guide)
- [File Structure](#-file-structure)
- [FAQ](#-frequently-asked-questions)
- [Contributing](#-contributing)
- [License](#️-license)
- [Credits](#-credits)
- [Important Links](#-important-links)

##  Introduction

MyLinux is a lightweight Arch Linux environment specifically designed for Termux. With this project, you can:

-  Run a full Arch Linux distribution on your Android device
-  Access over 50 system and network tools directly
-  Enjoy an intuitive and touch-friendly user interface
-  Develop Linux applications directly from your phone

This project uses proot-distro to provide an isolated Linux environment without requiring root access.

##  Key Features

### System Core
| Feature | Description |
|---------|-------------|
| **Arch Linux** | Complete Arch Linux ARM environment |
| **proot-distro** | Rootless container technology |
| **Auto-update** | Automatic system updates |

### User Interface
| Feature | Description |
|---------|-------------|
| **Interactive Menu** | TUI with easy navigation |
| **Neofetch** | Stylish system information display |
| **Lolcat & Figlet** | Custom colorful banners |

### Network Tools
| Tool | Description |
|------|-------------|
| **Nmap** | Professional network scanner |
| **Speedtest-cli** | Internet speed testing |
| **Net-tools** | Essential network utilities |
| **Whois** | Domain information lookup |

### System Tools
| Tool | Description |
|------|-------------|
| **Htop** | Interactive process monitor |
| **Tree** | Hierarchical file explorer |
| **Git** | Distributed version control |
| **Base-devel** | Basic development tools |

### Customization
| Feature | Description |
|---------|-------------|
| **Custom Fonts** | 100+ Figlet font choices |
| **Useful Aliases** | Practical command shortcuts |
| **Auto-start** | Automatic menu on login |

##  System Requirements

### Device Requirements:
- **OS**: Android 8.0 (Oreo) or newer
- **Storage**: Minimum 2GB free space
- **Internet**: Stable internet connection

### Application Requirements:
- **Termux**: Latest version from F-Droid
- **External Storage**: Enabled (`termux-setup-storage`)
- **Termux Repos**: Official repositories updated (`pkg update`)

### Recommendations:
- Device with 4GB+ RAM for optimal performance
- External keyboard for better experience

##  Installation Guide

### Method 1: Automatic Installation (Recommended)

```bash
# Download and run the installation script
curl -L https://raw.githubusercontent.com/yourusername/mylinux/main/installer.sh | bash
```

The installation process will:
1. Update Termux packages
2. Install proot-distro
3. Download Arch Linux image
4. Configure environment
5. Install all required tools
6. Create interactive menu
7. Set up launcher

### Method 2: Manual Installation

```bash
# 1. Clone the repository
git clone https://github.com/davanico1122/mylinux-for-termux.git

# 2. Navigate to directory
cd mylinux

# 3. Make installer executable
chmod +x installer.sh

# 4. Run installation
./installer.sh
```

### Installation Process

1. **System Check**: Verify requirements
2. **Termux Update**: Update all Termux packages
3. **Proot Installation**: Install proot-distro
4. **Arch Download**: Download Arch Linux image (~300MB)
5. **Environment Setup**: Configure base system
6. **Tool Installation**: Install all tools (~15 minutes)
7. **Menu Configuration**: Create interactive menu system
8. **Finalization**: Create launcher and uninstaller

 **Estimated Installation Time**: 20-30 minutes

##  Usage Guide

### Starting MyLinux

```bash
# From Termux, run:
mylinux
```

### Main Menu Navigation

```
┌─────────────────────────────────────────────────────────────────┐
│                        MyLinux Menu                        │
├─────────────────────────────────────────────────────────────────┤
│ [1]  Network Scanner (Nmap)                              │
│ [2]  Internet Speed Test                                 │
│ [3]  System Information                                  │
│ [4]  Update All Tools                                    │
│ [5]   System Tools Menu                                  │
│ [6]  Network Tools Menu                                  │
│ [7]  File Manager (Tree View)                            │
│ [8]  Customize Banner                                    │
│ [0]  Exit Menu                                           │
└─────────────────────────────────────────────────────────────────┘
```

### Important Commands

| Command | Description | Example |
|---------|-------------|---------|
| `menu` | Open interactive menu | `menu` |
| `update` | Update system and tools | `update` |
| `ll` | List files in detail | `ll` |
| `extract` | Extract archives | `extract file.zip` |
| `scan` | Network scanning | `scan 192.168.1.0/24` |
| `speedtest` | Internet speed test | `speedtest` |
| `fontlist` | List Figlet fonts | `fontlist` |

### System Tools Menu

```
[1]  Process Monitor (htop)
[2]  Disk Usage
[3]  Memory Usage
[4]  System Update
[5]  Clean System
```

### Network Tools Menu

```
[1]  Quick Host Scan
[2]  Port Scan
[3]  DNS Lookup
[4]  Whois Lookup
[5]  Network Statistics
```

##  File Structure

```
mylinux/
├── installer.sh             # Main installation script
├── modules/                 # Functional modules
│   ├── banner.sh            # Banner display functions
│   ├── requirements.sh      # System requirements check
│   ├── proot_install.sh     # proot-distro installation
│   ├── arch_install.sh      # Arch Linux installation
│   ├── environment.sh       # Environment setup
│   ├── menu_system.sh       # Interactive menu system
│   ├── autologin.sh         # Auto-login configuration
│   ├── launcher.sh          # Launcher creation
│   ├── uninstaller.sh       # Uninstall script
│   └── finalize.sh          # Finalization process
├── config/                  # Configuration files
│   └── mylinux_info.txt     # System information
└── README.md                # Documentation
```

##  Frequently Asked Questions

###  How to update MyLinux?

```bash
# Inside MyLinux environment:
update
# Or through menu [4]  Update All Tools
```

###  Can I run GUI applications?

Yes! Follow these steps:
1. Install XServer XSDL or Termux:X11
2. In MyLinux, install GUI packages: `sudo pacman -S xfce4`
3. Run with: `startxfce4`

###  How to install additional packages?

```bash
# Inside MyLinux:
install package_name
# Example: install firefox
```

###  Do I need root access?

No! MyLinux is designed to work without root access using proot technology.

###  How to uninstall MyLinux?

```bash
# From Termux:
uninstall-mylinux
```

##  Contributing

Contributions are welcome! Follow this workflow:

1. **Fork** the repository
2. **Create** a feature branch:
   ```bash
   git checkout -b feature/feature-name
   ```
3. **Commit** your changes:
   ```bash
   git commit -m 'Add new feature'
   ```
4. **Push** to branch:
   ```bash
   git push origin feature/feature-name
   ```
5. **Submit** a pull request

### Contribution Guidelines

- Use descriptive names for variables and functions
- Add comments for complex code
- Test changes on Android devices before PR
- Follow existing code style
- Update documentation when necessary

##  License

MyLinux is released under the MIT License:

```
Copyright (c) 2023 Davanico

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

##  Credits

- **Davanico**: Creator and main developer
- **Termux Community**: For the amazing Android environment
- **proot-distro Developers**: For rootless container solution
- **Arch Linux ARM**: For stable base system
- **Open Source Contributors**: For tools used in this project

##  Important Links

- [GitHub Repository](https://github.com/davanico1122/mylinux-for-termux)
- [Termux Documentation](https://termux.dev)
- [Arch Linux ARM](https://archlinuxarm.org)
- [proot-distro Guide](https://github.com/termux/proot-distro)

---

**Enjoy the power of Arch Linux in your pocket!** 

**Give us a star on GitHub if you like this project!** 

---

### Support

If you encounter any issues or have questions:
- Open an [issue](https://github.com/davanico1122/mylinux-for-termux/issues) on GitHub
- Join our [community discussions](https://github.com/davanico1122/mylinux-for-termux/discussions)

### Roadmap

- [ ] GUI desktop environment integration
- [ ] Package manager improvements  
- [ ] Performance optimizations
- [ ] Additional development tools
- [ ] Multi-language support
- [ ] Advanced networking features

Made with  for the Android Linux community
