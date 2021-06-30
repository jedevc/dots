call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

if exists('g:vscode')
    execute 'source ' . stdpath('config') . '/vscode.vim'
else
    execute 'source ' . stdpath('config') . '/core.vim'
endif

call plug#end()
