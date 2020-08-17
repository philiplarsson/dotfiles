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
set tabstop=4      " use 4 spaces (visually) for 1 tab
set softtabstop=0  " don't simulate tab stops at widths
set shiftwidth=4   " use 4 spaces when pressed on tab
set autoread       " reload file if changed outside of vim

" Give more space for displaying messages.
set cmdheight=2

" Set correct path for python2.7
let g:python_host_prog='/usr/bin/python2.7'

" To use fzf in Vim, add the following line to your .vimrc:
" set rtp+=/usr/local/opt/fzf

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show signcolumn. Otherwise the text shifts each time diagnostics
" appear/become resolved.
set signcolumn=yes

" ================= plugins ==================
"
source ~/.config/nvim/packages.vim

" ================= general bindings ==================
"
" Bind jj to escape
inoremap jj <Esc>

" Make it easy to edit the vimrc file.
nmap <LEADER>ev :tabedit $MYVIMRC<CR>
nmap <LEADER>ep :tabedit ~/.config/nvim/packages.vim<CR>

" Paste from system clipboard with <leader>v
" This will preserve the indentation of the text (as if 'paste' command was
" on).
map <leader>v "+p

" Use spell check when git commit
autocmd FileType gitcommit setlocal spell

" Use spell check for OpenAPI (yaml) files
autocmd FileType yaml setlocal spell

" Use spell check for org files
autocmd FileType org setlocal spell

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
"
" Use textwidth 80 for markdown files (reformat with gq)
au BufRead,BufNewFile *.md setlocal textwidth=80

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

" Table-Mode
let g:table_mode_corner = '+'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

" ================= fzf-settings ==================
"
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

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" ================= ultisnipps-settings ==================
" Open :UltiSnipsEdit in new tab
let g:UltiSnipsEditSplit="tabdo"
let g:UltiSnipsSnippetsDir="~/.config/nvim/Ultisnips"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Split window when editing snippets
let g:UltiSnipsEditSplit="vertical"

" ================= coc.nvim settings ==================
"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

try
    nmap <silent> <C-k> :call CocAction('diagnosticNext')<cr>
    nmap <silent> <C-j> :call CocAction('diagnosticPrevious')<cr>
endtry

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
" nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)


" :CocDiagnostics will bring up a new window that can be used to navigate and review diagnostic detections.
" ================= coc-go-settings ==================
"
" Add missing imports on save
" NOTE: This outputs some ugly text in :messages but can't find a way to
" disable...
" autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" Don't forget to add "coc.preferences.formatOnSaveFiletypes": ["go"] to
" :CocConfig
let g:gofmt_exe = 'goimports'
" ================= scratch-settings ==================
"
let g:scratch_autohide=1

" ================= vim-orgmode-settings ==================
"
" Set emacs path. Used for exporting org files
let g:org_export_emacs="/usr/local/bin/emacs"

" Defines if leading stars are displayed in the color of the heading or if a
" special NonText highlighting is used that hides them from user.
let g:org_heading_shade_leading_stars = 0

" ================= vim-which-key-settings ==================
"
nnoremap <silent> <leader> :WhichKey 'ö'<CR>
set timeoutlen=700
" Disable floating windows
" let g:which_key_use_floating_win = 0

" Define prefix dictionary
let g:which_key_map =  {}
autocmd VimEnter * call which_key#register('ö', "g:which_key_map")

" Second level dictionaries:
" 'name' is a special field. It will define the name of the group, e.g., leader-p is the "+fzf" group.
" Unnamed groups will show a default empty string.

" =======================================================
" Create menus based on existing mappings
" =======================================================
" You can pass a descriptive text to an existing mapping.
"
let g:which_key_map.p = { 'name' : 'Projects' }
let g:which_key_map.h = { 'name' : 'Git Gutter' }
let g:which_key_map.e = { 'name':  'Edit configuration'}
let g:which_key_map.n = { 'name':  'NERDTree'}
let g:which_key_map.g = { 'name':  'Coc'}
let g:which_key_map.e.v = 'edit vimrc'
let g:which_key_map.e.p = 'edit packages'
let g:which_key_map.c = 'toggle comment'

" ================= vim-polygot-settings ==================
" stolen from https://github.com/erkrnt/awesome-streamerrc/blob/master/ThePrimeagen/init.vim
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
" let g:go_auto_sameids = 1
