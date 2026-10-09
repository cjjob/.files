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
" :Files uses $FZF_DEFAULT_COMMAND; unset, fzf's own walker ignores .gitignore.
" rg --files respects .gitignore; --hidden shows dotfiles, but skip .git itself.
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git'"
" Plain preview: preview.sh uses this instead of bat/highlight when it's set.
let $FZF_PREVIEW_COMMAND = 'cat {}'
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
