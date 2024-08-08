#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Keyhints. Idea got from Garuda Hyprland

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
    --column=Key: \
    --column=Description: \
    --column=Note: \
    --timeout-indicator=bottom \
" enter" "Terminal" "(kitty)" \
" A" "Desktop Overview" "(AGS Overview)" \
" D" "App Launcher" "(rofi-wayland)" \
" T" "Open File Manager" "(Thunar)" \
" Q" "Close active window" "" \
" Shift Q " "Kill active window" "" \
" Alt V" "Clipboard Manager" "(cliphist)" \
" W" "Choose wallpaper" "(Wallpaper Menu)" \
" Shift W" "Choose wallpaper effects" "(imagemagick + swww)" \
" B" "Hide/UnHide Waybar" "waybar" \
" CTRL B" "Choose waybar styles" "(waybar styles)" \
" ALT B" "Choose waybar layout" "(waybar layout)" \
" ALT R" "Reload Waybar swaync Rofi" "" \
" SHIFT N" "Launch Notification Panel" "(swaync)" \
" Print" "Screenshot" "(grim)" \
" Shift Print" "Screenshot region" "(grim + slurp)" \
" Shift S" "Screenshot region" "(swappy)" \
"ALT Print" "Screenshot active window" "" \
"CTRL ALT P" "Power menu" "(wlogout)" \
"CTRL ALT L" "Screen lock" "(hyprlock)" \
"CTRL ALT Del" "Hyprland Exit" "" \
" F" "Fullscreen" "" \
" ALT L" "Toggle Dwindle | Master Layout" "" \
" Shift F" "Toggle float" "(single window)" \
" ALT F" "Toggle all windows to float" "(all windows)" \
" ALT E" "Rofi Emoticons" ""\
" ALT V" "Clipboard Manager" "(cliphist))" \
" E" "View or Edit Keybinds, Settings, Monitor" "" \
"" "" "" \
"More tips:" "https://github.com/JaKooLit/Hyprland-Dots/wiki" ""\
