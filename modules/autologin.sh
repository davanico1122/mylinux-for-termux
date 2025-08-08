setup_auto_login() {
    log_info "Setting up automatic menu on login..."
    
    # Create custom .bashrc for mylinux
    proot-distro login mylinux -- bash -c "
cat > /root/.bashrc << 'EOF'
#!/bin/bash

# MyLinux Custom .bashrc
# Created by: Davanico

# If not running interactively, don't do anything
[[ \$- != *i* ]] && return

# Set environment variables
export TERM=xterm-256color
export EDITOR=nano
export PAGER=less

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias search='pacman -Ss'
alias menu='mylinux-menu'

# Custom functions
extract() {
    if [ -f \$1 ] ; then
        case \$1 in
            *.tar.bz2)   tar xjf \$1     ;;
            *.tar.gz)    tar xzf \$1     ;;
            *.bz2)       bunzip2 \$1     ;;
            *.rar)       unrar e \$1     ;;
            *.gz)        gunzip \$1      ;;
            *.tar)       tar xf \$1      ;;
            *.tbz2)      tar xjf \$1     ;;
            *.tgz)       tar xzf \$1     ;;
            *.zip)       unzip \$1       ;;
            *.Z)         uncompress \$1  ;;
            *.7z)        7z x \$1        ;;
            *)           echo \"'\$1' cannot be extracted via extract()\" ;;
        esac
    else
        echo \"'\$1' is not a valid file\"
    fi
}

# Auto-start MyLinux menu
if [[ \$SHLVL -eq 1 ]]; then
    mylinux-menu
fi
EOF
" > /dev/null 2>&1
    
    log_success "Auto-login setup completed!"
    return 0
}
