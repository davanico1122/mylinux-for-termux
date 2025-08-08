#!/bin/bash

# ═══════════════════════════════════════════════════════════════════════════════
# MyLinux - Lightweight Arch Linux Environment for Termux
# Advanced Installation Script v3.0
# 
# Created by: Davanico
# License: MIT
# Description: Modular installer for Arch Linux with proot-distro in Termux
# Features: Full modular design, bug fixes, comprehensive tools, ready for release
# ═══════════════════════════════════════════════════════════════════════════════

set -e  # Exit on any error

# Determine script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULE_DIR="$SCRIPT_DIR/modules"
CONFIG_DIR="$SCRIPT_DIR/config"

# Create required directories
mkdir -p "$MODULE_DIR" "$CONFIG_DIR"

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Animation functions
show_spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while ps -p $pid > /dev/null; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

progress_bar() {
    local duration=$1
    local message=$2
    echo -ne "${CYAN}$message${NC} ["
    for ((i=0; i<duration; i++)); do
        echo -n "▓"
        sleep 0.1
    done
    echo -e "] ${GREEN}✓${NC}"
}

# Logging functions
log() {
    local color="$1"
    local level="$2"
    local message="$3"
    echo -e "${color}[$level]${NC} $message"
}

log_info() { log "$BLUE" "INFO" "$1"; }
log_success() { log "$GREEN" "SUCCESS" "$1"; }
log_warning() { log "$YELLOW" "WARNING" "$1"; }
log_error() { log "$RED" "ERROR" "$1"; }

# Load modules
load_modules() {
    local modules=(
        "banner.sh"
        "requirements.sh"
        "proot_install.sh"
        "arch_install.sh"
        "environment.sh"
        "menu_system.sh"
        "autologin.sh"
        "launcher.sh"
        "uninstaller.sh"
        "finalize.sh"
    )
    
    for module in "${modules[@]}"; do
        if [[ -f "$MODULE_DIR/$module" ]]; then
            source "$MODULE_DIR/$module"
            log_success "Loaded module: $module"
        else
            log_error "Module $module not found!"
            return 1
        fi
    done
    return 0
}

# Main installation flow
main() {
    # Load all modules
    if ! load_modules; then
        log_error "Failed to load modules. Installation aborted."
        exit 1
    fi

    print_banner
    log_info "Starting MyLinux installation process..."
    
    # Execute installation steps
    local steps=(
        "check_requirements"
        "update_termux"
        "install_proot_distro"
        "install_arch_linux"
        "setup_arch_environment"
        "create_interactive_menu"
        "setup_auto_login"
        "create_launcher_script"
        "create_uninstaller"
        "finalize_installation"
    )
    
    for step in "${steps[@]}"; do
        log_info "Executing step: $step"
        if $step; then
            log_success "Step completed: $step"
        else
            log_error "Step $step failed. Installation aborted."
            exit 1
        fi
        sleep 1
    done

    show_completion_message
}

# Handle script interruption
trap 'echo -e "\n${RED}Installation interrupted by user.${NC}"; exit 1' INT

# Execute main function
main "$@"
