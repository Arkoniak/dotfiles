#!/bin/bash

CACHE_FOLDER=~/.cache/wallpaper
CURRENT_WALLPAPER=$CACHE_FOLDER/current_wallpaper
DEFAULT_WALLPAPER=~/Pictures/Wallpapers/default.jpg
BLURRED_WALLPAPER=/tmp/blurred_wallpaper.jpg

# Setup wallpaper
mkdir -p $CACHE_FOLDER

if [ -z $1 ]; then
    if [ -f $CURRENT_WALLPAPER ]; then
        WALLPAPER=$CURRENT_WALLPAPER
    else
        WALLPAPER=$DEFAULT_WALLPAPER
        ln -sf $WALLPAPER $CURRENT_WALLPAPER
    fi
else
    WALLPAPER=$1
    ln -sf $WALLPAPER $CURRENT_WALLPAPER
fi

# Generate blurred wallpaper for wlogout
magick $WALLPAPER -resize 75% -blur "50x30" $BLURRED_WALLPAPER

# Generate matugen palettes
matugen image $WALLPAPER -m "dark"

# Reload Waybar
sleep 0.5
$HOME/.config/waybar/scripts/launch.sh

# Update SwayNC
sleep 0.1
swaync-client -rs
