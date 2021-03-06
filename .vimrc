filetype off

source ~/.vim/plugin.vim
source ~/.vim/common.vim
source ~/.vim/plugin_settings.vim

set t_Co=256
colorscheme onedark
set tags=tags

autocmd! FileType perl setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType go setlocal shiftwidth=4 tabstop=4
autocmd! FileType hql setlocal set filetype=sql

filetype plugin indent on
syntax on
