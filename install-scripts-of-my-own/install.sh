#!/usr/bin/env bash

# Define variables
aur_pkg_manager="yay"
packages=(
    discord
    zip
    unzip
    steam
    i3
    wine
    git
    lutris
    jdk-openjdk
    jre-openjdk
    feh
)

# Define functions
install_packages() {
    echo "Installing packages..."
    sudo pacman -S "${packages[@]}"
}

clone_git_repo() {
    echo "Cloning Git repository..."
    git clone "$1"
    cd "$(basename "$1" .git)"
    makepkg -si
}

install_aur_package() {
    echo "Installing $1 from AUR..."
    "$aur_pkg_manager" -S "$1"
}

download_appimage() {
    echo "Downloading $1..."
    wget "$1"
    chmod +x "$(basename "$1")"
}
 
run_appimage() {
    echo "Running Appimage..."
    "$1" &
    APP_PID=$!
    wait $APP_PID
}

# Main script
install_packages
clone_git_repo https://aur.archlinux.org/yay.git

sleep 0.5s

install_aur_package grapejuice

sleep 1s

install_aur_package zoom

sleep 1s

install_aur_package mangohud
install_aur_package protonup-qt

sleep 1s

install_aur_package picom-git
install_aur_package an-anime-game-launcher-bin
install_aur_package lunar-client

sleep 1s

#Minor Configuration


#Define the Appimage 
appimage_file="~/BetterDiscord-Linux.AppImage"

#Install Appimage file

download_appimage https://github.com/BetterDiscord/Installer/releases/latest/download/BetterDiscord-Linux.AppImage

chmod +x "$appimage_file"

run_appimage "$appimage_file"

echo "Installer basically done"