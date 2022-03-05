set relativenumber
set nu rnu
set incsearch
set nohlsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set wildmode=longest,list
set ttyfast
set mouse+=a
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif
filetype plugin indent on
syntax on

" templates and extension specific commands
autocmd BufNewFile  *.c  0r   ~/.config/nvim/templates/template.c
