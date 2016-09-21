"----------Plugins----------"
call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'edkolev/tmuxline.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'scrooloose/nerdtree'

call plug#end()

"----------Plugin Settings----------"
" Easymotion
map <LEADER> <Plug>(easymotion-prefix)
nmap <LEADER><SPACE> <Plug>(easymotion-s)
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_smartcase = 1

" CTRL-P
map <LEADER>p <C-P>
nmap <LEADER>yp :CtrlPBufTag<CR>     "Find functions. Requires exuberant-ctags
nmap <LEADER>rf :CtrlPMRUFiles<CR>   "Recently used files


" Vim airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" NERDTree
nmap <LEADER>NT :NERDTreeToggle<CR>
