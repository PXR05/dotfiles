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
  printf "Env Variables\n"
  printf "Window Rules\n"
  printf "Startup Apps\n"
  printf "Monitors\n"
  printf "Laptop Keybinds\n"
  printf "User Settings\n"
  printf "Workspace Rules\n"
  printf "Lock Screen\n"
  printf "Default Settings\n"
  printf "Default Keybinds\n"
  printf "Bar Style\n"
  printf "Bar Layout\n"
  printf "Bar Modules\n"
  printf "Logout Screen Style\n"
  printf "Logout Screen Layout\n"
}

main() {
    choice=$(menu | rofi -i -dmenu -config ~/.config/rofi/config-compact.rasi | cut -d-f1)
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
