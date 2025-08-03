
#!/bin/bash

# ═══════════════════════════════════════════════════════════════════════════════
# MyLinux - Lightweight Arch Linux Environment for Termux
# Advanced Installation Script v2.0
# 
# Created by: Davanico
# License: MIT
# Description: Automated installer for Arch Linux with proot-distro in Termux
# Features: Interactive menu, system tools, network utilities, and more
# ═══════════════════════════════════════════════════════════════════════════════

set -e  # Exit on any error

# Color definitions for better UI
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Animation and progress functions
show_spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

print_banner() {
    clear
    echo -e "${CYAN}"
    echo "═══════════════════════════════════════════════════════════════════════════════"
    echo "███╗   ███╗██╗   ██╗██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗"
    echo "████╗ ████║╚██╗ ██╔╝██║     ██║████╗  ██║██║   ██║╚██╗██╔╝"
    echo "██╔████╔██║ ╚████╔╝ ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝ "
    echo "██║╚██╔╝██║  ╚██╔╝  ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗ "
    echo "██║ ╚═╝ ██║   ██║   ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗"
    echo "╚═╝     ╚═╝   ╚═╝   ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝"
    echo "═══════════════════════════════════════════════════════════════════════════════"
    echo -e "${WHITE}        Advanced Arch Linux Environment for Termux v2.0"
    echo -e "${YELLOW}                    Created by: Davanico"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════════════════════${NC}"
    echo
}

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

progress_bar() {
    local duration=$1
    local message=$2
    echo -n -e "${CYAN}$message${NC}"
    for ((i=0; i<=duration; i++)); do
        echo -n "▓"
        sleep 0.1
    done
    echo -e " ${GREEN}✓${NC}"
}

check_requirements() {
    log_info "Checking system requirements..."
    
    # Check if running on Termux
    if [[ ! -d "$PREFIX" ]]; then
        log_error "This script must be run in Termux environment!"
        exit 1
    fi
    
    # Check internet connection
    if ! ping -c 1 google.com &> /dev/null; then
        log_error "Internet connection required for installation!"
        exit 1
    fi
    
    # Check available storage (minimum 2GB)
    available_space=$(df $PREFIX | awk 'NR==2 {print $4}')
    if [[ $available_space -lt 2097152 ]]; then
        log_warning "Low storage space detected. Minimum 2GB recommended."
        read -p "Continue anyway? (y/N): " -r
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
    
    log_success "System requirements check passed!"
}

update_termux() {
    log_info "Updating Termux packages..."
    {
        apt update -y && apt upgrade -y
    } &
    show_spinner $!
    log_success "Termux packages updated successfully!"
}

install_proot_distro() {
    log_info "Installing proot-distro..."
    {
        pkg install proot-distro -y
    } &
    show_spinner $!
    log_success "proot-distro installed successfully!"
}

install_arch_linux() {
    log_info "Installing Arch Linux distribution..."
    log_warning "This may take several minutes depending on your internet speed..."
    
    {
        proot-distro install archlinux
        proot-distro rename archlinux mylinux
    } &
    show_spinner $!
    
    log_success "Arch Linux installed and renamed to 'mylinux'!"
}

setup_arch_environment() {
    log_info "Setting up Arch Linux environment..."
    
    # Update Arch Linux system
    log_info "Updating Arch Linux packages..."
    proot-distro login mylinux -- bash -c "
        pacman -Syu --noconfirm
    "
    
    # Install essential packages
    log_info "Installing essential packages..."
    proot-distro login mylinux -- bash -c "
        pacman -S --noconfirm \
            nmap \
            curl \
            wget \
            git \
            python \
            python-pip \
            neofetch \
            figlet \
            htop \
            nano \
            vim \
            openssh \
            bind \
            whois \
            net-tools \
            base-devel \
            tree \
            unzip \
            zip \
            which \
            sudo
    "
    
    # Install lolcat via pip
    log_info "Installing lolcat and speedtest-cli..."
    proot-distro login mylinux -- bash -c "
        pip install lolcat speedtest-cli --break-system-packages
    "
    
    log_success "All packages installed successfully!"
}

