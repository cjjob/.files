local vim = vim -- Hack.

-- Configuration.
require("mini.ai").setup()
require("mini.extra").setup() -- Give us access to extra pickers.
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
vim.keymap.set("n", "<leader>sb", ":Pick buffers<CR>", { desc = "Search Buffers" })
vim.keymap.set("n", "<leader>sd", ":Pick diagnostic<CR>", { desc = "Search Diagnostics" })
vim.keymap.set("n", "<leader>se", ":Pick explorer<CR>", { desc = "Search Explorer" })
vim.keymap.set("n", "<leader>sf", ":Pick files<CR>", { desc = "Search Files" })
vim.keymap.set("n", "<leader>sg", ":Pick grep_live<CR>", { desc = "Search Regex/Ripgrep Live" })
vim.keymap.set("n", "<leader>sc", ":Pick git_commits<CR>", { desc = "Search Git Commits" })
vim.keymap.set("n", "<leader>ss", ":Pick git_files<CR>", { desc = "Search Git Commits" })
vim.keymap.set("n", "<leader>sh", ":Pick help<CR>", { desc = "Search Help" })
vim.keymap.set("n", "<leader>sk", ":Pick keymaps<CR>", { desc = "Search Keymaps" })
vim.keymap.set("n", "<leader>sj", ":Pick list scope='jump'<CR>", { desc = "Search Jumplist" })
vim.keymap.set("n", "<leader>sr", ":Pick resume<CR>", { desc = "Resume search" })
vim.keymap.set(
    "n",
    "<leader>sw",
    ":Pick grep pattern='<cword>'<CR>",
    { desc = "Search current word" }
)
vim.keymap.set(
    "n",
    "<leader>sW",
    ":Pick grep pattern='<cWORD>'<CR>",
    { desc = "Search current WORD" }
)
vim.keymap.set("v", "<leader>sv", function()
    -- gv re-selects the last visual selection, "x yanks it into register x
    vim.cmd("normal! gv\"xy")
    local selected_text = vim.fn.getreg("x")
    vim.cmd("Pick grep pattern='" .. selected_text .. "'")
end, { desc = "Search visual selection" })
vim.keymap.set("n", "<leader>mss", function()
    local sname = vim.fn.input("Session name: ")
    -- TODO: Detect not overwriting existing sessions.
    if sname == "" then
        vim.notify("Session name cannot be empty! Aborting.")
        return
    end
    MiniSessions.write(sname)
end, {
    desc = "Save session",
})
vim.keymap.set("n", "<leader>msd", function()
    local sname = vim.fn.input("Session name: ")
    if sname == "" then
        vim.notify("Session name cannot be empty! Aborting.")
        return
    end
    MiniSessions.delete(sname)
end, {
    desc = "Delete session",
})
