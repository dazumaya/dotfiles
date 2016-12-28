filetype off

source ~/.vim/vundles.vim
source ~/.vim/common.vim
source ~/.vim/plugin_settings.vim

set t_Co=256
colorscheme molokai
set tags=tags

autocmd! FileType perl setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType go setlocal shiftwidth=4 tabstop=4

filetype plugin indent on
syntax on