create_interactive_menu() {
    log_info "Creating interactive menu system..."
    
    # Create the main menu script
    proot-distro login mylinux -- bash -c "
cat > /usr/local/bin/mylinux-menu << 'EOF'
#!/bin/bash

# MyLinux Interactive Menu System
# Created by: Davanico

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

show_banner() {
    clear
    echo 'mylinux' | figlet -f slant | lolcat
    echo -e \"\${CYAN}═══════════════════════════════════════════════════════════════════\${NC}\"
    echo -e \"\${WHITE}        Welcome to MyLinux - Minimalist & Fast\${NC}\"
    echo -e \"\${YELLOW}                Created by: Davanico\${NC}\"
    echo -e \"\${CYAN}═══════════════════════════════════════════════════════════════════\${NC}\"
    echo
    neofetch --ascii_distro arch_small
    echo
}

show_menu() {
    echo -e \"\${BLUE}┌─────────────────────────────────────────────────────────────────┐\${NC}\"
    echo -e \"\${BLUE}│\${WHITE}                        MyLinux Menu\${BLUE}                        │\${NC}\"
    echo -e \"\${BLUE}├─────────────────────────────────────────────────────────────────┤\${NC}\"
    echo -e \"\${BLUE}│\${NC} [1] 🔍 Network Scanner (Nmap)                              \${BLUE}│\${NC}\"
    echo -e \"\${BLUE}│\${NC} [2] 🚀 Internet Speed Test                                 \${BLUE}│\${NC}\"
    echo -e \"\${BLUE}│\${NC} [3] 📊 System Information                                  \${BLUE}│\${NC}\"
    echo -e \"\${BLUE}│\${NC} [4] 🔄 Update All Tools                                    \${BLUE}│\${NC}\"
    echo -e \"\${BLUE}│\${NC} [5] 🛠️  System Tools Menu                                  \${BLUE}│\${NC}\"
    echo -e \"\${BLUE}│\${NC} [6] 🌐 Network Tools Menu                                  \${BLUE}│\${NC}\"
    echo -e \"\${BLUE}│\${NC} [7] 📁 File Manager (Tree View)                            \${BLUE}│\${NC}\"
    echo -e \"\${BLUE}│\${NC} [8] 🎨 Customize Banner                                    \${BLUE}│\${NC}\"
    echo -e \"\${BLUE}│\${NC} [0] 🚪 Exit Menu                                           \${BLUE}│\${NC}\"
    echo -e \"\${BLUE}└─────────────────────────────────────────────────────────────────┘\${NC}\"
    echo
}

network_tools_menu() {
    clear
    echo -e \"\${CYAN}Network Tools Menu\${NC}\"
    echo -e \"\${BLUE}─────────────────────────────────────────\${NC}\"
    echo -e \"[1] 🔍 Quick Host Scan\"
    echo -e \"[2] 🔎 Port Scan\"
    echo -e \"[3] 🌐 DNS Lookup\"
    echo -e \"[4] 📡 Whois Lookup\"
    echo -e \"[5] 📊 Network Statistics\"
    echo -e \"[0] ↩️  Back to Main Menu\"
    echo
    read -p \"Select option: \" net_choice
    
    case \$net_choice in
        1)
            read -p \"Enter IP/Network (e.g., 192.168.1.0/24): \" target
            echo -e \"\${YELLOW}Scanning \$target...\${NC}\"
            nmap -sn \$target
            ;;
        2)
            read -p \"Enter target IP: \" target_ip
            read -p \"Enter port range (e.g., 1-1000): \" port_range
            echo -e \"\${YELLOW}Scanning ports \$port_range on \$target_ip...\${NC}\"
            nmap -p \$port_range \$target_ip
            ;;
        3)
            read -p \"Enter domain name: \" domain
            echo -e \"\${YELLOW}DNS lookup for \$domain...\${NC}\"
            nslookup \$domain
            ;;
        4)
            read -p \"Enter domain/IP: \" whois_target
            echo -e \"\${YELLOW}Whois lookup for \$whois_target...\${NC}\"
            whois \$whois_target
            ;;
        5)
            echo -e \"\${YELLOW}Network statistics...\${NC}\"
            netstat -tuln
            ;;
        0)
            return
            ;;
        *)
            echo -e \"\${RED}Invalid option!\${NC}\"
            ;;
    esac
    read -p \"Press Enter to continue...\"
}

system_tools_menu() {
    clear
    echo -e \"\${CYAN}System Tools Menu\${NC}\"
    echo -e \"\${BLUE}─────────────────────────────────────────\${NC}\"
    echo -e \"[1] 📊 Process Monitor (htop)\"
    echo -e \"[2] 💾 Disk Usage\"
    echo -e \"[3] 🧠 Memory Usage\"
    echo -e \"[4] 🔧 System Update\"
    echo -e \"[5] 🧹 Clean System\"
    echo -e \"[0] ↩️  Back to Main Menu\"
    echo
    read -p \"Select option: \" sys_choice
    
    case \$sys_choice in
        1)
            htop
            ;;
        2)
            df -h
            ;;
        3)
            free -h
            ;;
        4)
            echo -e \"\${YELLOW}Updating system...\${NC}\"
            pacman -Syu
            ;;
        5)
            echo -e \"\${YELLOW}Cleaning system...\${NC}\"
            pacman -Sc
            ;;
        0)
            return
            ;;
        *)
            echo -e \"\${RED}Invalid option!\${NC}\"
            ;;
    esac
    read -p \"Press Enter to continue...\"
}

