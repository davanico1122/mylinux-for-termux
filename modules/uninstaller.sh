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
    return 0
}
