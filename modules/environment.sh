setup_arch_environment() {
    log_info "Setting up Arch Linux environment..."
    
    # Update Arch Linux system
    log_info "Updating Arch Linux packages..."
    proot-distro login mylinux -- bash -c "
        pacman -Syu --noconfirm > /dev/null 2>&1
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
            sudo > /dev/null 2>&1
    "
    
    # Install lolcat via pip
    log_info "Installing lolcat and speedtest-cli..."
    proot-distro login mylinux -- bash -c "
        pip install lolcat speedtest-cli --break-system-packages > /dev/null 2>&1
    "
    
    log_success "All packages installed successfully!"
    return 0
}
