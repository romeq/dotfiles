vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    --use 'morhetz/gruvbox'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'ms-jpq/coq_nvim', branch = 'coq' }
    use 'neovim/nvim-lspconfig'
    use 'sjl/badwolf'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
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
    use 'elkowar/yuck.vim'
    use 'rktjmp/lush.nvim'
end)

