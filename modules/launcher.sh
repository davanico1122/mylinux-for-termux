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
if proot-distro list | grep -q "mylinux"; then
    proot-distro login mylinux
else
    echo -e "\033[0;31mError: MyLinux distribution not found!"
    echo -e "Please run the installer script first.\033[0m"
    exit 1
fi
EOF
    
    chmod +x "$PREFIX/bin/mylinux"
    log_success "Launcher script created! Use 'mylinux' command to start."
    return 0
}
