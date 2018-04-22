" ================= general settings ==================
"
filetype plugin on

set autowrite 				" write to file if make
let mapleader="ö"
set number 				" show line number
set showmode				" show current mode
set encoding=utf-8
set splitbelow
set splitright
set shell=/bin/zsh
set smartcase				" smarter search, capital letters case sent
set ignorecase				" ignore case when searching
set autoindent				" apply indentation to next line
set smartindent				" indent according to syntax/style of code
set mouse=a				" use mouse

" Clear hlsearch when pressing enter
" nnoremap = normal mode non-recursive
nnoremap <silent> <CR> :noh<CR>

" Bind Q to :
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

" ================= markdown-settings ==================
" Use textwidth 80 for markdown files (reformat with gq)
au BufRead,BufNewFile *.md setlocal textwidth=80

" ================= vim-go-settings ==================
"
" Only use locationlint list (instead of quicklist) with vim-go
let g:go_list_type = 'locationlist'

let g:go_metalinter_autosave = 1

" Import on save
let g:go_fmt_command = "goimports"
" Use 4 spaces as one tab
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

"Beautify vim-go (could make it slower)
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" Show info automatically
let g:go_auto_type_info = 1
"" ================= vim-go-mappings ==================
"
autocmd FileType go nmap <LEADER>gt  <Plug>(go-test)
autocmd FileType go nmap <LEADER>gr  <Plug>(go-run)
autocmd FileType go nmap <LEADER>gl  :GoMetaLinter<CR>

"" ================= general-mappings ==================
"
" Make it easy to edit the vimrc file.
nmap <LEADER>ev :tabedit $MYVIMRC<CR>

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

" turn to next or previous errors, after open location list
nmap <C-n> :lnext<CR>
nmap <C-n> :lprevious<CR>
nnoremap <leader>q :cclose<CR>

" neovim terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <LEADER>gb :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)

"" Toggle ALE (linting)
nmap <LEADER>a :ALEToggle<CR>

"" NERDTree
nmap <LEADER>nt :NERDTreeToggle<CR>

"" CTRLP
nmap <LEADER>pp :CtrlP<CR>
nmap <LEADER>pr :CtrlPMRU<CR>
nmap <LEADER>pt :CtrlPBufTag<CR>
nmap <LEADER>pb :CtrlPBuffer<CR>

"" easymotion
map <Leader> <Plug>(easymotion-prefix)
"nmap <LEADER><SPACE> <Plug>(easymotion-s)
nmap <LEADER><LEADER> <Plug>(easymotion-s)

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

" Theme
syntax enable
colorscheme nord
let g:nord_italic = 1				" enable italics
let g:nord_italic_comments = 1			" enable italic comments

