#!/bin/bash
#                    __
#  _    _____ ___ __/ /  ___ _____
# | |/|/ / _ `/ // / _ \/ _ `/ __/
# |__,__/\_,_/\_, /_.__/\_,_/_/
#            /___/
#

WAYBAR_DISABLED=$HOME/.config/waybar/.waybar-disabled
WAYBAR_CONFIG=$HOME/.config/waybar/config.jsonc
WAYBAR_STYLE=$HOME/.config/waybar/style.css

# -----------------------------------------------------
# Prevent duplicate launches: only the first parallel
# invocation proceeds; all others exit immediately.
# -----------------------------------------------------
exec 200>/tmp/waybar-launch.lock
flock -n 200 || exit 0

kill_proc() {
    local proc_name="$1"

    if pgrep -x "$proc_name" > /dev/null; then
        pkill -x "$proc_name"
    fi
}

kill_proc waybar
sleep 0.2

# Check if waybar-disabled file exists
if [ ! -f $WAYBAR_DISABLED ]; then
    waybar -c $WAYBAR_CONFIG -s $WAYBAR_STYLE &
else
    echo ":: Waybar disabled"
fi

# Explicitly release the lock (optional) -> flock releases on exit
flock -u 200
exec 200>&-
