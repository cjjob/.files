" Format Python on save: black, then isort (black profile so they agree).
" Each tool runs separately so a failure in either leaves the buffer untouched.
function! s:FormatPython() abort
    if !executable('black') || !executable('isort')
        return
    endif
    let l:fname = shellescape(expand('%:p'))
    let l:orig = getline(1, '$')

    let l:out = systemlist('black -q --stdin-filename ' . l:fname . ' -', l:orig)
    if v:shell_error != 0
        return
    endif
    let l:out = systemlist('isort --profile black --filename ' . l:fname . ' -', l:out)
    if v:shell_error != 0 || l:out == l:orig
        return
    endif

    let l:view = winsaveview()
    silent keepjumps call setline(1, l:out)
    if line('$') > len(l:out)
        silent execute len(l:out) + 1 . ',$delete _'
    endif
    call winrestview(l:view)
endfunction

augroup python_fmt
    autocmd!
    autocmd BufWritePre *.py call s:FormatPython()
augroup END
