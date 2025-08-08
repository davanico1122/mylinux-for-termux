install_arch_linux() {
    log_info "Installing Arch Linux distribution..."
    log_warning "This may take several minutes depending on your internet speed..."
    
    {
        proot-distro install archlinux > /dev/null 2>&1
        proot-distro rename archlinux mylinux > /dev/null 2>&1
    } &
    show_spinner $!
    
    log_success "Arch Linux installed and renamed to 'mylinux'!"
    return 0
}
