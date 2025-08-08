install_proot_distro() {
    log_info "Installing proot-distro..."
    {
        pkg install proot-distro -y > /dev/null 2>&1
    } &
    show_spinner $!
    log_success "proot-distro installed successfully!"
    return 0
}
