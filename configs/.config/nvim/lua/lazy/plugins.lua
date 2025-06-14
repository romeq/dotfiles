return {
    -- packages
    {
        "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
        lazy = false,            -- REQUIRED: tell lazy.nvim to start this plugin at startup
        dependencies = {
            -- main one
            { "ms-jpq/coq_nvim",      branch = "coq",      build = ":COQdeps" },

            -- 9000+ Snippets
            { "ms-jpq/coq.artifacts", branch = "artifacts" },
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("configs.nvim-tree")
        end,
    },
    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('configs.crates')
        end,
    },
    {
        "startup-nvim/startup.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
        },
        config = function()
            require("configs.startup")
        end
    },
    { "neovim/nvim-lspconfig",           lazy = false },
    { "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate" },
    { "rktjmp/lush.nvim" },
}
