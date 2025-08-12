-- Set the colorscheme name
vim.g.colors_name = "five"

-- Load the colorscheme
require("five").load()

-- Also try to register it as a proper colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "five",
    callback = function()
        require("five").load()
    end,
})
