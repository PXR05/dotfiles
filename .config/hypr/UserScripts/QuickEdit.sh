#!/bin/bash
# Rofi menu for Quick Edit / View of Settings (SUPER E)

# define your preferred text editor and terminal to use
editor=nvim
tty=kitty

configs="$HOME/.config/hypr/configs"
UserConfigs="$HOME/.config/hypr/UserConfigs"
BarConfigs="$HOME/.config/waybar"
LogoutConfigs="$HOME/.config/wlogout"

menu(){
  printf "1. Env Variables\n"
  printf "2. Window Rules\n"
  printf "3. Startup Apps\n"
  printf "4. User Keybinds\n"
  printf "5. Monitors\n"
  printf "6. Laptop Keybinds\n"
  printf "7. User Settings\n"
  printf "8. Workspace Rules\n"
  printf "9. Lock Screen\n"
  printf "10. Default Settings\n"
  printf "11. Default Keybinds\n"
  printf "12. Bar Style\n"
  printf "13. Bar Layout\n"
  printf "14. Bar Modules\n"
  printf "15. Logout Screen Style\n"
  printf "16. Logout Screen Layout\n"
}

main() {
    choice=$(menu | rofi -i -dmenu -config ~/.config/rofi/config-compact.rasi | cut -d. -f1)
    case $choice in
        1)
            $tty $editor "$UserConfigs/ENVariables.conf"
            ;;
        2)
            $tty $editor "$UserConfigs/WindowRules.conf"
            ;;
        3)
            $tty $editor "$UserConfigs/Startup_Apps.conf"
            ;;
        4)
            $tty $editor "$UserConfigs/UserKeybinds.conf"
            ;;
        5)
            $tty $editor "$UserConfigs/Monitors.conf"
            ;;
        6)
            $tty $editor "$UserConfigs/Laptops.conf"
            ;;
        7)
            $tty $editor "$UserConfigs/UserSettings.conf"
            ;;
        8)
            $tty $editor "$HOME/.config/hypr/hyprlock.conf"
            ;;
        9)
            $tty $editor "$UserConfigs/WorkspaceRules.conf"
            ;;
		    10)
            $tty $editor "$configs/Settings.conf"
            ;;
        11)
            $tty $editor "$configs/Keybinds.conf"
            ;;
        12)
            $tty $editor "$BarConfigs/style.css"
            ;;
        13)
            $tty $editor "$BarConfigs/config"
            ;;
        14)
            $tty $editor "$BarConfigs/modules"
            ;;
        15)
            $tty $editor "$LogoutConfigs/style.css"
            ;;
        16)
            $tty $editor "$LogoutConfigs/layout"
            ;;
        *)
            ;;
    esac
}

main
