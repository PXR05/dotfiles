#!/bin/bash

# Detect monitor resolution and scale
x_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
y_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
hypr_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')

# Calculate width and height based on percentages and monitor resolution
width=$((x_mon * hypr_scale / 100))
height=$((y_mon * hypr_scale / 100))

# Set maximum width and height
max_width=1200
max_height=1000

# Set percentage of screen size for dynamic adjustment
percentage_width=70
percentage_height=70

# Calculate dynamic width and height
dynamic_width=$((width * percentage_width / 100))
dynamic_height=$((height * percentage_height / 100))

# Limit width and height to maximum values
dynamic_width=$(($dynamic_width > $max_width ? $max_width : $dynamic_width))
dynamic_height=$(($dynamic_height > $max_height ? $max_height : $dynamic_height))

# Launch yad with calculated width and height
yad --width=$dynamic_width --height=$dynamic_height \
    --center \
    --title="Keybindings" \
    --no-buttons \
    --list \
    --column=Key \
    --column=Action \
    --column=* \
    --timeout-indicator=bottom \
" Enter" "Terminal" "(kitty)" \
" Space" "App Launcher" "(rofi-wayland)" \
" T" "Open File Manager" "(Thunar)" \
" Q" "Close active window" "" \
" Shift Q " "Kill active window" "" \
" Alt V" "Clipboard Manager" "(cliphist)" \
" W" "Choose wallpaper" "(Wallpaper Menu)" \
" Shift W" "Choose wallpaper effects" "(imagemagick + swww)" \
" B" "Hide/UnHide Waybar" "waybar" \
" Ctrl B" "Choose waybar styles" "(waybar styles)" \
" Alt B" "Choose waybar layout" "(waybar layout)" \
" Alt R" "Reload Waybar swaync Rofi" "" \
" Shift N" "Launch Notification Panel" "(swaync)" \
" Print" "Screenshot" "(grim)" \
" Shift Print" "Screenshot region" "(grim + slurp)" \
" Shift S" "Screenshot region" "(swappy)" \
"Alt Print" "Screenshot active window" "" \
"Ctrl Alt P" "Power menu" "(wlogout)" \
"Ctrl Alt L" "Screen lock" "(hyprlock)" \
"Ctrl Alt Del" "Hyprland Exit" "" \
" F" "Fullscreen" "" \
" Alt L" "Toggle Dwindle | Master Layout" "" \
" Shift F" "Toggle float" "(single window)" \
" Alt F" "Toggle all windows to float" "(all windows)" \
" Alt E" "Rofi Emoticons" "" \
" Alt V" "Clipboard Manager" "(cliphist)" \
" E" "View or Edit Keybinds, Settings, Monitor" "" \
"" "" "" \
