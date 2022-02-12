lua require("plugins")

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

colorscheme gruvbox