while true; do
    show_banner
    show_menu
    read -p \"$(echo -e \"\${GREEN}Enter your choice [0-8]: \${NC}\")\" choice
    
    case \$choice in
        1)
            read -p \"Enter target IP/network (default: 192.168.1.0/24): \" target
            target=\${target:-192.168.1.0/24}
            echo -e \"\${YELLOW}Scanning network \$target...\${NC}\"
            nmap -sn \$target
            read -p \"Press Enter to continue...\"
            ;;
        2)
            echo -e \"\${YELLOW}Running internet speed test...\${NC}\"
            speedtest-cli
            read -p \"Press Enter to continue...\"
            ;;
        3)
            clear
            neofetch
            read -p \"Press Enter to continue...\"
            ;;
        4)
            echo -e \"\${YELLOW}Updating all tools...\${NC}\"
            pacman -Syu --noconfirm
            pip install --upgrade lolcat speedtest-cli --break-system-packages
            echo -e \"\${GREEN}All tools updated successfully!\${NC}\"
            read -p \"Press Enter to continue...\"
            ;;
        5)
            system_tools_menu
            ;;
        6)
            network_tools_menu
            ;;
        7)
            echo -e \"\${YELLOW}Current directory structure:\${NC}\"
            tree -L 3
            read -p \"Press Enter to continue...\"
            ;;
        8)
            echo -e \"\${CYAN}Available figlet fonts:\${NC}\"
            figlet -l | head -10
            read -p \"Enter font name (or press Enter for default): \" font
            if [[ -n \$font ]]; then
                echo 'mylinux' | figlet -f \$font | lolcat
            else
                echo 'mylinux' | figlet | lolcat
            fi
            read -p \"Press Enter to continue...\"
            ;;
        0)
            echo -e \"\${GREEN}Thanks for using MyLinux! Created by Davanico\${NC}\"
            break
            ;;
        *)
            echo -e \"\${RED}Invalid option! Please try again.\${NC}\"
            sleep 2
            ;;
    esac
done
EOF

chmod +x /usr/local/bin/mylinux-menu
"
    
    log_success "Interactive menu system created!"
}

setup_auto_login() {
    log_info "Setting up automatic menu on login..."
    
    # Create custom .bashrc for mylinux
    proot-distro login mylinux -- bash -c "
cat > /root/.bashrc << 'EOF'
#!/bin/bash

# MyLinux Custom .bashrc
# Created by: Davanico

# If not running interactively, don't do anything
[[ \$- != *i* ]] && return

# Set environment variables
export TERM=xterm-256color
export EDITOR=nano
export PAGER=less

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias update='pacman -Syu'
alias install='pacman -S'
alias search='pacman -Ss'
alias menu='mylinux-menu'

# Custom functions
extract() {
    if [ -f \$1 ] ; then
        case \$1 in
            *.tar.bz2)   tar xjf \$1     ;;
            *.tar.gz)    tar xzf \$1     ;;
            *.bz2)       bunzip2 \$1     ;;
            *.rar)       unrar e \$1     ;;
            *.gz)        gunzip \$1      ;;
            *.tar)       tar xf \$1      ;;
            *.tbz2)      tar xjf \$1     ;;
            *.tgz)       tar xzf \$1     ;;
            *.zip)       unzip \$1       ;;
            *.Z)         uncompress \$1  ;;
            *.7z)        7z x \$1        ;;
            *)           echo \"'\$1' cannot be extracted via extract()\" ;;
        esac
    else
        echo \"'\$1' is not a valid file\"
    fi
}

# Auto-start MyLinux menu
if [[ \$SHLVL -eq 1 ]]; then
    mylinux-menu
fi
EOF
"
    
    log_success "Auto-login setup completed!"
}

create_launcher_script() {
    log_info "Creating launcher script for Termux..."
    
    cat > "$PREFIX/bin/mylinux" << 'EOF'
#!/bin/bash

# MyLinux Launcher Script
# Created by: Davanico

echo -e "\033[0;36m"
echo "Starting MyLinux environment..."
echo -e "\033[0m"

# Check if mylinux distribution exists
if proot-distro list --installed | grep -q "mylinux"; then
    proot-distro login mylinux
else
    echo -e "\033[0;31mError: MyLinux distribution not found!"
    echo -e "Please run the installer script first.\033[0m"
    exit 1
fi
EOF
    
    chmod +x "$PREFIX/bin/mylinux"
    log_success "Launcher script created! Use 'mylinux' command to start."
}

