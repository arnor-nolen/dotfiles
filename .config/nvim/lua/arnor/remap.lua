local nnoremap = require('arnor.keymap').nnoremap

nnoremap("<leader>gf", "<cmd>Telescope git_files<CR>")
nnoremap("<leader>ff", "<cmd>Telescope find_files hidden=true<CR>")
nnoremap("<leader>dg", "<cmd>Telescope diagnostics<CR>")
nnoremap("<leader>gs", "<cmd>Telescope git_status<CR>")
nnoremap("<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>")
nnoremap("<leader>ws", "<cmd>Telescope lsp_workspace_symbols<CR>")
