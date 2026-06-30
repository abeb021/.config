<div align = center>

<img src="https://raw.githubusercontent.com/hyprwm/Hyprland/main/assets/header.svg" width="750" height="300" alt="banner">

<br>

# Dotfiles
## Just got some dotfiles from programming community chat in telegram and remade them!

</div>
<details>
<summary><b>Screenshots</b></summary>

***
![screenshot](assets/screenshot.png)
***

</details>
<details>
<summary><b>Components</b></summary>
   
***
### Waybar (Status Bar)
- Modular configuration with JSONC modules
- Hardware monitoring (CPU, RAM) — click opens btop
- Audio controls (volume, media player via mpris)
- WiFi status and network manager (nmtui)
- Workspace indicators, clock, language selector
- Theme switcher module
- Notification counter (swaync)
- System tray and battery/backlight modules

![waybar](assets/waybar.png)
***

### Wofi (Application Launcher)
- Theme-aware styling synced with the active dotfile theme
- Application launcher (`SUPER + A`)
- Clipboard history picker (`SUPER + V`)

![wofi](assets/wofi.png)
***

### SwayNC (Notification Center)
- Notification daemon
- Do not disturb mode
- Styled to match the obsidian palette (not switched by the theme menu)

![swaync](assets/swaync.png)
***

### Theme Changer

<details>
<summary>Available themes</summary>
   
**Dark Themes (via waybar theme module or `theme-switcher.sh`):**
- Deep Blue
- Emerald
- Fiery Sunset
- Golden Amber
- Gray
- Monochrome (strict black and white)
- Obsidian
- Rose Pink

**Light Themes (legacy — present on disk, not fully compatible with current config schema):**
- Macchiato
- Mocha

</details>

Themes can be changed via the waybar theme module or:

```bash
~/.config/waybar/scripts/theme-switcher.sh <theme-name>
```

Switching updates **waybar, wofi, kitty, hyprland, hyprlock, and hyprpaper**. SwayNC is not part of the theme switcher.

![themes](assets/themes.png)
***

### Hyprlock (Lockscreen)
- Theme variants matching dark dotfile themes
- Integrated with hypridle for idle locking
- Triggered with `SUPER + L` or `SUPER + P`

![lockscreen](assets/lockscreen.png)
***

### Hypridle / Hyprsunset
- **hypridle** — dims screen, locks session, turns off display, suspend/hibernate on idle
- **hyprsunset** — blue-light filter with time-based profiles

***

### Clipboard Manager (cliphist)
- Integrated with wofi
- Stores both text and images (via wl-paste watchers in autostart)
- Open history: `SUPER + V`
- Clear history: `SUPER + SHIFT + V`

![clipboard](assets/clipboard.png)
***

### Screenshot (hyprshot)
- Region selection (`Print`)
- Active window (`Alt + Print`)
- Focused window (`SUPER + Print`)
- Saves to `~/Pictures/Screenshots`

***
      
</details>

<details>
<summary><b>Install</b></summary>

***
#### Requires Arch Linux and Hyprland

**Recommended:** run the setup script from this repository (installs packages, enables PipeWire, creates directories):

```bash
git clone <your-repo-url> ~/.config
cd ~/.config
chmod +x setup.sh
./setup.sh
```

The script installs the Hyprland stack, waybar, wofi, kitty, swaync, clipboard/screenshot tools, PipeWire, portals, fonts, and desktop integration packages. See `setup.sh` for the full package list.

**Manual install (Arch):**

```bash
sudo pacman -S hyprland waybar hyprpaper hypridle hyprlock hyprsunset \
  kitty wofi swaync libnotify wl-clipboard cliphist hyprshot grim slurp \
  pipewire pipewire-pulse wireplumber pulsemixer playerctl brightnessctl \
  polkit-gnome yazi networkmanager wireless_tools iw \
  dracula-gtk-theme qt6ct xdg-desktop-portal xdg-desktop-portal-hyprland \
  xdg-desktop-portal-gtk gsettings-desktop-schemas \
  ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols ttf-font-awesome \
  noto-fonts noto-fonts-emoji jq git
fc-cache -f -v
```

Enable audio services:

```bash
systemctl --user enable --now pipewire pipewire-pulse wireplumber
```

##### Post-installation

