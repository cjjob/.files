let s:plugin_dir = expand('~/vim/plugged')
let s:wanted = []

function! s:ensure(repo)
    let name = split(a:repo, '/')[-1]
    let path = s:plugin_dir . '/' . name
    call add(s:wanted, name)

    if !isdirectory(path)
        if !isdirectory(s:plugin_dir)
            call mkdir(s:plugin_dir, 'p')
        endif
        execute '!git clone --depth=1 https://github.com/' . a:repo . ' ' . shellescape(path)

        " Generate helptags immediately after cloning
        let l:doc_path = path . '/doc'
        if isdirectory(l:doc_path)
            execute 'helptags ' . fnameescape(l:doc_path)
        endif
    endif

    execute 'set runtimepath+=' . fnameescape(path)
endfunction

function! s:prune()
    if !isdirectory(s:plugin_dir)
        return
    endif
    for l:dir in glob(s:plugin_dir . '/*', 1, 1)
        let l:name = fnamemodify(l:dir, ':t')
        if index(s:wanted, l:name) == -1
            echom 'Removing unused plugin: ' . l:name
            call delete(l:dir, 'rf')
        endif
    endfor
endfunction

call s:ensure("easymotion/vim-easymotion")
call s:ensure("junegunn/fzf")
call s:ensure("junegunn/fzf.vim")
call s:ensure("junegunn/vim-easy-align")
call s:ensure("tpope/vim-commentary")
call s:ensure("tpope/vim-surround")
call s:ensure("yegappan/lsp")

call s:prune()
