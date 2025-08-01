-- Creates a new user-defined command in Neovim, called 'Redir'.
-- The second argument is the function that gets executed when the command is called.
vim.api.nvim_create_user_command('Redir', function(ctx)
    -- Executes the arguments passed to :Redir as a Vim command (e.g., :Redir ls).
    -- `ctx.args` contains the arguments as a string.
    -- `true` makes `nvim_exec` return the output as a string.
    -- `vim.split` then splits this output string into a table of lines.
    local lines = vim.split(vim.api.nvim_exec(ctx.args, true), '\n', { plain = true })
    -- Creates a new, empty buffer in a new window.
    vim.cmd('new')
    -- Sets the content of the current (newly created) buffer.
    -- `0` refers to the current buffer.
    -- `0` and `-1` specify to replace all lines from start to end.
    -- `false` means not to strict-append (replace existing content).
    -- `lines` is the table of strings (output from the executed command) to insert.
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    -- Sets the 'modified' option for the current buffer to false.
    -- This prevents Neovim from prompting to save the buffer, as it's just a display of command output.
    vim.opt_local.modified = false
    -- The third argument is a table of options for the user command.
end, {
    -- `nargs = '+'` means the command accepts one or more arguments.
    -- `complete = 'command'` enables command-line completion for the arguments,
    -- suggesting other Neovim commands.
    nargs = '+',
    complete = 'command'
})
