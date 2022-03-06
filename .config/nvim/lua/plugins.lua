vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'ms-jpq/coq_nvim', branch = 'coq' }
    use 'neovim/nvim-lspconfig'
    use { 'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps' }
end)

