vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.have_nerd_font = true

-- Keeps indentation when wrapping lines.
vim.opt.breakindent = true
-- Integrates with the system clipboard.
vim.opt.clipboard = "unnamedplus"
-- Sets the command-line height.
vim.opt.cmdheight = 1
-- Highlights the current cursor line.
-- Need this on for highlight groups to be active.
vim.opt.cursorline = false
-- Converts tabs to spaces.
vim.opt.expandtab = true
-- Sets the character for the end of buffer.
vim.opt.fillchars = { eob = " " }
-- Ignores case in search patterns.
vim.opt.ignorecase = true
-- Always shows the status line.
vim.opt.laststatus = 3
-- Shows invisible characters.
vim.opt.list = true
-- Defines characters for invisible symbols.
vim.opt.listchars = {
    extends = ">",
    nbsp = "␣",
    precedes = "<",
    tab = "» ",
    trail = "·",
}
-- Shows absolute line numbers.
vim.opt.number = true
-- Shows relative line numbers.
vim.opt.relativenumber = true
-- Hides the ruler showing cursor position.
vim.opt.ruler = false
-- Keeps the cursor line centered.
vim.opt.scrolloff = 999 -- Centers active line.
-- Sets the number of spaces for autoindent.
vim.opt.shiftwidth = 4
-- Shows the command in the status line.
vim.opt.showcmd = true
-- Hides the current mode in the status line.
vim.opt.showmode = true
-- Hides the sign column.
vim.opt.signcolumn = "yes:3"
-- Overrides 'ignorecase' if search term contains uppercase.
vim.opt.smartcase = true
-- Defines the content of the status column.
vim.opt.statuscolumn = "%s%l    " -- Line number and padding.
-- Sets the number of spaces a tab counts for.
vim.opt.tabstop = 4
-- Sets the maximum line length for text.
vim.opt.textwidth = 80
-- Enables persistent undo.
vim.opt.undofile = true
-- :h winborder
vim.opt.winborder = "rounded"