1. Make scripts executable:
   ```bash
   chmod +x ~/.config/waybar/scripts/*.sh
   chmod +x ~/.config/hypr/hyprland/scripts/*.sh
   ```

2. Configure monitors in `~/.config/hypr/monitors.conf`

3. Set wallpapers in `~/.config/hypr/hyprpaper.conf` (matching images in `hypr/assets/wallpapers/`)

4. Adjust machine-specific values if needed:
   - WiFi interface in `waybar/scripts/wifi.sh`
   - Backlight device in binds and waybar backlight module
   - Bluetooth device in `hypr/hyprland/scripts/bluetooth.sh`
   - Keyboard layout device in `waybar/modules/language.jsonc`

5. Start Hyprland:
   ```bash
   Hyprland
   ```

***

</details>
<details>
<summary><b>Keybinding</b></summary>

***
| Keybinding            | Description                              |
| --------------------- | ---------------------------------------- |
| `SUPER + SHIFT + R`   | Reload Hyprland config and restart waybar, hyprpaper, hyprsunset |
| `SUPER + Q`           | Open terminal (kitty)                    |
| `SUPER + E`           | Open file manager (yazi)                 |
| `SUPER + A`           | Open app launcher (wofi)                 |
| `Print`               | Screenshot (region selection)            |
| `Alt + Print`         | Screenshot active window                 |
| `SUPER + Print`       | Screenshot focused window                |
| `SUPER + V`           | Open clipboard manager                   |
| `SUPER + SHIFT + V`   | Clear clipboard history                  |
| `SUPER + L`           | Lock screen (hyprlock)                   |
| `SUPER + P`           | Lock screen (hyprlock)                   |
| `SUPER + O`           | Exit Hyprland session                    |
| `SUPER + R`           | Toggle floating mode                     |
| `SUPER + G`           | Toggle group                             |
| `SUPER + F`           | Fullscreen (pin)                         |
| `SUPER + F11`         | Fullscreen                               |
| `SUPER + C`           | Close focused window                     |
| `SUPER + B`           | Bluetooth toggle script (paired device)  |
| `XF86AudioPlay`       | Play/pause media                         |
| `XF86AudioNext`       | Next track                               |
| `XF86AudioPrev`       | Previous track                           |
| `XF86AudioRaiseVolume`| Increase volume (wpctl)                  |
| `XF86AudioLowerVolume`| Decrease volume (wpctl)                  |
| `XF86AudioMute`       | Toggle mute                              |
| `XF86MonBrightnessUp` | Increase brightness                      |
| `XF86MonBrightnessDown`| Decrease brightness                     |

| Window Management                                    | Description                   |
| ---------------------------------------------------- | ----------------------------- |
| `SUPER + Left/Right/Up/Down`                         | Move focus                    |
| `SUPER + SHIFT + Left/Right/Up/Down`                 | Resize active window          |
| `SUPER + 1-9,0`                                      | Switch workspace              |
| `SUPER + SHIFT + 1-9,0`                              | Move window to workspace      |
| `SUPER + Tab`                                        | Cycle next window             |
| `ALT + Tab`                                          | Change active group           |
| `SUPER + Mouse Left`                                 | Move window                   |
| `SUPER + Mouse Right`                                | Resize window                 |

***

</details>

<details>
<summary><b>Configuration Structure</b></summary>

***
### Tracked Directories
- `hypr/` — Hyprland, hyprlock, hypridle, hyprpaper, hyprsunset, wallpapers
- `waybar/` — Status bar configuration, modules, and themes
- `wofi/` — Application launcher configuration and themes
- `swaync/` — Notification center configuration
- `kitty/` — Terminal configuration and themes

### Key Files
- `hypr/hyprland.conf` — Main Hyprland config (sources modular configs)
- `hypr/hyprland/binds.conf` — Keybindings
- `hypr/hyprland/autostart.conf` — Startup services
- `waybar/config` — Waybar main configuration
- `waybar/scripts/theme-switcher.sh` — Theme switching script
- `setup.sh` — Arch Linux installation script

***

</details>

***
## If you have any problems or questions, feel free to text me!

### See also
- [Hyprland](https://hyprland.org/)
- [Waybar](https://github.com/Alexays/Waybar)
- [Wofi](https://hg.sr.ht/~scoopta/wofi)
- [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)
- [Kitty](https://sw.kovidgoyal.net/kitty/)
