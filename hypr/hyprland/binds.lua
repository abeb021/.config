---@module 'hl'

local mainMod = "SUPER"
local terminal = "kitty"
local menu = "wofi --show drun"
local explorer = "kitty --title='Yazi' -e yazi"
local logout = "hyprlock"

-- Window resize (repeating)
hl.bind("SUPER + SHIFT + left",  hl.dsp.window.resize({ x = -30, y = 0, relative = true }),  { repeating = true })
hl.bind("SUPER + SHIFT + right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }),   { repeating = true })
hl.bind("SUPER + SHIFT + up",    hl.dsp.window.resize({ x = 0, y = -30, relative = true }),  { repeating = true })
hl.bind("SUPER + SHIFT + down",  hl.dsp.window.resize({ x = 0, y = 30, relative = true }),   { repeating = true })

-- Mouse window control
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Window management
hl.bind(mainMod .. " + R",   hl.dsp.window.float())
hl.bind(mainMod .. " + G",   hl.dsp.group.toggle())
hl.bind("ALT + tab",         hl.dsp.group.next())
hl.bind(mainMod .. " + F",   hl.dsp.window.fullscreen(1))
hl.bind(mainMod .. " + F11", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + C",   hl.dsp.window.close())
hl.bind(mainMod .. " + tab", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + tab", hl.dsp.window.bring_to_top())

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Apps
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(explorer))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(menu))

hl.bind("ALT + Print",       hl.dsp.exec_cmd("hyprshot -m active -o ~/Pictures/Screenshots"))
hl.bind("Print",             hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/Screenshots"))

hl.bind(mainMod .. " + O", hl.dsp.exit())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(logout))

hl.bind(mainMod .. " + V", hl.dsp.exec_cmd('cliphist list | wofi --dmenu --allow-image -p "Clipboard" | cliphist decode | wl-copy'))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd('cliphist wipe && notify-send "Clipboard" "All clipboard history cleared"'))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload && killall waybar && waybar && killall hyprpaper && hyprpaper && killall hyprsunset && hyprsunset"))

-- Workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Media keys
hl.bind("XF86AudioPlay",       hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext",        hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPrev",        hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e -d intel_backlight set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e -d intel_backlight set 5%-"), { locked = true, repeating = true })

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/bluetooth.sh"))
