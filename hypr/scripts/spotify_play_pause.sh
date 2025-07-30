#!/bin/bash

if ! pgrep -ix spotify > /dev/null; then
    spotify && sleep 5
fi

playerctl -p spotify play-pause
