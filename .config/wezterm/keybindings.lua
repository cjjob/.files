local wezterm = require("wezterm")
local act = wezterm.action

local keys = {
    {
        key = "o",
        mods = "SUPER",
        action = wezterm.action.EmitEvent("toggletabs"),
    },
    -- Split panes.
    {
        key = "v",
        mods = "SUPER|SHIFT",
        action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "h",
        mods = "SUPER|SHIFT",
        action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    -- Focus panes.
    {
        key = "UpArrow",
        mods = "SUPER",
        action = act.ActivatePaneDirection("Up"),
    },
    {
        key = "DownArrow",
        mods = "SUPER",
        action = act.ActivatePaneDirection("Down"),
    },
    {
        key = "LeftArrow",
        mods = "SUPER",
        action = act.ActivatePaneDirection("Left"),
    },
    {
        key = "RightArrow",
        mods = "SUPER",
        action = act.ActivatePaneDirection("Right"),
    },
    -- Resize panes.
    {
        key = "i",
        mods = "SUPER",
        action = act.AdjustPaneSize({ "Up", 2 }),
    },
    {
        key = "k",
        mods = "SUPER",
        action = act.AdjustPaneSize({ "Down", 2 }),
    },
    {
        key = "j",
        mods = "SUPER",
        action = act.AdjustPaneSize({ "Left", 2 }),
    },
    {
        key = "l",
        mods = "SUPER",
        action = act.AdjustPaneSize({ "Right", 2 }),
    },

    -- Delete the whole line (SUPER+Backspace).
    {
        key = "Backspace",
        mods = "SUPER",
        action = act.SendKey({
            key = "u",
            mods = "CTRL",
        }),
    },
    -- Ignore CTRL+Down.
    -- TODO: My Copilot CTRL+Down isn't working.
    -- I thought WezTerm was intercepting. But, this hasn't fixed.
    {
        key = "DownArrow",
        mods = "CTRL",
        action = act.DisableDefaultAssignment,
    },
}

return keys
