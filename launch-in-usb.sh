#!/usr/bin/env bash

# Define the mount point for the USB drive
usb_mount_point="/run/media/richard/Ventoy"

# Mount the USB drive to the temporary directory
sudo mount /dev/sdb1 "$usb_mount_point"

# Copy the files from the USB to your local system
cp "$usb_mount_point/install-script-of-my-own" "$HOME/"
 
# Run the scripts
"$HOME/install-script-of-my-own/install.sh"
"$HOME/install-script-of-my-own/i3wmconfig.sh"

# Unmount the USB drive
sudo umount "$usb_mount_point"
