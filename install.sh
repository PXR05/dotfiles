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

install_hyprland() {
    print_section "Hyprland"
    yay -S --noconfirm hyprland hyprlock hyprpicker xdg-desktop-portal-hyprland \
        xorg-xwayland qt5-wayland qt6-wayland qt5ct qt6ct libva \
        libva-nvidia-driver-git linux-headers polkit-gnome
}

install_audio() {
    print_section "PipeWire audio system"
    yay -S --noconfirm pipewire pipewire-alsa pipewire-pulse pipewire-jack \
        pavucontrol wireplumber
}

install_core() {
    print_section "Core packages"
    yay -S --noconfirm bat bibata-cursor-theme-bin blueman bluez bluez-utils \
        brightnessctl btop cliphist eza fastfetch ghostty grim jq \
        nm-connection-editor nwg-look pamixer ripgrep rofi-wayland slurp \
        swappy swaync swww thunar ttf-nerd-fonts-symbols vlc waybar \
        wl-copy wlogout zen-browser-bin zsh
    sudo chsh -s /usr/bin/zsh
}

install_dev() {
    print_section "Development tools"
    yay -S --noconfirm bun go neovim nodejs npm visual-studio-code-bin zed
}

install_extra() {
    print_section "Extra applications"
    yay -S --noconfirm discord lutris obsidian obs-studio spotify steam wine winetricks
}

install_font() {
    print_section "JetBrains Mono Nerd Font"
    wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
    cd ~/.local/share/fonts
    unzip JetBrainsMono.zip
    rm JetBrainsMono.zip
    fc-cache -fv
}

install_terminal() {
    print_section "Terminal enhancements"
    curl -s https://ohmyposh.dev/install.sh | bash -s
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ~/.zsh/fast-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
}

install_rust() {
    print_section "Rust and Wallust"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
    cargo install wallust
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
    echo "Would you like to copy the dotfiles to your home directory? [y/N] "
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        echo "Copying dotfiles to home directory..."
        cp -rf . ~
        echo "Dotfiles copied successfully!"
    else
        echo "Skipping dotfiles copy."
    fi
}

# Parse arguments
if [ $# -eq 0 ]; then
    install_all
else
    while [ "$1" != "" ]; do
        case $1 in
            -h | --help )    print_help
                            ;;
            --hyprland )     install_hyprland
                            ;;
            --audio )        install_audio
                            ;;
            --core )         install_core
                            ;;
            --dev )          install_dev
                            ;;
            --extra )        install_extra
                            ;;
            --font )         install_font
                            ;;
            --terminal )     install_terminal
                            ;;
            --rust )         install_rust
                            ;;
            --all )          install_all
                            ;;
            * )             echo "Unknown option: $1"
                           print_help
                           exit 1
        esac
        shift
    done
fi

echo "----------------------------------------"
echo "Installation complete! Please reboot the device"
copy_dotfiles
echo "----------------------------------------"

exec zsh
