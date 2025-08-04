-- Load options first.
-- Other configuration can be dependent on these settings. For example, many
-- keymaps require the <leader> key to have been set already.
require("options")
require("autocommands")
require("commands")
require("keymaps")

vim.pack.add({
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
    { src = "https://github.com/echasnovski/mini.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/stevearc/oil.nvim" },
})

vim.lsp.enable({
    "lua_ls",
})

require("mini.jump2d").setup({
    labels = "abcdefghijklmnopqrstuvwxyz",
    mappings = {
        start_jumping = "j",
    },
    view = {
        n_steps_ahead = 0,
    },
})

require("mini.pick").setup()
-- vim.keymap.set("n", "<leader>sb",
vim.keymap.set("n", "<leader>sf", ":Pick files<CR>", { desc = "Search Files" })
vim.keymap.set("n", "<leader>sr", ":Pick grep_live<CR>", { desc = "Search Regex/Ripgrep Live" })
-- vim.keymap.set("n", "<leader>sl",

require("mini.starter").setup()

require("mini.sessions").setup({
    directory = vim.fn.expand("~/workspace/nvim_sessions/"),
})

vim.keymap.set("n", "<leader>mss", function()
    local sname = vim.fn.input("Session name: ")
    -- TODO: Detect not overwriting existing sessions.
    if sname == "" then
        vim.notify("Session name cannot be empty! Aborting.")
        return
    end
    MiniSessions.write(sname)
end)

vim.keymap.set("n", "<leader>msd", function()
    local sname = vim.fn.input("Session name: ")
    if sname == "" then
        vim.notify("Session name cannot be empty! Aborting.")
        return
    end
    MiniSessions.delete(sname)
end)

require("oil").setup({
    columns = {}, -- Disable icons.
    view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
    },
})
vim.keymap.set("n", "<leader>e", ":Oil<cr>", { desc = "Open Oil" })
