vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local filename = vim.fn.expand("%:p")
        local ft = vim.bo.filetype
        local bufnr = vim.api.nvim_get_current_buf()
        if ft == "lua" then
            -- We will capture stdout and stderr and send the output to on_exit
            -- callback. This will then be accessible in the :messages output so
            -- we get more detail on what went wrong.
            -- We are capturing both because sometimes output might go to stdout
            -- on failure rather than always stderr. This is what Gemini told me
            -- anyway. I don't know.
            local stdout_lines = {}
            local stderr_lines = {}
            vim.fn.jobstart({ "stylua", filename }, {
                on_stdout = function(_, data, _)
                    for _, line in ipairs(data) do
                        table.insert(stdout_lines, line)
                    end
                end,
                on_stderr = function(_, data, _)
                    for _, line in ipairs(data) do
                        table.insert(stderr_lines, line)
                    end
                end,
                on_exit = function(_, exit_code)
                    if exit_code == 0 then
                        vim.api.nvim_buf_call(bufnr, function()
                            vim.cmd("edit!")
                            vim.notify("Stylua formatting successful", vim.log.levels.INFO)
                        end)
                    else
                        -- TODO: These conditionals don't seem to be working
                        -- quite right. Also, the formatting on the output
                        -- contains some weird blank lines afaict?
                        local error_message = "Stylua formatting failed."
                        if #stderr_lines > 0 then
                            error_message = error_message
                                .. "\nStderr:\n"
                                .. table.concat(stderr_lines, "\n")
                        end
                        if #stdout_lines > 0 then
                            error_message = error_message
                                .. "\nStdout:\n"
                                .. table.concat(stdout_lines, "\n")
                        end
                        vim.notify(error_message, vim.log.levels.ERROR, { title = "Stylua Error" })
                    end
                end,
            })
        elseif ft == "javascript" or ft == "markdown" then
            vim.fn.jobstart({ "prettier", "--write", filename }, {
                on_exit = function(_, exit_code)
                    if exit_code == 0 then
                        vim.api.nvim_buf_call(bufnr, function()
                            vim.cmd("edit!")
                            vim.notify("Prettier formatting successful", vim.log.levels.INFO)
                        end)
                    else
                        vim.notify("Prettier formatting failed", vim.log.levels.ERROR)
                    end
                end,
            })
        elseif ft == "python" then
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
            vim.notify("No formatter found for filetype: " .. ft, vim.log.levels.WARN)
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
