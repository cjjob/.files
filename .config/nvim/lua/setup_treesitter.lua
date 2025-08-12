require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "css",
        "go",
        "html",
        "javascript",
        "lua",
        "markdown",
        "python",
        "vim",
    },
    auto_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
})
