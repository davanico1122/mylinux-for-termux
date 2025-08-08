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
VERSION: 3.0

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
" > /dev/null 2>&1
    
    progress_bar 20 "Finalizing installation"
    log_success "Installation completed successfully!"
    return 0
}
