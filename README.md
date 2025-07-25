# dotfiles
Collection of configurations for my manjaro setup

## General subsystems

- Desktop Manager
    - `hypr`
- Info panel
    - `waybar`
- Shutdown/Susupend/Logout
    - `wlogout`
- Notification center
    - `swaync`
    - `swaync-client`
- GUI password prompt
    - `/usr/lib/hyprpolkitagent/hyprpolkitagent`
- Wallpaper
    - `waypaper`
    - `swww`
- Colors
    - `matugen`


## Wallpaper
Wallpapers are set with the help of `waypaper`.

To launch properly `~/.config/hypr/scripts/wallpaper_rotate.sh`, or for one-shot
```bash
waypaper --random
```

When `waypaper` initiates it sets random wallpaper from the Wallpapers directory (exact path is written in `~/.config/waypaper/config.ini`) and afterwards applies `postprocess.sh`.

Postprocessing includes following steps
1. Create symlink to the new wallpaper in `~/.cache/wallpaper/current_wallpaper`
2. Generates colorschemes with the help of `matugen`  which are distributed throughout configs.
3. Restart `hyprland` and `waybar`
