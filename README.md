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
```sh
sudo yay -S btop wlogout fastfetch hyprland kitty rofi-wayland swappy swaync swww waybar zsh
```

### curl
```sh
curl -s https://ohmyposh.dev/install.sh | bash -s
```

### cargo
```sh
cargo install wallust
```
