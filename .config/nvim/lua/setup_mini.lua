local vim = vim -- Hack.

-- Configuration.
require("mini.ai").setup()
require("mini.jump2d").setup({
    labels = "abcdefghijklmnopqrstuvwxyz",
    mappings = {
        start_jumping = "j",
    },
    view = {
        n_steps_ahead = 0,
    },
})
require("mini.pairs").setup()
require("mini.pick").setup()
require("mini.sessions").setup({
    directory = vim.fn.expand("~/workspace/nvim_sessions/"),
})
require("mini.starter").setup()
require("mini.surround").setup()

-- Keymaps
vim.keymap.set("n", "<leader>sf", ":Pick files<CR>", { desc = "Search Files" })
vim.keymap.set("n", "<leader>sg", ":Pick grep_live<CR>", { desc = "Search Regex/Ripgrep Live" })
vim.keymap.set("n", "<leader>sh", ":Pick help<CR>", { desc = "Search Help" })
vim.keymap.set("n", "<leader>sr", ":Pick resume<CR>", { desc = "Resume search" })
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
