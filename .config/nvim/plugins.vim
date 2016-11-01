"----------Plugins----------"
call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'edkolev/tmuxline.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pbogut/deoplete-padawan'
Plug 'ervandew/supertab'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'jwalton512/vim-blade'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'

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
"" Speed up CTRL-P
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Vim airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" NERDTree
nmap <LEADER>nt :NERDTreeToggle<CR>

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1     " disable autocomplete
"use <tab> for completion
function! TabWrap()
    if pumvisible()
        return "\<C-N>"
    elseif strpart( getline('.'), 0, col('.') - 1 ) =~ '^\s*$'
        return "\<tab>"
    elseif &omnifunc !~ ''
        return "\<C-X>\<C-O>"
    else
        return "\<C-N>"
    endif
endfunction

" power tab
imap <silent><expr><tab> TabWrap()

" Enter: complete&close popup if visible (so next Enter works); else: break undo
inoremap <silent><expr> <Cr> pumvisible() ?
            \ deoplete#mappings#close_popup() : "<C-g>u<Cr>"

" Ctrl-Space: summon FULL (synced) autocompletion
inoremap <silent><expr> <C-Space> deoplete#mappings#manual_complete()

" Escape: exit autocompletion, go to Normal mode
inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"       " Cycle completion list in opposite direction

" Vim-php-cs-fixer
let g:php_cs_fixer_level = "psr2"
nnoremap <silent><leader>fp :call PhpCsFixerFixFile()<CR>
let g:php_cs_fixer_enable_default_mapping = 0

" tcomment_vim
map <LEADER>c <C-_><C-_>

" emmet-vim
" let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_expandabbr_key='<C-@>'

" vim-indent-guides
map <LEADER>si <LEADER>ig

" indentLine
let g:indentLine_color_term = 248 
let g:indentLine_char = '┆'
map <LEADER>ti :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
