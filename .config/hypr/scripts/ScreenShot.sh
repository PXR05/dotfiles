#!/bin/bash
# Screenshots scripts

iDIR="$HOME/.config/swaync/icons"
sDIR="$HOME/.config/hypr/scripts"
notify_cmd_shot="notify-send -h string:x-canonical-private-synchronous:shot-notify -u low -i ${iDIR}/picture.png"

time=$(date "+%d-%b_%H-%M-%S")
dir="$(xdg-user-dir)/Pictures/Screenshots"
file="Screenshot_${time}_${RANDOM}.png"

active_window_class=$(hyprctl -j activewindow | jq -r '(.class)')
active_window_file="Screenshot_${time}_${active_window_class}.png"
active_window_path="${dir}/${active_window_file}"

# notify and view screenshot
notify_view() {
    if [[ "$1" == "active" ]]; then
        if [[ -e "${active_window_path}" ]]; then
            "Screenshot of '${active_window_class}' Saved."
        else
            "Screenshot of '${active_window_class}' not Saved"
        fi
    elif [[ "$1" == "swappy" ]]; then
		"Screenshot Captured."
    else
        local check_file="$dir/$file"
        if [[ -e "$check_file" ]]; then
            "Screenshot Saved."
        else
            "Screenshot NOT Saved."
        fi
    fi
}



# countdown
countdown() {
	for sec in $(seq $1 -1 1); do
		notify-send -h string:x-canonical-private-synchronous:shot-notify -t 1000 -i "$iDIR"/timer.png "Taking shot in : $sec"
		sleep 1
	done
}

# take shots
shotnow() {
	cd ${dir} && grim - | tee "$file" | wl-copy
	sleep 2
	notify_view
}

shotarea() {
	tmpfile=$(mktemp)
	grim -g "$(slurp)" - >"$tmpfile"
	if [[ -s "$tmpfile" ]]; then
		wl-copy <"$tmpfile"
		mv "$tmpfile" "$dir/$file"
	fi
	rm "$tmpfile"
	notify_view
}

shotactive() {
    active_window_class=$(hyprctl -j activewindow | jq -r '(.class)')
    active_window_file="Screenshot_${time}_${active_window_class}.png"
    active_window_path="${dir}/${active_window_file}"

    hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - "${active_window_path}"
	sleep 1
    notify_view "active"  
}

shotswappy() {
	tmpfile=$(mktemp)
	grim -g "$(slurp)" - >"$tmpfile" && "${sDIR}/Sounds.sh" --screenshot && notify_view "swappy"
	swappy -f - <"$tmpfile"
	rm "$tmpfile"
}


if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

if [[ "$1" == "--now" ]]; then
	shotnow
elif [[ "$1" == "--area" ]]; then
	shotarea
elif [[ "$1" == "--active" ]]; then
	shotactive
elif [[ "$1" == "--swappy" ]]; then
	shotswappy
else
	echo -e "Available Options : --now --area --active --swappy"
fi

exit 0
