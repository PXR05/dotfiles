# .dotfiles

```sh
git clone https://github.com/PXR05/dotfiles.git
cd dotfiles
rm -r .git
chmod +x install.sh
./install.sh
```

## Packages

- **btop** (Resource Monitor)
- **fastfetch** (System Info)
- **hyprland** (Window Manager)
- **ghostty** (Terminal Emulator)
- **oh-my-posh** (Prompt Theme)
- **rofi-wayland** (Launcher)
- **swappy** (Screenshot)
- **swaync** (Notification Center)
- **swww** (Wallpaper)
- **wallust** (Palette Generator)
- **waybar** (Status Bar)
- **wlogout** (Logout Menu)
- **zen-browser (Web Browser)**
- **zsh** (Shell)

### yay

#### hyprland

```sh
yay -S --noconfirm hyprland hyprlock hyprpicker xdg-desktop-portal-hyprland xorg-xwayland qt5-wayland qt6-wayland qt5ct qt6ct libva libva-nvidia-driver-git linux-headers polkit-gnome
```

#### pipewire

```sh
yay -S --noconfirm pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol wireplumber
```

#### core

```sh
yay -S --noconfirm bat bibata-cursor-theme-bin blueman bluez bluez-utils brightnessctl btop cliphist eza fastfetch ghostty grim jq nm-connection-editor nwg-look pamixer ripgrep rofi-wayland slurp swappy swaync swww thunar ttf-nerd-fonts-symbols vlc waybar wl-copy wlogout zen-browser-bin zsh
```

#### dev

```sh
yay -S --noconfirm bun go neovim nodejs npm visual-studio-code-bin zed
```

#### extra

```sh
yay -S --noconfirm discord lutris obsidian obs-studio spotify steam wine winetricks
```

### external

#### nerd font

```sh
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip && \
cd ~/.local/share/fonts && \
unzip JetBrainsMono.zip && \
rm JetBrainsMono.zip && \
fc-cache -fv
```

#### terminal

```sh
curl -s https://ohmyposh.dev/install.sh | bash -s && \
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ~/.zsh/fast-syntax-highlighting && \
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

#### rust

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh && \
cargo install wallust
```
