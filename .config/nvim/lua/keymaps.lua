local vim = vim
local km = vim.keymap

km.set("n", "gd", vim.lsp.buf.definition)
km.set("n", "gi", vim.lsp.buf.implementation)
km.set("n", "gn", vim.lsp.buf.rename)
km.set("n", "gr", vim.lsp.buf.references)
km.set("n", "gt", vim.lsp.buf.type_definition)

-- Navigation.
km.set("n", "<leader><left>", "<C-w>h", { desc = "Move window left." })
km.set("n", "<leader><right>", "<C-w>l", { desc = "Move window right." })
km.set("n", "<leader><up>", "<C-w>k", { desc = "Move window up." })
km.set("n", "<leader><down>", "<C-w>j", { desc = "Move window down." })
km.set({ "n", "v" }, "k", "<C-u>zz", { desc = "0.5 page up." })
km.set({ "n", "v" }, "l", "<C-d>zz", { desc = "0.5 page down." })
km.set("n", "<C-,>", "<C-o>zz", { desc = "Jump back." })
km.set("n", "<C-.>", "<C-i>zz", { desc = "Jump forward." })

-- Some kommon kustom kommands.
km.set("n", "<leader>ka", "ggVG", { desc = "Visual all" })

km.set("n", "<leader>kc", function()
    local current_colorscheme = vim.g.colors_name or "quiet"
    if current_colorscheme == "quiet" then
        vim.cmd("colorscheme five")
    else
        vim.cmd("colorscheme quiet")
    end
end, { desc = "Toggle colorscheme between quiet and five" })

km.set("n", "<leader>kh", function()
    vim.cmd("highlight")
end, { desc = "highlight" })

km.set("n", "<leader>kii", function()
    vim.cmd("Inspect")
end, { desc = "Inspect" })

km.set("n", "<leader>kit", function()
    vim.cmd("InspectTree")
end, { desc = "InspectTree" })

-- We will have a visual selection when we run this.
-- So we need to rely on Vim populating the range.
-- i.e. '<,>'
-- So, we don't apply the function() vim.cmd("sort").
-- Because that would apply across the whole file.
-- Instead, we just send the keystrokes.
km.set("v", "<leader>a", ":sort<CR>", { desc = "sort [a]lphabetically" })
km.set("v", "f", "gq", { desc = "gq (format)" })
