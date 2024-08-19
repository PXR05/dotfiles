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
  printf "4. Monitors\n"
  printf "5. Laptop Keybinds\n"
  printf "6. User Settings\n"
  printf "7. Workspace Rules\n"
  printf "8. Lock Screen\n"
  printf "9. Default Settings\n"
  printf "10. Default Keybinds\n"
  printf "11. Bar Style\n"
  printf "12. Bar Layout\n"
  printf "13. Bar Modules\n"
  printf "14. Logout Screen Style\n"
  printf "15. Logout Screen Layout\n"
}

main() {
    choice=$(menu | rofi -i -dmenu -config ~/.config/rofi/config-compact.rasi | cut -d "." -f 1)
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
            $tty $editor "$UserConfigs/Monitors.conf"
            ;;
        5)
            $tty $editor "$UserConfigs/Laptops.conf"
            ;;
        6)
            $tty $editor "$UserConfigs/UserSettings.conf"
            ;;
        7)
            $tty $editor "$HOME/.config/hypr/hyprlock.conf"
            ;;
        8)
            $tty $editor "$UserConfigs/WorkspaceRules.conf"
            ;;
		    9)
            $tty $editor "$configs/Settings.conf"
            ;;
        10)
            $tty $editor "$configs/Keybinds.conf"
            ;;
        11)
            $tty $editor "$BarConfigs/style.css"
            ;;
        12)
            $tty $editor "$BarConfigs/config"
            ;;
        13)
            $tty $editor "$BarConfigs/modules"
            ;;
        14)
            $tty $editor "$LogoutConfigs/style.css"
            ;;
        15)
            $tty $editor "$LogoutConfigs/layout"
            ;;
        *)
            ;;
    esac
}

main
