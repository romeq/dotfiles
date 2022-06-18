vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'ms-jpq/coq_nvim', branch = 'coq' }
    use 'neovim/nvim-lspconfig'
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
    use 'liuchengxu/vim-clap'
    use {
        'saecki/crates.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates_config')
        end
    }
    use 'elkowar/yuck.vim'
    use 'rktjmp/lush.nvim'
end)

