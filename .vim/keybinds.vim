let mapleader = " "

nnoremap <CR> o<Esc> " Newline without insert mode
nnoremap k <C-u>     " Scroll up
nnoremap l <C-d>     " Scroll down


" Jump list
nnoremap <C-Left>   <C-o> " Back
nnoremap <C-Right>  <C-i> " Forward


" Remap CTRL u/i/k/o to move around windows
nnoremap <C-u>      <C-w>h
nnoremap <C-Up>     <C-w>k
nnoremap <C-Down>   <C-w>j
nnoremap <C-o>      <C-w>l
" Don't forget
" g; - Previous changelist location
" g, - Next changelist location
" gi - Last insert location


" Netrw file explorer
nnoremap <leader>cd :Ex<CR>


" fzf
nnoremap <leader>sb :Buffers<CR>
nnoremap <leader>sf :Files<CR>
nnoremap <leader>so :History<CR>
nnoremap <leader>sg :Rg<Space>


" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xnoremap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)


" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nnoremap j <Plug>(easymotion-bd-w)
nnoremap s <Plug>(easymotion-bd-f)


" NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>
