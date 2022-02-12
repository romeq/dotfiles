return require('packer').startup(function()
    use 'morhetz/gruvbox'
    use {'neoclide/coc.nvim', branch = 'release'}

    use {'ms-jpq/coq_nvim', branch = 'coq' }
    use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
end)

