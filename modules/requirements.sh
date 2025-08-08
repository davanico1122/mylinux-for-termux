check_requirements() {
    log_info "Checking system requirements..."
    
    # Check if running on Termux
    if [[ ! -d "$PREFIX" ]]; then
        log_error "This script must be run in Termux environment!"
        return 1
    fi
    
    # Check internet connection
    if ! ping -c 1 google.com &> /dev/null; then
        log_error "Internet connection required for installation!"
        return 1
    fi
    
    # Check available storage (minimum 2GB)
    available_space=$(df $PREFIX | awk 'NR==2 {print $4}')
    if [[ $available_space -lt 2097152 ]]; then
        log_warning "Low storage space detected. Minimum 2GB recommended."
        read -p "Continue anyway? (y/N): " -r
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            return 1
        fi
    fi
    
    log_success "System requirements check passed!"
    return 0
}

update_termux() {
    log_info "Updating Termux packages..."
    {
        apt update -y && apt upgrade -y
    } > /dev/null 2>&1 &
    show_spinner $!
    log_success "Termux packages updated successfully!"
    return 0
}
