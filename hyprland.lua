local active_border_color = "rgba(FFFFFF26)"
local inactive_border_color = "rgba(FFFFFF03)"

hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 3,
    border_size = 2,

    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  decoration = {
    rounding = 23,

    shadow = {
      enabled = true,
      render_power = 3,
      range = 18,
      color = "rgba(120e0a99)",
    },

    blur = {
      enabled = true,
      size = 10,
      passes = 4,
      new_optimizations = true,
      ignore_opacity = true,
      xray = false,
      noise = 0.0,
      contrast = 1.05,
      brightness = 0.85,
      vibrancy = 0.2,
      vibrancy_darkness = 0.0,
    },
  },

  animations = {
    enabled = true,
  },
})

-- --- Glass / consistency ---------------------------------------------------
-- All standard windows glassy + blurred (overrides Omarchy's subtle 0.985/0.96).
-- Media/Steam/browsers keep their Omarchy opt-out (opacity 1) so photos, video
-- and web pages stay solid; this only hits windows still tagged default-opacity.
-- Registered after Omarchy's own default-opacity rule, so it wins.
o.window({ tag = "default-opacity" }, { opacity = "1 0.84" })

-- Blur layer-shell surfaces to match the window glass. These are the quickshell
-- namespaces Omarchy 4.x actually creates (there is no swayosd/mako/waybar, and
-- the walker launcher is gone -- its replacement, omarchy-menu, is already
-- pinned to no animation by Omarchy).
-- A surface only shows the blur if its own background is translucent, which is
-- `background-alpha` in ~/.config/omarchy/shell.toml: the bar is already at
-- 0.5; notifications and popups ship at 1.0 and need lowering to show blur.
hl.layer_rule({ match = { namespace = "omarchy-osd" }, blur = true, ignore_alpha = 0.3 })
hl.layer_rule({ match = { namespace = "omarchy-notifications" }, blur = true, ignore_alpha = 0.3 })
hl.layer_rule({ match = { namespace = "omarchy-bar" }, blur = true, blur_popups = true, ignore_alpha = 0.3 })
hl.layer_rule({ match = { namespace = "omarchy-menu" }, blur = true, ignore_alpha = 0.3 })
hl.layer_rule({ match = { namespace = "omarchy-polkit" }, blur = true, ignore_alpha = 0.3 })
hl.layer_rule({ match = { namespace = "omarchy-popups" }, blur = true, ignore_alpha = 0.3 })

hl.layer_rule({ match = { namespace = "omarchy-menu" }, no_anim = false, animation = "fade" })

-- Quick animation windows
-- Credit: END4 (https://github.com/end-4)
hl.curve("emphasizedDecel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("emphasizedAccel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("menu_decel", { type = "bezier", points = { { 0.05, 1 }, { 0, 1 } } })
hl.curve("menu_accel", { type = "bezier", points = { { 0.52, 0.03 }, { 0.72, 0.08 } } })

-- Curves first: hl.animation rejects an unknown bezier name.
hl.animation({ leaf = "workspaces", enabled = true, speed = 7, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 2.8, bezier = "emphasizedDecel", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 1.2, bezier = "emphasizedAccel", style = "slidevert" })
