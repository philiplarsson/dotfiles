1 "----------General Settings----------"

" disable vi-compability
set nocompatible

" Set mapleader to ö
let mapleader="ö"

" Clear hlsearch when pressing enter
nnoremap <silent> <CR> :noh<CR><CR>

scriptencoding utf-8
syntax on

set number			" show line number
set background=dark             " dark theme background
set showmode			" show current mode
set expandtab			" use space instead of tab
set autoindent			" smart indenting
set shiftwidth=2		" set number of spaces as tab
set softtabstop=2		" correct indent for tab in insert mode
set smartcase			" smarter search, capital letters case sent
set ignorecase			" ignore case when searching
set incsearch                   " incremental search
set hlsearch			" highlight search 
set showmatch			" highlight matching brackets
set visualbell			" no beeping
set showcmd			" show partial command at bottom
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set encoding=utf-8              " utf-8 all the way
set fileencoding=utf-8
set termencoding=utf-8
set spelllang=en_us             " Set spell region to USA
set background=dark             " dark theme background (used by vim-airline)
set history=500			" set number of history lines for vim to remember
set autoread			" auto read when a file has changed from the outside
set undofile                    " use undo file for persistent undoes
set undodir=~/.config/vim/.vimundo/
set foldmethod=indent           " enable folding"
set foldlevel=99
so ~/.config/vim/plugins.vim               " Source plugins

" --------Split Management----------"
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"----------Mappings----------"
nmap <LEADER>es :UltiSnipsEdit<CR>
"" Indent file
map <LEADER>i mzgg=G`z
nmap <LEADER>w :w!<CR>
nnoremap j gj
nnoremap k gk

" Paste toggle
set pastetoggle=<F2>

" Enable folding with the spacebar
nnoremap <SPACE> za

"----------Apperance----------"
highlight PmenuSel ctermfg=white ctermbg=red

