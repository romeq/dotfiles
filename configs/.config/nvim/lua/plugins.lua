local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Plugins for development/user interface
    use { 'ms-jpq/coq_nvim', branch = 'coq', run = ':COQdeps' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { -- file tree
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons',
        },
        tag = 'nightly'
    }
    use { -- automatically fetches data about rust crates
        'saecki/crates.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('pluginconfigs.crates_cfg')
        end
    }
    use {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
        config = function()
            require("pluginconfigs.startup_cfg")
        end
    }

    -- Plugins under the hood
    use 'neovim/nvim-lspconfig'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- testaustime
    use {
        'testaustime/testaustime.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("pluginconfigs.testaustime_cfg")
        end
    }

    -- generating color schemes
    use 'rktjmp/lush.nvim'
    use 'rktjmp/shipwright.nvim'

    if packer_bootstrap then
      require('packer').sync()
    end
end)

