-- TODOs:
-- 1.  Remap $ to E or something like that. Also take advantage of my CAPS + #
--     karabiner bind by mapping to some commonly used action, maybe w and quit
--     or something like that.
-- 2.  Set up html, css, and javascript LSP.
-- 3.  Get rid of this local vim = vim hack I've used in a couple of places.
-- 4.  Fix the use of this ripgrep .ignore file across nvim git repo versus
--     'normal' repos.
-- 5.  Get rid of n2 alias when 0.12 has stable release.

-- Load options first.
-- Other configuration can be dependent on these settings. For example, many
-- keymaps require the <leader> key to have been set already.
require("options")
require("autocommands")
require("commands")
require("keymaps")

local vim = vim -- Hack.

-- Install plugins.
vim.pack.add({
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
    { src = "https://github.com/echasnovski/mini.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
    { src = "https://github.com/stevearc/oil.nvim" },
})

-- Set up lsp/diagnostics.
vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
})
vim.lsp.enable({
    "basedpyright",
    "gopls",
    "lua_ls",
})

-- Set up plugins.
require("oil").setup({
    columns = {}, -- Disable icons.
    view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
    },
})
vim.keymap.set("n", "<leader>e", ":Oil<cr>", { desc = "Open Oil" })
require("setup_mini")
require("setup_treesitter")
