local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Colorschemes, choose one.
    --
    --  'ellisonleao/gruvbox.nvim',
    { 'rebelot/kanagawa.nvim', priority = 1000 },
    --  'savq/melange-nvim',
    --  'rmehri01/onenord.nvim',
    --  'AlexvZyl/nordic.nvim',
    --  { 'catppuccin/nvim', as = 'catppuccin' }

    'stevearc/dressing.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    'nvim-tree/nvim-web-devicons',
    'onsails/lspkind.nvim',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    'nvim-telescope/telescope-file-browser.nvim',
    'j-hui/fidget.nvim',
    'numToStr/Comment.nvim',
    'tpope/vim-fugitive',
    {
        'pwntester/octo.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'kyazdani42/nvim-web-devicons',
        }
    },
    'nvim-telescope/telescope-symbols.nvim',
    'lewis6991/gitsigns.nvim',

    'mfussenegger/nvim-dap',
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap" }
    },
    'theHamsta/nvim-dap-virtual-text',

    'folke/neodev.nvim',
    'creativenull/efmls-configs-nvim',
    'nvim-telescope/telescope-dap.nvim',
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    'nvim-treesitter/playground',
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
}, {
    ui = {
        border = "single",
    }
})
