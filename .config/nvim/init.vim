" ================= general settings ==================
"
let mapleader="ö"
set number 				" show line number
set showmode				" show current mode
set encoding=utf-8
set splitbelow
set splitright
set shell=/bin/bash
set smartcase				" smarter search, capital letters case sent
set ignorecase				" ignore case when searching

" Clear hlsearch when pressing enter
" nnoremap = normal mode non-recursive
nnoremap <silent> <CR> :noh<CR>

" Bind Q to :
nnoremap Q :

" ================= plugins ==================
"
source ~/.config/nvim/packages.vim


"" ================= mappings ==================
"
" Make it easy to edit the vimrc file.
nmap <LEADER>ev :tabedit $MYVIMRC<CR>

" Ctrl-] doesn't work well with non-english keyboards.
nmap <LEADER>jt g<C-]>
nmap <LEADER>jb <C-t>

"" NERDTree
nmap <LEADER>nt :NERDTreeToggle<CR>

"" CTRLP
nmap <LEADER>pp :CtrlP<CR>
nmap <LEADER>pr :CtrlPMRU<CR>
nmap <LEADER>pt :CtrlPBufTag<CR>
nmap <LEADER>pb :CtrlPBuffer<CR>

"" easymotion
map <Leader> <Plug>(easymotion-prefix)
"nmap <LEADER><SPACE> <Plug>(easymotion-s)
nmap <LEADER><LEADER> <Plug>(easymotion-s)

"" tcomment
map <LEADER>c <C-_><C-_>

"" ================= visuals ==================

if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme nord
let g:nord_italic = 1				" enable italics
let g:nord_italic_comments = 1			" enable italic comments

