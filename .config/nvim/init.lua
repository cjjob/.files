print("hi")
require("autocommands")
require("keymaps")
require("options")
print("lol2")


vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
    { src = "https://github.com/neovim/nvim-lspconfig" }
})


vim.lsp.enable({
    "lua_ls",
})


require("oil").setup({
    columns = {}, -- Disable icons.
    view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
    },
})
vim.keymap.set("n", "<leader>e", ":Oil<cr>", { desc = "Open Oil" })
