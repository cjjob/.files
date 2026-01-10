let lspOpts = #{
           \    autoHighlightDiags: v:true,
           \    showDiagWithVirtualText: v:true,
           \ }

autocmd User LspSetup call LspOptionsSet(lspOpts)

let lspServers = [
            \   #{
            \       name: 'golang',
            \       filetype: ['go', 'gomod'],
            \       path: 'gopls',
            \       args: ['serve'],
            \   },
            \   #{
            \       name: 'basedpyright',
            \       filetype: ['python'],
            \       path: 'basedpyright-langserver',
            \       args: ['--stdio'],
            \       workspaceConfig: #{
            \       python: #{
            \           pythonPath: 'python'
            \       }},  
            \   },
            \]
autocmd User LspSetup call LspAddServer(lspServers)

" Key mappings
nnoremap gd :LspGotoDefinition<CR>
nnoremap gr :LspShowReferences<CR>
nnoremap K  :LspHover<CR>
nnoremap gl :LspDiag current<CR>
nnoremap <leader>nd :LspDiag next \| LspDiag current<CR>
nnoremap <leader>pd :LspDiag prev \| LspDiag current<CR>
inoremap <silent> <C-Space> <C-x><C-o>

" Set omnifunc for completion
autocmd FileType rust setlocal omnifunc=lsp#complete

" Custom diagnostic sign characters
autocmd User LspSetup call LspOptionsSet(#{
    \   diagSignErrorText: '✘',
    \   diagSignWarningText: '▲',
    \   diagSignInfoText: '»',
    \   diagSignHintText: '⚑',
    \ })


highlight LspErrorText guifg=White ctermfg=Black
highlight LspWarnText guifg=White ctermfg=Black
highlight LspInfoText guifg=White ctermfg=Black
highlight LspHintText guifg=White ctermfg=Black
highlight LspErrorHighlight gui=undercurl guisp=White cterm=underline
highlight LspWarnHighlight gui=undercurl guisp=White cterm=underline
