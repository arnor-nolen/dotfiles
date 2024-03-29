vim.opt.nu = true                                                         -- Add line numbers
vim.opt.relativenumber = true                                             -- Add relative line numbers

vim.opt.hlsearch = false                                                  -- Search highlighting
vim.opt.incsearch = true                                                  -- Incremental search highlighting
vim.cmd("set tabstop=4 softtabstop=4 shiftwidth=4 smartindent expandtab") -- Convert tabs to spaces

vim.opt.termguicolors = true                                              -- Use terminal colors

-- Disable backup and swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.updatetime = 300     -- Faster update time, better responsiveness
vim.opt.signcolumn = "yes:2" -- Always show the signcolumn
vim.g.mapleader = " "        -- Set leader key
vim.opt.cmdheight = 1        -- Small cmdheight
vim.opt.scrolloff = 5        -- Always see next 5 lines

require('arnor')             -- Source our lua files

-- Transparent background
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalFloat guibg=NONE ctermbg=NONE")
vim.cmd("hi NvimFloat guibg=NONE ctermbg=NONE")
vim.cmd("hi FloatBorder guibg=NONE ctermbg=NONE")

-- Remove reverse color highlights in diffs
vim.cmd("hi DiffAdd gui=NONE guibg=NONE")
vim.cmd("hi DiffDelete gui=NONE guibg=NONE")
vim.cmd("hi DiffChange gui=NONE guibg=NONE")

-- Transparent background for Octo.nvim
vim.cmd("hi OctoEditable guibg=NONE")
vim.cmd("hi OctoGreenFloat guibg=NONE")
vim.cmd("hi Folded guibg=NONE")
vim.cmd("hi FoldColumn guibg=NONE")

vim.cmd("hi DapUINormal guibg=NONE")
