command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

if !exists('*minpac#init')
  finish
endif

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" =============== plugins =============== "
call minpac#add('scrooloose/nerdtree')
call minpac#add('easymotion/vim-easymotion')
call minpac#add('tomtom/tcomment_vim')            " smart commenting
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('cocopon/iceberg.vim')
call minpac#add('dhruvasagar/vim-table-mode')     " automatic table creator & formatter. <leader>tm to toggle
call minpac#add('sirver/UltiSnips')
call minpac#add('junegunn/fzf.vim')
