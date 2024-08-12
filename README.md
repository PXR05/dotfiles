# .dotfiles
---

## Usage
```sh
git clone https://github.com/PXR05/dotfiles.git
cd dotfiles
cp -f .zshrc ~
cp -rf .config/* ~/.config
```

## Packages
- **btop** (Resource Monitor)
- **fastfetch** (System Info)
- **hyprland** (Window Manager)
- **kitty** (Terminal Emulator)
- **oh-my-posh** (Prompt Theme)
- **rofi-wayland** (Launcher)
- **swappy** (Screenshot)
- **swaync** (Notification Center)
- **swww** (Wallpaper)
- **wallust** (Palette Generator)
- **waybar** (Status Bar)
- **wlogout** (Logout Menu)
- **zsh** (Shell)
  
### yay
#### hyprland
```sh
yay -S hyprland hyprlock xdg-desktop-portal-hyprland xorg-xwayland qt5-wayland qt6-wayland qt5ct qt6ct libva libva-nvidia-driver-git linux-headers 
```
#### pipewire
```sh
pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol wireplumber
```
#### packages
```sh
bat brightnessctl btop discord eza fastfetch firefox kitty neovim ripgrep rofi-wayland swappy swaync swww waybar wlogout zsh
```

### curl
#### terminal
```sh
curl -s https://ohmyposh.dev/install.sh | bash -s && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting && \
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```
#### dev
```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
nvm install 20
```

### cargo
```sh
cargo install wallust
```
