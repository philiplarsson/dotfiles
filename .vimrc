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
set background=dark             " dark background
set history=500			" set number of history lines for vim to remember
set autoread			" auto read when a file has changed from the outside

" Highlight line 80 and onward
set colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#2c2d27


" VIM find do end on ruby files (use %)
runtime macros/matchit.vim

" Paste toggle
set pastetoggle=<F2>

" Spellbinding
nmap <silent> <leader>s :set spell!<CR>

" Indent file
map <LEADER>i mzgg=G`z

" Pathogen plugin handle
execute pathogen#infect()

filetype plugin indent on

""""" Plugins
""" Easymotion
"map <Leader> <Plug>(easymotion-prefix)
"nmap <LEADER><SPACE> <Plug>(easymotion-s)
"let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
"let g:EasyMotion_smartcase = 1

""" NERDTree
"nmap <Leader>nt :NERDTreeToggle<CR>

""" vim-airline
"set laststatus=2
"let g:airline_powerline_fonts = 1
"let g:airline_theme='bubblegum'


""" tcomment
"map <Leader>c <C-_><C-_>

""" ultisnips
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""" CTRL-P
"map <Leader>p <c-p>

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
