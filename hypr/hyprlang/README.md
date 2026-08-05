# Deprecated hyprlang configs (Hyprland 0.55+ uses hyprland.lua)

This directory holds the old `.conf` configs that were replaced by Lua.

**Important:** After migrating to `hyprland.lua`, you must **log out and start a new Hyprland session** (not just `hyprctl reload`). Hyprland only picks `.lua` vs `.conf` at startup. A leftover or auto-generated `hyprland.conf` stub will override your real config if present.

## Layout

- `hyprland.conf` — former main entry (sources below)
- `monitors.conf`, `hyprland/*.conf`, `hyprland/themes/**/*.conf` — modular hyprland config
- `invalid-lua/` — auto-generated `.lua` files that do not apply:
  - Hyprland sub-configs are under `../hyprland/` and `../hyprland.lua`
  - hyprlock, hyprpaper, hypridle, hyprsunset still use `.conf` in the parent `hypr/` dir

## Active config

| Component   | Active file                          |
|------------|---------------------------------------|
| Hyprland   | `../hyprland.lua`                     |
| Theme pick | `../hyprland/active_theme.lua`        |
| hyprlock   | `../hyprlock.conf`                    |
| hyprpaper  | `../hyprpaper.conf`                   |
| hypridle   | `../hypridle.conf`                    |
| hyprsunset | `../hyprsunset.conf`                  |

Do not delete without a backup; kept for reference and rollback.

Verify config anytime:

```bash
Hyprland --verify-config --config ~/.config/hypr/hyprland.lua
```
