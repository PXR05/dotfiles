# .dotfiles
---

## Usage
```sh
git clone https://github.com/PXR05/dotfiles.git
cd dotfiles
cp -f .zshrc ~
cp -rf .config/* ~/.config
cp -rf .themes ~
cp -rf .local ~
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
yay -S --noconfirm hyprland hyprlock hyprpicker xdg-desktop-portal-hyprland xorg-xwayland qt5-wayland qt6-wayland qt5ct qt6ct libva libva-nvidia-driver-git linux-headers 
```
#### pipewire
```sh
yay -S --noconfirm pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol wireplumber
```
#### packages
```sh
yay -S --noconfirm bat bibata-cursor-theme-bin brightnessctl btop cliphist discord eza fastfetch firefox kitty neovim nm-connection-editor nwg-look obs-studio pamixer ripgrep rofi-wayland swappy swaync swww thunar ttf-nerd-fonts-symbols waybar wlogout zsh
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
#### dev
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh && \
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
nvm install 20
```
### cargo
```sh
cargo install wallust
```
