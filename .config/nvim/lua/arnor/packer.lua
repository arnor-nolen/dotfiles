-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'morhetz/gruvbox'
    use {
        'neoclide/coc.nvim',
        branch = 'release'
    }
    use 'junegunn/fzf.vim'
end)