---@module 'hl'

hl.config({
    gestures = {
        workspace_swipe_invert = true,
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "up", action = "fullscreen", mode = "1" })
hl.gesture({ fingers = 3, direction = "down", action = "fullscreen", mode = "0" })

hl.config({
    input = {
        kb_layout  = "us,ru",
        kb_options = "caps:escape,grp:win_space_toggle",
        follow_mouse = 1,
        sensitivity = 0.3,
        accel_profile = "flat",
        repeat_rate = 30,
        repeat_delay = 200,
        touchpad = {
            natural_scroll = true,
            disable_while_typing = true,
            tap_to_click = true,
            scroll_factor = 0.2,
        },
    },
})
