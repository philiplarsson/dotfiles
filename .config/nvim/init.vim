" ================= general settings ==================
"
filetype plugin on
set nocompatible   " vim, not vi
syntax on          " syntax highlighting

set autowrite      " write to file if make
let mapleader="ö"
set number         " show line number
set showmode       " show current mode
set encoding=utf-8
set splitbelow
set splitright
set shell=/bin/zsh
set smartcase      " smarter search, capital letters case sent
set ignorecase     " ignore case when searching
set autoindent     " apply indentation to next line
set smartindent    " indent according to syntax/style of code
set mouse=a        " use mouse
set expandtab      " use spaces for tab. Use Ctrl-V<TAB> for regular Tab.
set tabstop=2      " use 2 spaces (visually) for 1 tab
set softtabstop=0  " don't simulate tab stops at widths
set shiftwidth=2   " use 4 spaces when pressed on tab
set autoread       " reload file if changed outside of vim

" Set correct path for python2.7
let g:python_host_prog='/usr/bin/python2.7'

" To use fzf in Vim, add the following line to your .vimrc:
set rtp+=/usr/local/opt/fzf

" ================= general bindings ==================
"
" Bind jj to escape
inoremap jj <Esc>

" Make it easy to edit the vimrc file.
nmap <LEADER>ev :tabedit $MYVIMRC<CR>
nmap <LEADER>ep :tabedit ~/.config/nvim/packages.vim<CR>

" Paste from system clipboard with <leader>v
" This will preserve the indentanion of the text (as if 'paste' command was
" on).
map <leader>v "+p

" Use spell check when git commit
autocmd FileType gitcommit setlocal spell

" Clear hlsearch when pressing enter
" nnoremap = normal mode non-recursive
nnoremap <silent> <CR> :noh<CR>

" Bind Q to : in normal mode
nnoremap Q :

"toggle fold with space
nnoremap <Space> za

" neovim terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" Jump to alternate file using <LEADER>.
" <C-^> is hard to use so use <LEADER>. instead
nnoremap <LEADER>. <C-^>

:" Map Ctrl-A -> Start of line, Ctrl-E -> End of line
:nmap <C-a> <Home>
:nmap <C-e> <End>
:inoremap <C-a> <Home>
:inoremap <C-e> <End>

" Ctrl-] doesn't work well with non-english keyboards.
" jump to tag and jump back (using ctags. Reload with ctags -R)
nmap <LEADER>jt g<C-]>
nmap <LEADER>jb <C-t>

" Use an undo file
set undofile
set undodir=~/.vimundo/
" ================= theme ==================
"
syntax on
colorscheme iceberg

" ================= markdown-settings ==================
" Use textwidth 80 for markdown files (reformat with gq)
au BufRead,BufNewFile *.md setlocal textwidth=80

" ================= plugins ==================
"
source ~/.config/nvim/packages.vim

" ================= plugin-settings ==================
"

"" NERDTree
nmap <LEADER>nt :NERDTreeToggle<CR>

"" easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
" Disable default mappings
let g:EasyMotion_do_mapping = 0
nmap <LEADER><LEADER> <Plug>(easymotion-overwin-f)

"" tcomment
map <LEADER>c <C-_><C-_>

" Ultisnipps
" Open :UltiSnipsEdit in new tab
let g:UltiSnipsEditSplit="tabdo"
let g:UltiSnipsSnippetsDir="~/.config/nvim/Ultisnips"

" Table-Mode
let g:table_mode_corner = '+'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='
