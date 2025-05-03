#!/bin/bash

editor=nvim
tty=ghostty

configs="$HOME/.config/hypr/configs"
BarConfigs="$HOME/.config/waybar"
LogoutConfigs="$HOME/.config/wlogout"

menu(){
  printf "1. Env Variables\n"
  printf "2. Window Rules\n"
  printf "3. Startup Apps\n"
  printf "4. Monitors\n"
  printf "5. Laptop Keybinds\n"
  printf "6. Workspace Rules\n"
  printf "7. Lock Screen\n"
  printf "8. Default Settings\n"
  printf "9. Default Keybinds\n"
  printf "10. Bar Style\n"
  printf "11. Bar Layout\n"
  printf "12. Bar Modules\n"
  printf "13. Logout Screen Style\n"
  printf "14. Logout Screen Layout\n"
}

main() {
    choice=$(menu | rofi -i -dmenu -config ~/.config/rofi/config-compact.rasi | cut -d "." -f 1)
    case $choice in
        1)
            $tty -e $editor "$configs/ENVariables.conf"
            ;;
        2)
            $tty -e $editor "$configs/WindowRules.conf"
            ;;
        3)
            $tty -e $editor "$configs/Startup_Apps.conf"
            ;;
        4)
            $tty -e $editor "$configs/Monitors.conf"
            ;;
        5)
            $tty -e $editor "$configs/Laptops.conf"
            ;;
        6)
            $tty -e $editor "$configs/WorkspaceRules.conf"
            ;;
        7)
            $tty -e $editor "$HOME/.config/hypr/hyprlock.conf"
            ;;
		    8)
            $tty -e $editor "$configs/Settings.conf"
            ;;
        9)
            $tty -e $editor "$configs/Keybinds.conf"
            ;;
        10)
            $tty -e $editor "$BarConfigs/style.css"
            ;;
        11)
            $tty -e $editor "$BarConfigs/config"
            ;;
        12)
            $tty -e $editor "$BarConfigs/modules"
            ;;
        13)
            $tty -e $editor "$LogoutConfigs/style.css"
            ;;
        14)
            $tty -e $editor "$LogoutConfigs/layout"
            ;;
        *)
            ;;
    esac
}

main
