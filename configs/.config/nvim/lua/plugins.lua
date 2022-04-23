vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'ms-jpq/coq_nvim', branch = 'coq' }
    use 'neovim/nvim-lspconfig'
    use { 'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps' }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'lajp/testaustime-nvim', run = 'cabal install --overwrite-policy=always' }
    use 'glepnir/dashboard-nvim'
    use 'liuchengxu/vim-clap'
    use {
        'saecki/crates.nvim',
        tag = 'v0.1.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = require('crates_config')
    }
end)

