" use relative number system
set relativenumber
set nu rnu

" search
set incsearch
set nohlsearch

" tab setup
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

" autoindent
set autoindent

" other
set wildmode=longest,list
set ttyfast
set mouse+=a

" clipboard as default register
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

filetype plugin on

syntax on

" call plugins. vim-plug, node required
call plug#begin("~/.vim/plugged")
    " Plugins
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdcommenter'
    Plug 'deoplete-plugins/deoplete-clang'
    Plug 'mhinz/vim-startify'
call plug#end()

" colorscheme setup
colorscheme gruvbox
