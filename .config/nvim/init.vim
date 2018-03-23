" ================= general settings ==================
"
let mapleader="ö"
set number 				" show line number
set showmode				" show current mode

" Clear hlsearch when pressing enter
" nnoremap = normal mode non-recursive
nnoremap <silent> <CR> :noh<CR><CR>

" Bind Q to :
nnoremap Q :

" ================= plugins ==================
"
source ~/.config/nvim/packages.vim


" ================= mappings ==================
"
" Make it easy to edit the vimrc file.
nmap <LEADER>ev :tabedit $MYVIMRC<CR>
