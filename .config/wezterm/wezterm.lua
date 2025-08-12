-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local my_colors = {
    white = "#EEEEEE",
    grey = "#696969",
    black = "#333333",
    green = "#7EA16B",
    orange = "#FA7921",
}

-- This is where you actually apply your config choices
-- config.font = wezterm.font("0xProto")
-- config.font = wezterm.font("3270 Nerd Font")
-- config.font = wezterm.font("BlexMono Nerd Font")
config.font = wezterm.font("Iosevka NF")
-- config.font = wezterm.font("VictorMono NF")
config.font_size = 14
config.line_height = 1.25

config.colors = {
    background = my_colors.white,
    foreground = my_colors.black,

    selection_bg = my_colors.black,
    selection_fg = my_colors.orange,

    split = my_colors.green,
}

config.inactive_pane_hsb = {
    saturation = 1,
    brightness = 0.3,
}
config.debug_key_events = true
config.hide_tab_bar_if_only_one_tab = true
wezterm.on("toggletabs", function(window, _)
    local overrides = window:get_config_overrides() or {}
    overrides.enable_tab_bar = not overrides.enable_tab_bar
    window:set_config_overrides(overrides)
end)
-- https://wezterm.org/config/lua/config/window_decorations.html
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

config.window_padding = {
    left = 320,
    right = 320,
    top = 100,
    bottom = 100,
}

config.keys = require("keybindings")

-- and finally, return the configuration to wezterm
return config
