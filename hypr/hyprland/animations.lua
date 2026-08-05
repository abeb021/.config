---@module 'hl'

hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("cyberEase", { type = "bezier", points = { {0.06, 1.2}, {-0.08, 1.02} } })
hl.curve("outBack",   { type = "bezier", points = { {0.08, 0.98}, {0, 1.03} } })
hl.curve("inBack",    { type = "bezier", points = { {0.3, -0.3}, {0, 1} } })
hl.curve("quick",     { type = "bezier", points = { {0.25, 0.1}, {0.25, 1.0} } })

hl.animation({ leaf = "windows",         enabled = true, speed = 2, bezier = "quick", style = "slide" })
hl.animation({ leaf = "windowsIn",       enabled = true, speed = 2, bezier = "quick", style = "popin 95%" })
hl.animation({ leaf = "windowsOut",      enabled = true, speed = 3, bezier = "quick", style = "popin 85%" })
hl.animation({ leaf = "windowsMove",     enabled = true, speed = 2, bezier = "quick", style = "slide" })
hl.animation({ leaf = "layers",          enabled = true, speed = 2, bezier = "quick", style = "popin 95%" })
hl.animation({ leaf = "layersIn",        enabled = true, speed = 2, bezier = "quick", style = "popin 95%" })
hl.animation({ leaf = "layersOut",       enabled = true, speed = 3, bezier = "quick", style = "popin 85%" })
hl.animation({ leaf = "workspaces",      enabled = true, speed = 6, bezier = "cyberEase", style = "slidefade 10%" })
hl.animation({ leaf = "fade",            enabled = true, speed = 12, bezier = "default" })
hl.animation({ leaf = "fadeIn",          enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fadeOut",         enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fadeDim",         enabled = true, speed = 6, bezier = "default" })
hl.animation({ leaf = "border",          enabled = true, speed = 8, bezier = "quick" })
hl.animation({ leaf = "borderangle",     enabled = true, speed = 6, bezier = "quick" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 5, bezier = "cyberEase", style = "slidevert" })
