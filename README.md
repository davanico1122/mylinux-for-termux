
# MyLinux - Advanced Arch Linux Environment for Termux

<div align="center">

```
███╗   ███╗██╗   ██╗██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗
████╗ ████║╚██╗ ██╔╝██║     ██║████╗  ██║██║   ██║╚██╗██╔╝
██╔████╔██║ ╚████╔╝ ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝ 
██║╚██╔╝██║  ╚██╔╝  ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗ 
██║ ╚═╝ ██║   ██║   ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗
╚═╝     ╚═╝   ╚═╝   ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝
```

A lightweight, feature-rich Arch Linux environment for Termux  
**Created by: Davanico**
</div>

---

## 📄 Overview
MyLinux transforms your Android device into a powerful Linux workstation by installing a fully-featured Arch Linux environment within Termux using **proot-distro**. No root access required!

## ✨ Key Features

- ✅ One-click installation - Fully automated setup process  
- 🧭 Interactive menu system - Beautiful CLI interface with 8+ integrated tools  
- 🛠️ Pre-installed tools - Network scanning, system monitoring, and development tools  
- 🌈 Colorful interface - ASCII banners with figlet and lolcat  
- 📟 System information - Automatic neofetch display on login  
- ♻️ Auto-updater - Keep all tools current with one command  
- 🧹 Uninstaller included - Clean removal when needed  

## 📦 Requirements

- Android device with Termux installed  
- 2GB+ free storage (recommended)  
- Internet connection for package downloads  
- No root access required  

## ⚡ Quick Installation

### Method 1: Direct Download & Execute
```bash
curl -fsSL https://raw.githubusercontent.com/[your-username]/mylinux/main/install-mylinux.sh | bash
```

### Method 2: Manual Installation
```bash
git clone https://github.com/[your-username]/mylinux.git
cd mylinux
chmod +x install-mylinux.sh
./install-mylinux.sh
```

### Method 3: Direct Download
```bash
wget https://raw.githubusercontent.com/[your-username]/mylinux/main/install-mylinux.sh
chmod +x install-mylinux.sh
./install-mylinux.sh
```

## 📥 What Gets Installed

### 🧰 System Tools
- htop, neofetch, tree, nano/vim, git

### 🌐 Network Tools
- nmap, curl/wget, openssh, whois, net-tools, dnsutils

### 💻 Development Tools
- python, pip, base-devel

### 🎨 Visual Tools
- figlet, lolcat, speedtest-cli

## 🎛️ Interactive Menu Features

Once installed, MyLinux provides an interactive menu system with the following options:

```
┌─────────────────────────────────────────────────────────────────┐
│                        MyLinux Menu                             │
├─────────────────────────────────────────────────────────────────┤
│ [1]  Network Scanner (Nmap)                                     │
│ [2]  Internet Speedtest                                         │
│ [3]  Display System Info                                        │
│ [4]  Update All Tools                                           │
│ [5]  Exit Menu                                                  │
└─────────────────────────────────────────────────────────────────┘
```

> 🟢 Tip: You can also type `menu` anytime inside Arch Linux to bring this back!

## 🧑‍💻 How to Use MyLinux

After installation completes:

```bash
source ~/.bashrc
mylinux
# or use
ml
```

## 🧼 How to Uninstall MyLinux

```bash
proot-distro remove archlinux
rm ~/mylinux
sed -i '/alias mylinux/d' ~/.bashrc
sed -i '/alias ml=/d' ~/.bashrc
```

## 🔐 No Root Needed
This system runs entirely in user space using **proot-distro**. Your Android OS remains untouched.

## 🤝 Contributing

Pull requests are welcome! Feel free to submit feature ideas, improvements, or report bugs.

- Fork this repo
- Make your changes
- Open a PR (Pull Request)

## 🪪 License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT). You are free to modify, distribute, and use for both personal and commercial purposes.

## 🙏 Credits

Made with ❤️ by **Davanico**  
Inspired by Termux, Arch Linux, and the open source community.

## 📁 GitHub Repo Structure Suggestion

```
mylinux/
├── install-mylinux.sh        # Main installer script
├── README.md                 # This file
├── LICENSE
├── assets/                   # Optional images or ASCII logos
└── .github/                  # Optional workflows for CI
```
