vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    callback = function()
        vim.lsp.buf.format({ async = true })
    end,
    desc = "Format on save",
    group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank({ higroup = "Yank", timeout = 150 })
    end,
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
})
