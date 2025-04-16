#!/bin/bash

print_help() {
    echo "Usage: $0 [OPTION]"
    echo "Install dotfiles components"
    echo ""
    echo "Options:"
    echo "  -h, --help       Show this help message"
    echo "  --hyprland       Install Hyprland and dependencies"
    echo "  --audio          Install PipeWire audio system"
    echo "  --core           Install core packages"
    echo "  --dev            Install development tools"
    echo "  --extra          Install extra applications"
    echo "  --font           Install JetBrains Mono Nerd Font"
    echo "  --terminal       Install terminal enhancements"
    echo "  --rust           Install Rust and Wallust"
    echo "  --all            Install everything (default)"
    exit 0
}

print_section() {
    echo "----------------------------------------"
    echo "Installing $1..."
    echo "----------------------------------------"
}

failed_installations=()
log_file="/tmp/dotfiles_install.log"

install_packages() {
    local packages=("$@")
    for package in "${packages[@]}"; do
        echo "Installing $package..."
        if ! yay -S --noconfirm "$package" >>"$log_file" 2>&1; then
            echo "Failed to install $package"
            failed_installations+=("$package")
        fi
    done
}

install_hyprland() {
    print_section "Hyprland"
    install_packages hyprland hyprlock hyprpicker xdg-desktop-portal-hyprland \
        xorg-xwayland qt5-wayland qt6-wayland qt5ct qt6ct libva \
        libva-nvidia-driver-git nvidia-inst linux-headers polkit-gnome
}

install_audio() {
    print_section "PipeWire audio system"
    install_packages pipewire pipewire-alsa pipewire-pulse pipewire-jack \
        pavucontrol wireplumber
}

install_core() {
    print_section "Core packages"
    install_packages bat bibata-cursor-theme-bin blueman bluez bluez-utils \
        brightnessctl btop cliphist eza fastfetch ghostty grim jq \
        nm-connection-editor nwg-look pamixer ripgrep rofi-wayland slurp \
        swappy swaync swww thunar ttf-nerd-fonts-symbols vlc waybar \
        wl-clipboard wlogout zen-browser-bin zsh
    sudo chsh -s /usr/bin/zsh || echo "Failed to change shell to zsh"
}

install_dev() {
    print_section "Development tools"
    install_packages go neovim nodejs npm visual-studio-code-bin zed
    if ! curl -fsSL https://bun.sh/install | bash >>"$log_file" 2>&1; then
        echo "Failed to install Bun"
        failed_installations+=("bun")
    fi
}

install_extra() {
    print_section "Extra applications"
    install_packages discord obsidian obs-studio spotify
}

install_font() {
    print_section "Atkinson Hyperlegible Font"

    install_packages ttf-atkinson-hyperlegible

    print_section "JetBrains Mono Nerd Font"

    mkdir -p ~/.local/share/fonts

    cd ~/.local/share/fonts || {
        echo "Failed to access fonts directory"
        failed_installations+=("jetbrains-mono-font")
        return
    }

    rm -f JetBrainsMono.zip

    if ! wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip >>"$log_file" 2>&1; then
        echo "Failed to download JetBrains Mono font"
        failed_installations+=("jetbrains-mono-font")
        return
    fi

    if [ ! -f JetBrainsMono.zip ]; then
        echo "Font file not downloaded correctly"
        failed_installations+=("jetbrains-mono-font")
        return
    fi

    unzip -o JetBrainsMono.zip >>"$log_file" 2>&1
    rm -f JetBrainsMono.zip
    fc-cache -fv >>"$log_file" 2>&1
}

install_terminal() {
    print_section "Terminal enhancements"
    if ! curl -s https://ohmyposh.dev/install.sh | bash -s >>"$log_file" 2>&1; then
        echo "Failed to install Oh My Posh"
        failed_installations+=("oh-my-posh")
    fi

    if ! git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ~/.zsh/fast-syntax-highlighting >>"$log_file" 2>&1; then
        echo "Failed to install fast-syntax-highlighting"
        failed_installations+=("fast-syntax-highlighting")
    fi

    if ! git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions >>"$log_file" 2>&1; then
        echo "Failed to install zsh-autosuggestions"
        failed_installations+=("zsh-autosuggestions")
    fi
}

install_rust() {
    print_section "Rust and Wallust"
    if ! curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y >>"$log_file" 2>&1; then
        echo "Failed to install Rust"
        failed_installations+=("rust")
        return
    fi
    source "$HOME/.cargo/env"
    if ! cargo install wallust >>"$log_file" 2>&1; then
        echo "Failed to install Wallust"
        failed_installations+=("wallust")
    fi
}

install_all() {
    install_hyprland
    install_audio
    install_core
    install_dev
    install_extra
    install_font
    install_terminal
    install_rust
}

copy_dotfiles() {
    echo "Would you like to copy the dotfiles to your home directory? [Y/n] "
    read -r response
    if [[ "$response" =~ ^([nN][oO]|[nN])$ ]]; then
        echo "Skipping dotfiles copy."
    else
        echo "Copying dotfiles to home directory..."
        cp -rf . ~
        echo "Dotfiles copied successfully!"
    fi
}

# Parse arguments
if [ $# -eq 0 ]; then
    install_all
else
    while [ "$1" != "" ]; do
        case $1 in
        -h | --help)
            print_help
            ;;
        --hyprland)
            install_hyprland
            ;;
        --audio)
            install_audio
            ;;
        --core)
            install_core
            ;;
        --dev)
            install_dev
            ;;
        --extra)
            install_extra
            ;;
        --font)
            install_font
            ;;
        --terminal)
            install_terminal
            ;;
        --rust)
            install_rust
            ;;
        --all)
            install_all
            ;;
        *)
            echo "Unknown option: $1"
            print_help
            exit 1
            ;;
        esac
        shift
    done
fi

show_summary() {
    echo "----------------------------------------"
    if [ ${#failed_installations[@]} -eq 0 ]; then
        echo "All installations completed successfully!"
    else
        echo "Installation completed with some failures:"
        echo "Failed installations: ${failed_installations[*]}"
        echo "Check $log_file for detailed error logs"
    fi
    echo "----------------------------------------"
}

echo "----------------------------------------"
echo "Installation complete!"
copy_dotfiles
echo "----------------------------------------"

show_summary

exec zsh
