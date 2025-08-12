-- This philosophy of this colorscheme and its implementation are described
-- here. This is meant to be fairly rigid code that may not be particularly
-- elegant but is very clear. Excessively verbose, one could say.

-- Colorscheme philosophy.

-- Implementation.

local M = {}

local colors = {
    white = "#EEEEEE",
    grey = "#696969",
    dark = "#333333",
    green = "#7EA16B",
    orange = "#FA7921",
}

local base_groups = {
    code = { bg = colors.white, fg = colors.dark },
    comment = { bg = colors.white, fg = colors.grey },
    pop = { bg = colors.white, fg = colors.green },
    problem = { bg = colors.white, fg = colors.orange },
}

function invert(group)
    return {
        bg = group.fg,
        fg = group.bg,
    }
end

function set(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

function M.load()
    -- Clear all existing highlights
    vim.cmd("hi clear")
    vim.cmd("syntax reset")
    
    -- Set all syntax groups to use base_groups.code
    local highlights = vim.api.nvim_get_hl(0, {})
    for name, _ in pairs(highlights) do
        if name == "Normal" then
            print("Found Normal!")
        end
        vim.api.nvim_set_hl(0, name, base_groups.code)
    end
    
    -- Set comments to use base_groups.comment
    set("Comment", base_groups.comment)
    set("@comment", base_groups.comment)
    set("@comment.error", base_groups.comment)
    set("@comment.note", base_groups.comment)
    set("@comment.todo", base_groups.comment)
    set("@comment.warning", base_groups.comment)
    set("@lsp.type.comment", base_groups.comment)
    
    -- Set visual selection to invert the code group
    set("Visual", invert(base_groups.code))
    
    -- Set cursor and diagnostics to use pop
    set("Cursor", base_groups.pop)
    set("DiagnosticError", base_groups.pop)
    set("DiagnosticWarn", base_groups.pop)
    set("DiagnosticInfo", base_groups.pop)
    set("DiagnosticHint", base_groups.pop)

    local diagnostic_groups = {
        "DiagnosticDeprecated",
        "DiagnosticError",
        "DiagnosticFloatingError",
        "DiagnosticFloatingHint",
        "DiagnosticFloatingInfo",
        "DiagnosticFloatingOk",
        "DiagnosticFloatingWarn",
        "DiagnosticHint",
        "DiagnosticInfo",
        "DiagnosticOk",
        "DiagnosticSignError",
        "DiagnosticSignHint",
        "DiagnosticSignInfo",
        "DiagnosticSignOk",
        "DiagnosticSignWarn",
        "DiagnosticUnderlineError",
        "DiagnosticUnderlineHint",
        "DiagnosticUnderlineInfo",
        "DiagnosticUnderlineOk",
        "DiagnosticUnderlineWarn",
        "DiagnosticUnnecessary",
        "DiagnosticVirtualLinesError",
        "DiagnosticVirtualLinesHint",
        "DiagnosticVirtualLinesInfo",
        "DiagnosticVirtualLinesOk",
        "DiagnosticVirtualLinesWarn",
        "DiagnosticVirtualTextError",
        "DiagnosticVirtualTextHint",
        "DiagnosticVirtualTextInfo",
        "DiagnosticVirtualTextOk",
        "DiagnosticVirtualTextWarn",
        "DiagnosticWarn",
    }
    for _, group in ipairs(diagnostic_groups) do
        set(group, base_groups.problem)
    end



    -- https://github.com/echasnovski/mini.pick/blob/v0.16.0/lua/mini/pick.lua#L116-L133
    set("MiniPickBorder", base_groups.code) -- window border.
    set("MiniPickBorderBusy", base_groups.problem) -- window border while picker is busy processing.
    set("MiniPickBorderText", base_groups.code) -- non-prompt on border.
    set("MiniPickCursor", base_groups.pop) -- cursor during active picker (hidden by default).
    set("MiniPickIconDirectory", base_groups.comment) -- default icon for directory.
    set("MiniPickIconFile", base_groups.comment) -- default icon for file.
    set("MiniPickHeader", base_groups.code) -- headers in info buffer and previews.
    set("MiniPickMatchCurrent", base_groups.pop) -- current matched item.
    set("MiniPickMatchMarked", base_groups.pop) -- marked matched items.
    set("MiniPickMatchRanges", base_groups.pop) -- ranges matching query elements.
    set("MiniPickNormal", base_groups.code) -- basic foreground/background highlighting.
    set("MiniPickPreviewLine", invert(base_groups.code)) -- target line in preview.
    set("MiniPickPreviewRegion", base_groups.code) -- target region in preview.
    set("MiniPickPrompt", base_groups.code) -- prompt.
    set("MiniPickPromptCaret", base_groups.code) -- caret in prompt.
    set("MiniPickPromptPrefix", base_groups.code) -- prefix of the prompt.
    
    vim.notify("Applied minimal highlighting")
end

return M
