call plug#begin('~/.vim/plugged')

" =============== plugins =============== "
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'tomtom/tcomment_vim'            " smart commenting
Plug 'cocopon/iceberg.vim'
Plug 'dhruvasagar/vim-table-mode'     " automatic table creator & formatter. <leader>tm to toggle
Plug 'sirver/UltiSnips'
Plug 'airblade/vim-gitgutter'
Plug 'mtth/scratch.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'jceb/vim-orgmode'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'rizzatti/dash.vim'

call plug#end()
