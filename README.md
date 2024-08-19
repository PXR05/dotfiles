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
yay -S pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol wireplumber
```
#### packages
```sh
yay -S bat bibata-cursor-theme-bin brightnessctl btop cliphist discord eza fastfetch firefox kitty neovim nwg-look pamixer ripgrep rofi-wayland swappy swaync swww thunar waybar wlogout zsh
```

### external
#### cursor
```sh
mkdir -p ~/.local/share/icons/Bibata-Modern-Ice && \
cd ~/.local/share/icons/Bibata-Modern-Ice && \
curl -L https://github.com/LOSEARDES77/Bibata-Cursor-hyprcursor/releases/download/1.0/hypr_Bibata-Modern-Ice.tar.gz > Bibata-Modern-Ice.tar.gz && \
tar -xzf Bibata-Modern-Ice.tar.gz && \
rm Bibata-Modern-Ice.tar.gz
```
#### font 
```sh
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \ &&
cd ~/.local/share/fonts \ && 
unzip JetBrainsMono.zip \ && 
rm JetBrainsMono.zip \ && 
fc-cache -fv
```
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
