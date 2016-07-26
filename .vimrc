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
set foldmethod=indent           " enable folding"
set foldlevel=99

" Enable folding with the spacebar
nnoremap <SPACE> za

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

" Pretty python code
let python_highlight_all=1

"""" PEP8 (python) indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
   project_base_dir = os.environ['VIRTUAL_ENV']
   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
   execfile(activate_this, dict(__file__=activate_this))
EOF

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
" 9. vim-javascript-syntax
" 10. delimitMate
" 11. YouCompleteMe
" 12. tern-for-vim
" 13. vim-indent-guides
" 14. simplyfold - better python folding
" 15. indentpython - better pep8 indent in python
" 16. syntastic 
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

"10. delimitMate
" go to end of line with <C-g>g

"11. YouCompleteMe
"" Let autocomplete window go away when done
let g:ycm_autoclose_preview_window_after_completion = 1
map <LEADER>g :YcmCompleter GoToDefinitionElseDeclaration<CR>


"13. vim-indent-guides
" toggle with <Leader>ig

"14. simplyfold
let g:SimpylFold_docstring_preview = 1


"16.  syntastic (syntax checker)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ["pylint"]
let g:syntastic_python_pylint_args = '--disable=unused-wildcard-import,missing-docstring,wildcard-import'

""" NERDTree
"nmap <LEADER>nt :NERDTreeToggle<CR>

""" ultisnips
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""" Emmet-vim
"let g:user_emmet_leader_key='<C-L>'

"let g:syntastic_javascript_checkers = ['jshint']

"let g:syntastic_cpp_compiler = 'g++'
"let g:syntastic_cpp_compiler_options = ' -Wall -Wextra -pedantic-errors -Wold-style-cast -std=c++11' 
"let g:syntastic_scss_sass_quiet_messages = {
"    \ "regex": 'File to import not found or unreadable', }
