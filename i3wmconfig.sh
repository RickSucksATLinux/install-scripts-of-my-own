#!/usr/bin/env bash

# Define variables
config_file="$HOME/.config/i3/config"
background_file="$HOME/Pictures/background.jpg"
picom_options="-b --config $HOME/.config/picom.conf"

# Define functions
set_background() {
    local file="$1"
    local line_exists=$(grep -c "^exec_always --no-startup-id feh --bg-fill $file" "$config_file")
    if [[ "$line_exists" -eq 0 ]]; then
        echo "Setting background to $file"
        echo "exec --no-startup-id feh --bg-fill $file" >> "$config_file"
    else
        echo "Background line already exists in i3wm config file"
    fi
}

set_picom() {
    local options="$1"
    local line_exists=$(grep -c "^exec_always --no-startup-id picom $options" "$config_file")
    if [[ "$line_exists" -eq 0 ]]; then
        echo "Setting Picom with options $options"
        echo "exec --no-startup-id picom $options" >> "$config_file"
    else
        echo "Picom line already exists in i3wm config file"
    fi
}

# Main script
cp -r /run/media/richard/Ventoy/install-scripts-of-my-own $HOME/Pictures
set_background "$background_file"
set_picom "$picom_options"
echo "font pango:monospace 0" >> ~/.config/i3/config
sed -i '/^bar {/,$d' "$config_file"
