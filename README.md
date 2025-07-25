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
3. Restart `hyprland`, `waybar` and `swaync`

## Colors

Colors are generated with `matugen`, when `waypaper` sets new wallpaper. You can find corresponding palettes templates in `~/.config/matugen/templates` and distribution points in `~/.config/matugen/config.toml`

## Notifications

Notifications are generated with the help of `swaync`. If you update `style.css`, you can immediately see results with `swaync-client -rs` to refresh colors and `swaync-client -t` to see notification center itself.

If you need extra modifications, you can find complete `style.css` in `/etc/xdg/swaync/style.css`
