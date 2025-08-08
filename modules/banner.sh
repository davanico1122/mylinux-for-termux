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
    echo -e "${WHITE}        Advanced Arch Linux Environment for Termux v1.0"
    echo -e "${YELLOW}                    Created by: Davanico"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════════════════════${NC}"
    echo
}

show_completion_message() {
    clear
    print_banner
    
    echo -e "${GREEN} INSTALLATION COMPLETED SUCCESSFULLY! ${NC}"
    echo
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════════════════════${NC}"
    echo -e "${WHITE}MyLinux has been successfully installed on your system!${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════════════════════${NC}"
    echo
    echo -e "${YELLOW}Quick Start Guide:${NC}"
    echo -e "${BLUE}${NC} Type ${GREEN}'mylinux'${NC} to enter your new Arch Linux environment"
    echo -e "${BLUE}${NC} The interactive menu will start automatically"
    echo -e "${BLUE}${NC} Type ${GREEN}'menu'${NC} anytime to access the menu system"
    echo -e "${BLUE}${NC} Type ${GREEN}'uninstall-mylinux'${NC} to remove MyLinux completely"
    echo
    echo -e "${YELLOW}Installed Features:${NC}"
    echo -e "${GREEN}✓${NC} Full Arch Linux environment with proot-distro"
    echo -e "${GREEN}✓${NC} Interactive menu system with 8+ tools"
    echo -e "${GREEN}✓${NC} Network scanning and testing tools"
    echo -e "${GREEN}✓${NC} System monitoring and management"
    echo -e "${GREEN}✓${NC} Colorful ASCII banners and themes"
    echo -e "${GREEN}✓${NC} Auto-updater for all components"
    echo
    echo -e "${PURPLE}Created with  by Davanico${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════════════════════${NC}"
    echo
    echo -e "${WHITE}Press Enter to start MyLinux now, or Ctrl+C to exit...${NC}"
    read -r
    
    # Start MyLinux
    "$PREFIX/bin/mylinux"
}
