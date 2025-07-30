#!/bin/bash

# Collect player list
players=$(playerctl -l 2>/dev/null)

# By default nothing is playing
block=false

for player in $players; do
    if [ "$player" = "spotify" ]; then
        continue  # ignoring Spotify
    fi

    status=$(playerctl -p "$player" status 2>/dev/null)

    if [ "$status" = "Playing" ]; then
        block=true
        break
    fi
done


if $block; then
    exit 0  # blocking timeout
else
    exit 1  # allowing timeout
fi

