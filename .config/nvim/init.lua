vim.opt.nu = true -- Add line numbers
vim.opt.relativenumber = true -- Add relative line numbers

vim.opt.tabstop = 4 -- Width of tab character 
vim.opt.softtabstop = 4 -- Width of tab character (but keep the rest)
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.expandtab = true -- Convert tabs to white spaces
vim.opt.hlsearch = false -- Search highlighting
vim.opt.incsearch = true -- Incremental search highlighting

vim.opt.smartindent = true -- Smart indentation

vim.opt.termguicolors = true -- Use terminal colors

-- Disable backup and swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.updatetime = 300 -- Faster update time, better responsiveness
vim.opt.signcolumn = "yes" -- Always show the signcolumn
vim.g.mapleader = " " -- Set leader key

require('arnor') -- Source our lua files

-- Transparent background
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalFloat guibg=NONE ctermbg=NONE")
vim.cmd("hi FloatBorder guibg=NONE ctermbg=NONE")

