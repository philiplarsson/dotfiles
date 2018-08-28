" =================== minpac setup =================== "
command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

if !exists('*minpac#init')
  finish
endif

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" =============== plugins =============== "
call minpac#add('scrooloose/nerdtree')
call minpac#add('arcticicestudio/nord-vim')       " theme
call minpac#add('vim-airline/vim-airline')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('easymotion/vim-easymotion')
call minpac#add('w0rp/ale')                       " async lint engine
call minpac#add('tomtom/tcomment_vim')            " smart commenting
call minpac#add('ntpeters/vim-better-whitespace') " show and remove trailing whitespace
call minpac#add('tpope/vim-surround')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('sirver/UltiSnips')
call minpac#add('kylef/apiblueprint.vim')
call minpac#add('godlygeek/tabular')
call minpac#add('junegunn/fzf.vim')               " Needs to load fzf with rtp first.
call minpac#add('junegunn/limelight.vim')         " hyperfocus-writing in vim. on/off :Limelight/:Limelight!
call minpac#add('airblade/vim-gitgutter')         " shows a git diff in the 'gutter' (sign column)
call minpac#add('lervag/vimtex')                  " support for writing LaTeX document
call minpac#add('Jimeno0/vim-chito')              " chito theme
call minpac#add('mattn/emmet-vim')                " emmet for vim
call minpac#add('dhruvasagar/vim-table-mode')     " format tables in vim. Toggle with :TableModeToggle or <LEADER>tm
call minpac#add('majutsushi/tagbar')              " browse tags of current file (requires tags)
call minpac#add('rizzatti/dash.vim')              " Search terms using Dash.app
call minpac#add('fatih/vim-go', {'do': ':GoInstallBinaries'})                   " Go development plugin for Vim

"" ===== ncm2 =====
call minpac#add('ncm2/ncm2')                      " NCM2 is a slim, fast and hackable completion framework for neovim.
call minpac#add('roxma/nvim-yarp')                " Required by NCM2
call minpac#add('ncm2/ncm2-ultisnips')            " UltiSnips integration for ncm2
"" ===== php =====
call minpac#add('StanAngeloff/php.vim')           " An up-to-date Vim syntax for PHP.
" Phpactor is an intelligent code-completion and refactoring tool for PHP.
call minpac#add('phpactor/phpactor', {'do': '!composer install'})
call minpac#add('phpactor/ncm2-phpactor')         " phpactor integration for ncm2


