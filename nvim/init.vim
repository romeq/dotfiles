set number
set showmatch
set ignorecase
set incsearch
set tabstop=4
set softtabstop=4
set nohlsearch
set expandtab
set shiftwidth=4
set autoindent
set wildmode=longest,list
syntax on
set ttyfast

call plug#begin("~/.vim/plugged")
    " Plugins
    Plug 'dracula/vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
