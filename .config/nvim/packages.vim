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
call minpac#add('arcticicestudio/nord-vim')			" theme
call minpac#add('vim-airline/vim-airline')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('easymotion/vim-easymotion')
call minpac#add('w0rp/ale')					" async lint engine
call minpac#add('tomtom/tcomment_vim')				" smart commenting
call minpac#add('ntpeters/vim-better-whitespace')		" show and remove trailing whitespace
call minpac#add('tpope/vim-surround')
call minpac#add('fatih/vim-go')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('sirver/UltiSnips')

" =============== plugin settings =============== "
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_smartcase = 1

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1


