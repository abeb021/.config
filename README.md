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
- Modular configuration with multiple modules
- Hardware monitoring (CPU, RAM, battery)
- Audio controls (volume, media player)
- Network status (WiFi, Bluetooth)
- Workspace indicators
- Clock and language selector
- Theme indicator
- Notification counter

![waybar](assets/waybar.png)
***

### Wofi (Application Launcher)
- Multiple style variants
- Theme-aware styling
- Application launcher with icons
- Clipboard history integration

![wofi](assets/wofi.png)
***

### SwayNC (Notification Center)
- Notification daemon
- Media player controls
- Do not disturb mode
- Calendar integration

![swaync](assets/swaync.png)
***

### Theme Changer

<details>
<summary>Available themes</summary>
   
**Dark Themes:**
- Deep Blue
- Emerald
- Fiery Sunset
- Golden Amber
- Monochrome
- Obsidian
- Rose Pink

**Light Themes:**
- Macchiato
- Mocha

</details>

Themes can be changed via the theme switcher script or through waybar's theme module. All components (waybar, wofi, kitty, hyprland, hyprlock, hyprpaper) are automatically updated when switching themes.

![themes](assets/themes.png)
***

### Hyprlock (Lockscreen)
- Multiple theme variants matching the main theme
- Customizable appearance
- Screen lock integration with hypridle

![lockscreen](assets/lockscreen.png)
***

### Clipboard Manager (cliphist)
- Integrated with wofi
- Stores both text and images
- Accessible via `SUPER + V`
- Clear history with `SUPER + SHIFT + V`

![clipboard](assets/clipboard.png)
***

### Screenshot (hyprshot)
- Region selection (Print)
- Active window (Alt + Print)
- Full screen (SUPER + Print)
- Saves to ~/Pictures/Screenshots

***
      
</details>

<details>
<summary><b>Install</b></summary>

***
#### Requires Hyprland (Wayland compositor)
#### Install dependencies

1. ##### In Arch Linux:
   ```bash
   $ sudo pacman -S hyprland waybar hyprpaper hypridle hyprlock hyprsunset kitty wofi swaync playerctl brightnessctl ttf-jetbrains-mono-nerd ttf-font-awesome noto-fonts noto-fonts-emoji jq networkmanager wireplumber pipewire pipewire-pulse pipewire-alsa cliphist hyprshot yazi
   $ fc-cache -f -v
   ```

   Or use the provided setup script:
   ```bash
   $ chmod +x setup.sh
   $ ./setup.sh
   ```

2. ##### Additional dependencies (if not installed via setup.sh):
   - `cliphist` - Clipboard manager
   - `hyprshot` - Screenshot tool
   - `yazi` - File manager (terminal-based)

#### Install dotfiles
```bash
$ git clone <your-repo-url>
$ cd dotfiles
$ cp -r hypr waybar wofi swaync kitty ~/.config/
```

##### Post-installation:
1. Make scripts executable:
   ```bash
   $ chmod +x ~/.config/waybar/scripts/*.sh
   $ chmod +x ~/.config/hypr/hyprland/scripts/*.sh
   ```

2. Configure monitors in `~/.config/hypr/monitors.conf`

3. Set up wallpapers (themes include matching wallpapers in `hypr/assets/wallpapers/`)

4. Start Hyprland:
   ```bash
   $ Hyprland
   ```

***

</details>
<details>
<summary><b>Keybinding</b></summary>

***
| Keybinding            | Description                              |
| --------------------- | ---------------------------------------- |
| `SUPER + SHIFT + R`   | Reload Hyprland config                   |
| `SUPER + Q`           | Open terminal (kitty)                    |
| `SUPER + E`           | Open file manager (yazi)                 |
| `SUPER + A`           | Open app launcher (wofi)                 |
| `Print`               | Screenshot (region selection)            |
| `Alt + Print`         | Screenshot active window                 |
| `SUPER + Print`       | Screenshot full screen                   |
| `SUPER + V`           | Open clipboard manager                   |
| `SUPER + SHIFT + V`   | Clear clipboard history                  |
| `SUPER + L`           | Lock screen                              |
| `SUPER + P`           | Logout                                   |
| `SUPER + O`           | Exit Hyprland                            |
| `SUPER + R`           | Toggle floating mode                     |
| `SUPER + G`           | Toggle group                             |
| `SUPER + F`           | Fullscreen (pin)                         |
| `SUPER + F11`         | Fullscreen                               |
| `SUPER + C`           | Close focused window                     |
| `SUPER + B`           | Bluetooth toggle script                  |
| `XF86AudioPlay`       | Play/pause media                         |
| `XF86AudioNext`       | Next track                               |
| `XF86AudioPrev`       | Previous track                           |
| `XF86AudioRaiseVolume`| Increase volume                          |
| `XF86AudioLowerVolume`| Decrease volume                          |
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
| `ALT + Tab`                                          | Change active group            |
| `SUPER + Mouse Left`                                 | Move window                   |
| `SUPER + Mouse Right`                                | Resize window                 |

***

</details>
<details>
<summary><b>Mousebinding</b></summary>
   
***
| Mousebinding           | Description        |
| ---------------------- | -------------------|
| `SUPER + Left button`  | Move window        |
| `SUPER + Right button` | Resize window      |
***

</details>

<details>
<summary><b>Configuration Structure</b></summary>

***
### Tracked Directories:
- `hypr/` - Hyprland configuration (compositor, lockscreen, wallpapers)
- `waybar/` - Status bar configuration and themes
- `wofi/` - Application launcher configuration and themes
- `swaync/` - Notification center configuration
- `kitty/` - Terminal configuration and themes

### Key Files:
- `hypr/hyprland.conf` - Main Hyprland config (sources other configs)
- `hypr/hyprland/binds.conf` - Keybindings
- `waybar/config` - Waybar main configuration
- `waybar/scripts/theme-switcher.sh` - Theme switching script
- `setup.sh` - Installation script (optional)

***

</details>

<details>
<summary><b>TODO</b></summary>
   
***
- Add more theme variants
- Improve documentation
- Optimize configuration files
- Add more widget options
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
