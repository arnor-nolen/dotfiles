vim.opt.nu = true -- Add line numbers
vim.opt.relativenumber = true -- Add relative line numbers

vim.opt.hlsearch = false -- Search highlighting
vim.opt.incsearch = true -- Incremental search highlighting
vim.cmd("set tabstop=4 softtabstop=4 shiftwidth=4 smartindent expandtab") -- Convert tabs to spaces

vim.opt.termguicolors = true -- Use terminal colors

-- Disable backup and swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.updatetime = 300 -- Faster update time, better responsiveness
vim.opt.signcolumn = "yes:2" -- Always show the signcolumn
vim.g.mapleader = " " -- Set leader key
vim.opt.cmdheight = 1 -- Small cmdheight

require('arnor') -- Source our lua files

-- Transparent background
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalFloat guibg=NONE ctermbg=NONE")
vim.cmd("hi FloatBorder guibg=NONE ctermbg=NONE")
