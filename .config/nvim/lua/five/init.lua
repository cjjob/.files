local vim = vim

local M = {}

local five = {
    white = "#EEEEEE",
    grey = "#696969",
    dark = "#333333",
    green = "#7EA16B",
    orange = "#FA7921",
}

local base_groups = {
    code = { bg = five.white, fg = five.dark },
    comment = { bg = five.white, fg = five.grey },
    pop = { bg = five.white, fg = five.green },
    problem = { bg = five.white, fg = five.orange },
}

local function invert(group)
    return {
        bg = group.fg,
        fg = group.bg,
    }
end

local function extend(group, opts)
    return vim.tbl_extend("force", group, opts)
end

local function set(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

function M.load()
    -- Clear all existing highlights
    vim.cmd("hi clear")
    vim.cmd("syntax reset")

    vim.g.colors_name = "five"

    -- Set all syntax groups to use base_groups.code
    local highlights = vim.api.nvim_get_hl(0, {})
    for name, _ in pairs(highlights) do
        vim.api.nvim_set_hl(0, name, base_groups.code)
    end

    set("Comment", base_groups.comment)
    set("@comment", base_groups.comment)
    set("@comment.error", base_groups.comment)
    set("@comment.note", base_groups.comment)
    set("@comment.todo", base_groups.comment)
    set("@comment.warning", base_groups.comment)
    set("@lsp.type.comment", base_groups.comment)

    -- Permanent groups.
    set("Cursor", base_groups.pop)
    set("StatusLine", invert(base_groups.code))
    set("StatusLineNC", invert(base_groups.code)) -- StatusLine for non-current windows.
    set("Visual", invert(base_groups.code))

    -- Menus
    set("Pmenu", invert(base_groups.code))
    set("PmenuSel", extend(base_groups.pop, { bold = true }))
    set("MiniCompletionActiveParameter", { fg = "pink", bold = true })
    set("MiniCompletionInfoBorderOutdated", { fg = "red", bold = true })

    set("Yank", invert(base_groups.pop))

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

    -- https://github.com/echasnovski/mini.jump2d/blob/v0.16.0/lua/mini/jump2d.lua#L112-L137
    set("MiniJump2dSpot", extend(base_groups.pop, { bold = true })) -- highlighting of jump spot's next step.
    set("MiniJump2dSpotUnique", extend(base_groups.pop, { bold = true, fg = "red" })) -- highlighting of jump spot's next step if it has unique label.
    set("MiniJump2dSpotAhead", base_groups.problem) -- highlighting of jump spot's future steps.
    set("MiniJump2dDim", base_groups.comment) -- highlighting of lines with at least one jump spot.

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

    -- https://github.com/MeanderingProgrammer/render-markdown.nvim?tab=readme-ov-file#colors
    set("RenderMarkdownH1", base_groups.pop) -- H1 icons.
    set("RenderMarkdownH2", base_groups.pop) -- H2 icons.
    set("RenderMarkdownH3", base_groups.pop) -- H3 icons.
    set("RenderMarkdownH4", base_groups.pop) -- H4 icons.
    set("RenderMarkdownH5", base_groups.pop) -- H5 icons.
    set("RenderMarkdownH6", base_groups.pop) -- H6 icons.
    set("RenderMarkdownH1Bg", base_groups.code) -- H1 background line.
    set("RenderMarkdownH2Bg", base_groups.code) -- H2 background line.
    set("RenderMarkdownH3Bg", base_groups.code) -- H3 background line.
    set("RenderMarkdownH4Bg", base_groups.code) -- H4 background line.
    set("RenderMarkdownH5Bg", base_groups.code) -- H5 background line.
    set("RenderMarkdownH6Bg", base_groups.code) -- H6 background line.
    set("RenderMarkdownCode", base_groups.problem) -- Code block background.
    set("RenderMarkdownCodeInfo", base_groups.pop) -- Code info, after language.
    set("RenderMarkdownCodeBorder", invert(base_groups.comment)) -- Code border background.
    set("RenderMarkdownCodeFallback", base_groups.code) -- Fallback for code language.
    set("RenderMarkdownCodeInline", base_groups.code) -- Inline code background.
    set("RenderMarkdownQuote", base_groups.code) -- Default for block quote.
    set("RenderMarkdownQuote1", base_groups.code) -- Level 1 block quote marker.
    set("RenderMarkdownQuote2", base_groups.code) -- Level 2 block quote marker.
    set("RenderMarkdownQuote3", base_groups.code) -- Level 3 block quote marker.
    set("RenderMarkdownQuote4", base_groups.code) -- Level 4 block quote marker.
    set("RenderMarkdownQuote5", base_groups.code) -- Level 5 block quote marker.
    set("RenderMarkdownQuote6", base_groups.code) -- Level 6 block quote marker.
    set("RenderMarkdownInlineHighlight", base_groups.pop) -- Inline highlights contents.
    set("RenderMarkdownBullet", base_groups.pop) -- List item bullet points.
    set("RenderMarkdownDash", base_groups.comment) -- Thematic break line.
    set("RenderMarkdownSign", base_groups.code) -- Sign column background.
    set("RenderMarkdownMath", base_groups.pop) -- Latex lines.
    set("RenderMarkdownIndent", base_groups.comment) -- Indent icon.
    set("RenderMarkdownHtmlComment", base_groups.comment) -- HTML comment inline text.
    set("RenderMarkdownLink", base_groups.pop) -- Image & hyperlink icons.
    set("RenderMarkdownWikiLink", base_groups.pop) -- WikiLink icon & text.
    set("RenderMarkdownUnchecked", base_groups.pop) -- Unchecked checkbox.
    set("RenderMarkdownChecked", base_groups.pop) -- Checked checkbox.
    set("RenderMarkdownTodo", base_groups.pop) -- Todo custom checkbox.
    set("RenderMarkdownTableHead", base_groups.pop) -- Pipe table heading rows.
    set("RenderMarkdownTableRow", base_groups.code) -- Pipe table body rows.
    set("RenderMarkdownTableFill", base_groups.comment) -- Pipe table inline padding.
    set("RenderMarkdownSuccess", base_groups.pop) -- Success related callouts.
    set("RenderMarkdownInfo", base_groups.pop) -- Info related callouts.
    set("RenderMarkdownHint", base_groups.pop) -- Hint related callouts.
    set("RenderMarkdownWarn", base_groups.pop) -- Warning related callouts.
    set("RenderMarkdownError", base_groups.problem) -- Error related callouts.

    vim.notify("Applied minimal highlighting")
end

return M
