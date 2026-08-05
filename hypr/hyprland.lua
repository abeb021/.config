---@module 'hl'

-- Load active theme (see hyprland/active_theme.lua; updated by theme-switcher.sh)
package.loaded["hyprland.theme"] = require(require("hyprland.active_theme"))

require("monitors")
require("hyprland.env")
require("hyprland.general")
require("hyprland.input")
require("hyprland.decoration")
require("hyprland.animations")
require("hyprland.workspace")
require("hyprland.binds")
require("hyprland.misc")
require("hyprland.rules")
require("hyprland.autostart")
require("hyprland.layouts")
