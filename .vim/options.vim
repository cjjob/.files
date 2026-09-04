set number
set relativenumber

set timeoutlen=750
" So ESC is instant.
" Might fuck with others.
set ttimeoutlen=10

set clipboard=unnamed,unnamedplus

let &t_SI = "\<Esc>[6 q" " Insert mode (vertical bar)
let &t_SR = "\<Esc>[4 q" " Replace mode (underline)
let &t_EI = "\<Esc>[2 q" " Normal mode (block)

filetype on
filetype indent on
filetype plugin on

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent

set fillchars+=eob:\ " <- Note, there is a trailing space.

" Open help as full buffer.
autocmd FileType help only

syntax off
