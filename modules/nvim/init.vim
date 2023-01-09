call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/argtextobj.vim'
Plug 'michaeljsmith/vim-indent-object'

set ignorecase
set smartcase

set clipboard=unnamedplus

if exists('g:vscode')
    execute 'source ' . stdpath('config') . '/vscode.vim'
else
    execute 'source ' . stdpath('config') . '/core.vim'
endif

call plug#end()
