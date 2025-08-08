create_interactive_menu() {
    log_info "Creating interactive menu system..."
    
    # Create the main menu script
    proot-distro login mylinux -- bash -c "
cat > /usr/local/bin/mylinux-menu << 'EOF'
#!/bin/bash

# MyLinux Interactive Menu System
# Created by: Davanico

RED='\\\033[0;31m'
GREEN='\\\033[0;32m'
YELLOW='\\\033[1;33m'
BLUE='\\\033[0;34m'
PURPLE='\\\033[0;35m'
CYAN='\\\033[0;36m'
WHITE='\\\033[1;37m'
NC='\\\033[0m'

show_banner() {
    clear
    echo 'mylinux' | figlet -f slant | lolcat
    echo -e \"\\\${CYAN}═══════════════════════════════════════════════════════════════════\\\${NC}\"
    echo -e \"\\\${WHITE}        Welcome to MyLinux - Minimalist & Fast\\\${NC}\"
    echo -e \"\\\${YELLOW}                Created by: Davanico\\\${NC}\"
    echo -e \"\\\${CYAN}═══════════════════════════════════════════════════════════════════\\\${NC}\"
    echo
    neofetch --ascii_distro arch_small
    echo
}

show_menu() {
    echo -e \"\\\${BLUE}┌─────────────────────────────────────────────────────────────────┐\\\${NC}\"
    echo -e \"\\\${BLUE}│\\\${WHITE}                        MyLinux Menu\\\${BLUE}                        │\\\${NC}\"
    echo -e \"\\\${BLUE}├─────────────────────────────────────────────────────────────────┤\\\${NC}\"
    echo -e \"\\\${BLUE}│\\\${NC} [1] 🔍 Network Scanner (Nmap)                              \\\${BLUE}│\\\${NC}\"
    echo -e \"\\\${BLUE}│\\\${NC} [2] 🚀 Internet Speed Test                                 \\\${BLUE}│\\\${NC}\"
    echo -e \"\\\${BLUE}│\\\${NC} [3] 📊 System Information                                  \\\${BLUE}│\\\${NC}\"
    echo -e \"\\\${BLUE}│\\\${NC} [4] 🔄 Update All Tools                                    \\\${BLUE}│\\\${NC}\"
    echo -e \"\\\${BLUE}│\\\${NC} [5] 🛠️  System Tools Menu                                  \\\${BLUE}│\\\${NC}\"
    echo -e \"\\\${BLUE}│\\\${NC} [6] 🌐 Network Tools Menu                                  \\\${BLUE}│\\\${NC}\"
    echo -e \"\\\${BLUE}│\\\${NC} [7] 📁 File Manager (Tree View)                            \\\${BLUE}│\\\${NC}\"
    echo -e \"\\\${BLUE}│\\\${NC} [8] 🎨 Customize Banner                                    \\\${BLUE}│\\\${NC}\"
    echo -e \"\\\${BLUE}│\\\${NC} [0] 🚪 Exit Menu                                           \\\${BLUE}│\\\${NC}\"
    echo -e \"\\\${BLUE}└─────────────────────────────────────────────────────────────────┘\\\${NC}\"
    echo
}

network_tools_menu() {
    clear
    echo -e \"\\\${CYAN}Network Tools Menu\\\${NC}\"
    echo -e \"\\\${BLUE}─────────────────────────────────────────\\\${NC}\"
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
            echo -e \"\\\${YELLOW}Scanning \$target...\\\${NC}\"
            nmap -sn \$target
            ;;
        2)
            read -p \"Enter target IP: \" target_ip
            read -p \"Enter port range (e.g., 1-1000): \" port_range
            echo -e \"\\\${YELLOW}Scanning ports \$port_range on \$target_ip...\\\${NC}\"
            nmap -p \$port_range \$target_ip
            ;;
        3)
            read -p \"Enter domain name: \" domain
            echo -e \"\\\${YELLOW}DNS lookup for \$domain...\\\${NC}\"
            nslookup \$domain
            ;;
        4)
            read -p \"Enter domain/IP: \" whois_target
            echo -e \"\\\${YELLOW}Whois lookup for \$whois_target...\\\${NC}\"
            whois \$whois_target
            ;;
        5)
            echo -e \"\\\${YELLOW}Network statistics...\\\${NC}\"
            netstat -tuln
            ;;
        0)
            return
            ;;
        *)
            echo -e \"\\\${RED}Invalid option!\\\${NC}\"
            ;;
    esac
    read -p \"Press Enter to continue...\"
}

system_tools_menu() {
    clear
    echo -e \"\\\${CYAN}System Tools Menu\\\${NC}\"
    echo -e \"\\\${BLUE}─────────────────────────────────────────\\\${NC}\"
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
            echo -e \"\\\${YELLOW}Updating system...\\\${NC}\"
            sudo pacman -Syu
            ;;
        5)
            echo -e \"\\\${YELLOW}Cleaning system...\\\${NC}\"
            sudo pacman -Sc
            ;;
        0)
            return
            ;;
        *)
            echo -e \"\\\${RED}Invalid option!\\\${NC}\"
            ;;
    esac
    read -p \"Press Enter to continue...\"
}

while true; do
    show_banner
    show_menu
    read -p \"\\\$(echo -e \"\\\${GREEN}Enter your choice [0-8]: \\\${NC}\")\" choice
    
    case \$choice in
        1)
            read -p \"Enter target IP/network (default: 192.168.1.0/24): \" target
            target=\\\${target:-192.168.1.0/24}
            echo -e \"\\\${YELLOW}Scanning network \$target...\\\${NC}\"
            nmap -sn \$target
            read -p \"Press Enter to continue...\"
            ;;
        2)
            echo -e \"\\\${YELLOW}Running internet speed test...\\\${NC}\"
            speedtest-cli
            read -p \"Press Enter to continue...\"
            ;;
        3)
            clear
            neofetch
            read -p \"Press Enter to continue...\"
            ;;
        4)
            echo -e \"\\\${YELLOW}Updating all tools...\\\${NC}\"
            sudo pacman -Syu --noconfirm
            pip install --upgrade lolcat speedtest-cli --break-system-packages
            echo -e \"\\\${GREEN}All tools updated successfully!\\\${NC}\"
            read -p \"Press Enter to continue...\"
            ;;
        5)
            system_tools_menu
            ;;
        6)
            network_tools_menu
            ;;
        7)
            echo -e \"\\\${YELLOW}Current directory structure:\\\${NC}\"
            tree -L 3
            read -p \"Press Enter to continue...\"
            ;;
        8)
            echo -e \"\\\${CYAN}Available figlet fonts:\\\${NC}\"
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
            echo -e \"\\\${GREEN}Thanks for using MyLinux! Created by Davanico\\\${NC}\"
            break
            ;;
        *)
            echo -e \"\\\${RED}Invalid option! Please try again.\\\${NC}\"
            sleep 2
            ;;
    esac
done
EOF

chmod +x /usr/local/bin/mylinux-menu
" > /dev/null 2>&1
    
    log_success "Interactive menu system created!"
    return 0
}
