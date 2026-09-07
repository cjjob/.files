function! s:FormatMarkdown() abort
    if !executable('prettier')
        return
    endif
    let l:view = winsaveview()
    let l:out = systemlist('prettier --parser markdown', getline(1, '$'))
    if v:shell_error == 0 && l:out != getline(1, '$')
        silent keepjumps call setline(1, l:out)
        if line('$') > len(l:out)
            silent execute len(l:out) + 1 . ',$delete _'
        endif
    endif
    call winrestview(l:view)
endfunction

augroup markdown_fmt
    autocmd!
    autocmd FileType markdown setlocal formatprg=prettier\ --parser\ markdown textwidth=0
    autocmd BufWritePre *.md,*.markdown call s:FormatMarkdown()
augroup END
