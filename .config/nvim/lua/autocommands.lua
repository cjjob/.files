vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local filename = vim.fn.expand("%:p")
        local filetype = vim.bo.filetype
        local bufnr = vim.api.nvim_get_current_buf()
        if filetype == "lua" then
            vim.fn.jobstart({ "stylua", filename }, {
                on_exit = function(_, exit_code)
                    if exit_code == 0 then
                        vim.api.nvim_buf_call(bufnr, function()
                            vim.cmd("edit!")
                            vim.notify("Stylua formatting successful", vim.log.levels.INFO)
                        end)
                    else
                        vim.notify("Stylua formatting failed", vim.log.levels.ERROR)
                    end
                end,
            })
        elseif filetype == "python" then
            vim.fn.jobstart({ "black", filename }, {
                on_exit = function(_, exit_code)
                    if exit_code == 0 then
                        vim.api.nvim_buf_call(bufnr, function()
                            vim.cmd("edit!")
                            vim.notify("Black formatting successful", vim.log.levels.INFO)
                        end)
                    else
                        vim.notify("Black formatting failed", vim.log.levels.ERROR)
                    end
                end,
            })
        else
            vim.notify("No formatter found for filetype: " .. filetype, vim.log.levels.WARN)
        end
    end,
    desc = "Format on save",
    group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank({ higroup = "Yank", timeout = 150 })
    end,
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
})
