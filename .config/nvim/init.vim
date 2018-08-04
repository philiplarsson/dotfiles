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
set shiftwidth=4   " use 4 spaces when pressed on tab
set autoread       " reload file if changed outside of vim

" Bind jj to escape
inoremap jj <Esc>

" Expand %% to path of active buffer, just as %:h<Tab>
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>et :tabe %%

" Clear hlsearch when pressing enter
" nnoremap = normal mode non-recursive
nnoremap <silent> <CR> :noh<CR>

" Bind Q to : in normal mode
nnoremap Q :

" Press ~ to toggle between UPPER CASE, lower case and Title Case.
" Select word under cursor with viw
" Found at: http://vim.wikia.com/wiki/Switching_case_of_characters#Twiddle_case
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" ================= plugins ==================
"
source ~/.config/nvim/packages.vim

" Install vim-fzf
" must be installed using homebrew first
set rtp+=/usr/local/opt/fzf

" Enable matchit
runtime macros/matchit.vim

" ================= plugin-settings ==================
"
" Use airline and ALE
let g:airline#extensions#ale#enabled = 1

" Don't start ALE when entering file.
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0

" Ultisnipps
" Open :UltiSnipsEdit in new tab
let g:UltiSnipsEditSplit="tabdo"
let g:UltiSnipsSnippetsDir="~/.config/nvim/Ultisnips"

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Update git-gutter 500ms after typing. (author recommends 100ms)
set updatetime=500

" ================= ncm2-settings ==================
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" ================= omni-complete-settings ==================
set completeopt=noinsert,menuone,noselect
" Enter acts as C-y
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Esc cancels and remove suggestion
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" ================= phpactor-settings ==================
" Phpactor is an intelligent code-completion and refactoring tool for PHP.
" All phpactor commands start with <leader>P

" Include use statement
nmap <Leader>Pu :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>PP :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>Pn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>Po :call phpactor#GotoDefinition()<CR>

" Scan for all references to a class member in the project
nmap <Leader>Pr :call phpactor#FindReferences()<CR>

" Automatically add any missing properties to a class
nmap <Leader>Pt :call phpactor#Transform()<CR>

" Extract a method from a selection
nmap <Leader>Pm :call phpactor#ExtractMethod()<CR>

" Set to v:true to enable useful error messages when completion is invoked.
let g:phpactorOmniError = v:true

" ================= fzf-settings ==================
"
" Append --no-height
" This solves Ctrl-R bug in neovim terminal
" https://github.com/junegunn/fzf/issues/809
let $FZF_DEFAULT_OPTS .= ' --no-height'
nmap <LEADER>pp :GitFiles<CR>
nmap <LEADER>pg :GitFiles?<CR>
nmap <LEADER>pP :Files<CR>
nmap <LEADER>pb :Buffers<CR>
nmap <LEADER>pa :Ag<CR>
nmap <LEADER>pl :BLines<CR>
nmap <LEADER>pc :Commands<CR>
nmap <LEADER>ph :Helptags<CR>
nmap <LEADER>ps :Snippets<CR>
nmap <LEADER>pm :Maps<CR>

" tag word under cursor
fu! FzfTagsCurrWord()
  let currWord = expand('<cword>')
  if len(currWord) > 0
    call fzf#vim#tags(expand('<cword>'))
  else
    execute ':Tags'
  endif
endfu
nmap <LEADER>pt :call FzfTagsCurrWord()<CR>

" ================= markdown-settings ==================
" Use textwidth 80 for markdown files (reformat with gq)
au BufRead,BufNewFile *.md setlocal textwidth=80

" ================= table-mode-settings ==================
" Convert visual selection to table
let g:table_mode_tableize_map = '<Leader>TT'
" ================= gitcommit-settings ==================
" Use spell check when git commit
autocmd FileType gitcommit setlocal spell

" ================= emmet-vim settings ==================
" emmet uses C-y ,

" ================= tagbar-settings ==================
" Toggle tagbar
nmap <LEADER>tt :TagbarToggle<CR>

"" ================= general-mappings ==================
"
" Make it easy to edit the vimrc file.
nmap <LEADER>ev :tabedit $MYVIMRC<CR>
nmap <LEADER>ep :tabedit ~/.config/nvim/packages.vim<CR>

:" Map Ctrl-A -> Start of line, Ctrl-E -> End of line
:nmap <C-a> <Home>
:nmap <C-e> <End>
:inoremap <C-a> <Home>
:inoremap <C-e> <End>

" Ctrl-] doesn't work well with non-english keyboards.
" jump to tag and jump back (using ctags. Reload with ctags -R)
nmap <LEADER>jt g<C-]>
nmap <LEADER>jb <C-t>

" Traverse buffer list
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Jump to alternate file
" <C-^> is hard to use so use <LEADER>. instead.
nnoremap <LEADER>. <C-^>

" Jump to Windows without using <C-w> first.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" neovim terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

"" Toggle ALE (linting)
nmap <LEADER>a :ALEToggle<CR>

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

"" UltiSnipps
" UltiSnips will only map the jump triggers while a snippet is active to
" interfere as little as possible with other mappings.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"" ================= visuals ==================

if (has("termguicolors"))
  set termguicolors
endif

" Enable cursorline number color for nord theme
"augroup NordMods
    "autocmd!
    "autocmd ColorScheme nord highlight CursorLineNr ctermfg=6 guifg=#81A1C1
    "autocmd ColorScheme nord highlight CursorLine ctermbg=NONE guibg=#2E3440
"augroup end
"set cursorline

" Airline Theme
let g:airline_theme='quantum'

" Theme
syntax enable
colorscheme chito
"let g:nord_italic = 1				" enable italics
"let g:nord_italic_comments = 1			" enable italic comments


