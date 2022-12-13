local nnoremap = require('arnor.keymap').nnoremap
local builtin = require('telescope.builtin')
local ext = require('telescope').extensions

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

nnoremap("<leader>gf", builtin.git_files)
nnoremap("<leader>ff", builtin.find_files)
nnoremap("<leader>dg", builtin.diagnostics)
nnoremap("<leader>gs", builtin.git_status)
nnoremap("<leader>ds", builtin.lsp_document_symbols)
nnoremap("<leader>ws", builtin.lsp_workspace_symbols)
nnoremap("<leader>lg", builtin.live_grep)
nnoremap("<leader>fb", ext.file_browser.file_browser)
