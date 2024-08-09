# .dotfiles
---

## Usage
```sh
git clone https://github.com/PXR05/dotfiles.git
cd dotfiles
cp -f .zshrc ~
cp -rf .config/* ~/.config
```

## Prerequisite
- **curl**
  ```sh
  sudo pacman -Syu curl
  ```
- **yay**
  ```sh
  sudo pacman -Syu --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
  ```
- **rust**
  ```sh
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  ```

## Packages
- **btop** (Resource Monitor)
- **fastfetch** (System Info)
- **hyprland** (Window Manager)
- **kitty** (Terminal Emulator)
- **oh-my-posh** (Prompt Theme)
- **rofi** (Launcher)
- **swappy** (Screenshot)
- **swaync** (Notification Center)
- **wallust** (Palette Generator)
- **waybar** (Status Bar)
- **wlogout** (Logout Menu)
- **zsh** (Shell)
  
### pacman
```sh
sudo pacman -S fasftfetch hyprland kitty rofi swappy swaync waybar zsh
```

### yay
```sh
sudo yay -S btop wlogout
```

### curl
```sh
curl -s https://ohmyposh.dev/install.sh | bash -s
```

### cargo
```sh
cargo install wallust
```
