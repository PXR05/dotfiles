# .dotfiles

```sh
git clone https://github.com/PXR05/dotfiles.git
cd dotfiles
sudo rm -r .git
chmod +x install.sh
sudo ./install.sh
```

## Packages

- **btop** (Resource Monitor)
- **fastfetch** (System Info)
- **hyprland** (Window Manager)
- **ghostty** (Terminal Emulator)
- **oh-my-posh** (Prompt Theme)
- **rofi-wayland** (Launcher)
- **swappy** (Screenshot)
- **swww** (Wallpaper)
- **wallust** (Palette Generator)
- **waybar** (Status Bar)
- **wlogout** (Logout Menu)
- **zen-browser (Web Browser)**
- **zsh** (Shell)

### yay

#### hyprland

```sh
yay -S --noconfirm hyprland hyprlock hyprpicker xdg-desktop-portal-hyprland xorg-xwayland qt5-wayland qt6-wayland qt5ct qt6ct nvidia-inst linux-headers polkit-gnome
```

#### audio

```sh
yay -S --noconfirm pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol wireplumber jamesdsp pamixer
```

#### core

```sh
yay -S --noconfirm bat bibata-cursor-theme-bin blueman bluez bluez-utils brightnessctl btop cliphist eza fastfetch ghostty grim jq nm-connection-editor nwg-look ripgrep rofi-wayland slurp swappy swww thunar tumbler ttf-nerd-fonts-symbols vlc waybar wl-clipboard wlogout zen-browser-bin zsh
```

#### dev

```sh
yay -S --noconfirm bun go neovim nodejs npm visual-studio-code-bin docker-desktop
```

#### extra

```sh
yay -S --noconfirm discord obs-studio spotify qbittorrent
```

### external

#### nerd font

```sh
yay -S --noconfirm ttf-atkinson-hyperlegible && \
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip && \
cd ~/.local/share/fonts && \
unzip -o JetBrainsMono.zip && \
rm -f JetBrainsMono.zip && \
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
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
cargo install wallust
```
