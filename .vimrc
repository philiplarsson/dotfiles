set nocompatible		" disable vi-compability

" Set mapleader to ö
let mapleader="ö"

" Clear hlsearch when pressing enter
nnoremap <silent> <CR> :noh<CR><CR>

" Bind Q to :
nnoremap Q :

scriptencoding utf-8
syntax on

set number			" show line number
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
set undodir=/home/vin1/.vimundo/

" Highlight line 80 and onward
set colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" VIM find do end on ruby files (use %)
runtime macros/matchit.vim

" Paste toggle
set pastetoggle=<F2>

" Spellbinding
nmap <silent> <LEADER>s :set spell!<CR>

" Indent file
map <LEADER>i mzgg=G`z

" Pathogen plugin handle
execute pathogen#infect()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""" Installed """"""""
" 1. CTRL-P 
" 2. Supertab
" 3. Easymotion
" 4. multiple-cursors
" 5. goyo
" 6. vim-airline
" 7. vim-airline-themes
" 8. tcomment
""""""""""""""""""""""""

"1. CTRL-P
map <LEADER>p <c-p>

"3. Easymotion
map <LEADER> <Plug>(easymotion-prefix)
nmap <LEADER><SPACE> <Plug>(easymotion-s)
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_smartcase = 1

"5. Goyo
nmap <LEADER>g :Goyo<CR>

"6. vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

"8. tcomment
map <LEADER>c <C-_><C-_>


""" NERDTree
"nmap <LEADER>nt :NERDTreeToggle<CR>

""" ultisnips
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""" Emmet-vim
"let g:user_emmet_leader_key='<C-L>'

""" syntastic (syntax checker)
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['jshint']

"let g:syntastic_cpp_compiler = 'g++'
"let g:syntastic_cpp_compiler_options = ' -Wall -Wextra -pedantic-errors -Wold-style-cast -std=c++11' 
"let g:syntastic_scss_sass_quiet_messages = {
"    \ "regex": 'File to import not found or unreadable', }