create_uninstaller() {
    log_info "Creating uninstaller script..."
    
    cat > "$PREFIX/bin/uninstall-mylinux" << 'EOF'
#!/bin/bash

# MyLinux Uninstaller
# Created by: Davanico

echo -e "\033[1;33mMyLinux Uninstaller\033[0m"
echo "This will completely remove MyLinux from your system."
echo

read -p "Are you sure you want to uninstall MyLinux? (y/N): " -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Removing MyLinux distribution..."
    proot-distro remove mylinux
    
    echo "Removing launcher scripts..."
    rm -f "$PREFIX/bin/mylinux"
    rm -f "$PREFIX/bin/uninstall-mylinux"
    
    echo -e "\033[0;32mMyLinux has been completely removed from your system.\033[0m"
    echo "Thanks for using MyLinux! - Davanico"
else
    echo "Uninstallation cancelled."
fi
EOF
    
    chmod +x "$PREFIX/bin/uninstall-mylinux"
    log_success "Uninstaller script created!"
}

finalize_installation() {
    log_info "Finalizing installation..."
    
    # Create info file
    proot-distro login mylinux -- bash -c "
cat > /root/MYLINUX_INFO.txt << 'EOF'
═══════════════════════════════════════════════════════════════════════════════
MyLinux - Lightweight Arch Linux Environment for Termux
Created by: Davanico
═══════════════════════════════════════════════════════════════════════════════

INSTALLATION DATE: $(date)
VERSION: 2.0

QUICK START:
- From Termux: Type 'mylinux' to enter the environment
- Inside MyLinux: The interactive menu will start automatically
- Manual menu: Type 'menu' or 'mylinux-menu'

INSTALLED TOOLS:
✓ Network Tools: nmap, curl, wget, openssh, whois, net-tools
✓ System Tools: htop, neofetch, tree, git, vim, nano
✓ Development: python, pip, base-devel
✓ Visual: figlet, lolcat
✓ Testing: speedtest-cli

USEFUL COMMANDS:
- mylinux        : Start MyLinux environment
- menu           : Show interactive menu
- update         : Update system packages
- extract <file> : Extract various archive formats
- ll, la, l      : Enhanced ls commands

UNINSTALL:
Run 'uninstall-mylinux' from Termux to completely remove MyLinux.

For more information and updates, visit the GitHub repository.
═══════════════════════════════════════════════════════════════════════════════
EOF
"
    
    progress_bar 20 "Finalizing installation"
    log_success "Installation completed successfully!"
}

show_completion_message() {
    clear
    print_banner
    
    echo -e "${GREEN}🎉 INSTALLATION COMPLETED SUCCESSFULLY! 🎉${NC}"
    echo
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════════════════════${NC}"
    echo -e "${WHITE}MyLinux has been successfully installed on your system!${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════════════════════${NC}"
    echo
    echo -e "${YELLOW}Quick Start Guide:${NC}"
    echo -e "${BLUE}▶${NC} Type ${GREEN}'mylinux'${NC} to enter your new Arch Linux environment"
    echo -e "${BLUE}▶${NC} The interactive menu will start automatically"
    echo -e "${BLUE}▶${NC} Type ${GREEN}'menu'${NC} anytime to access the menu system"
    echo -e "${BLUE}▶${NC} Type ${GREEN}'uninstall-mylinux'${NC} to remove MyLinux completely"
    echo
    echo -e "${YELLOW}Installed Features:${NC}"
    echo -e "${GREEN}✓${NC} Full Arch Linux environment with proot-distro"
    echo -e "${GREEN}✓${NC} Interactive menu system with 8+ tools"
    echo -e "${GREEN}✓${NC} Network scanning and testing tools"
    echo -e "${GREEN}✓${NC} System monitoring and management"
    echo -e "${GREEN}✓${NC} Colorful ASCII banners and themes"
    echo -e "${GREEN}✓${NC} Auto-updater for all components"
    echo
    echo -e "${PURPLE}Created with   by Davanico${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════════════════════${NC}"
    echo
    echo -e "${WHITE}Press Enter to start MyLinux now, or Ctrl+C to exit...${NC}"
    read -r
    
    # Start MyLinux
    "$PREFIX/bin/mylinux"
}

main() {
    print_banner
    
    log_info "Starting MyLinux installation process..."
    sleep 2
    
    check_requirements
    sleep 1
    
    update_termux
    sleep 1
    
    install_proot_distro
    sleep 1
    
    install_arch_linux
    sleep 2
    
    setup_arch_environment
    sleep 1
    
    create_interactive_menu
    sleep 1
    
    setup_auto_login
    sleep 1
    
    create_launcher_script
    sleep 1
    
    create_uninstaller
    sleep 1
    
    finalize_installation
    sleep 2
    
    show_completion_message
}

# Handle script interruption
trap 'echo -e "\n${RED}Installation interrupted by user.${NC}"; exit 1' INT

# Run main function
main "$@"
Made with
1
