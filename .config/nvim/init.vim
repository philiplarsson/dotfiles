"----------General Settings----------"

" Clear hlsearch when pressing enter
nnoremap <silent> <CR> :noh<CR><CR>


let mapleader="ö"                    " Set mapleader to ö

set number                           " show line number
set background=dark                  " dark theme background (used by vim-airline)
set smartcase                        " smarter search, capital letters case sent
set autoindent                       " smart indenting
set smartindent
set ignorecase                       " ignore case when searching
set tabstop=8                        " tab can be 8, use spaces instead
set expandtab                        " use space instead of tab
set shiftwidth=4                     " when using '>', use 4 spaces width
set softtabstop=4
set autowriteall                     " automatically write the file when switching buffers
set undofile                         " use undo file
set undodir=~/.config/nvim/.nvimundo
set splitright                       " open new splits to the right
so ~/.config/nvim/plugins.vim        " Source plugins

"----------Split Management----------"
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


"----------Mappings----------"
nmap <LEADER>es :UltiSnipsEdit<CR>
"" Indent file
map <LEADER>i mzgg=G`z
nmap <LEADER>w :w!<CR>
nnoremap j gj
nnoremap k gk

"----------Apperance----------"
highlight PmenuSel ctermfg=white ctermbg=red
