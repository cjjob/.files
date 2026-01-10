let s:plugin_dir = expand('~/vim/plugged')

function! s:ensure(repo)
    let name = split(a:repo, '/')[-1]
    let path = s:plugin_dir . '/' . name

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

call s:ensure("easymotion/vim-easymotion")
call s:ensure("junegunn/fzf")
call s:ensure("junegunn/fzf.vim")
call s:ensure("junegunn/vim-easy-align")
call s:ensure("preservim/nerdtree")
call s:ensure("tpope/vim-commentary")
call s:ensure("tpope/vim-surround")
call s:ensure("yegappan/lsp")
