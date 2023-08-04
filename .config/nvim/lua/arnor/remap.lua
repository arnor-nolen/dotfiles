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
nnoremap("<leader>lb", builtin.buffers)
nnoremap("<leader>fb", ext.file_browser.file_browser)
nnoremap("<leader>pl", "<cmd>Octo pr list<cr>")
nnoremap("<leader>th", builtin.highlights)
nnoremap("<leader>tr", "<cmd>Octo thread resolve<cr>")
nnoremap("<leader>tu", "<cmd>Octo thread unresolve<cr>")

nnoremap("<leader>cn", ":cnext<CR>")
nnoremap("<leader>cp", ":cprev<CR>")

nnoremap("<leader>dc", ":lua require'dap'.continue()<CR>")
nnoremap("<leader>df", ":lua require'dap'.step_over()<CR>")
nnoremap("<leader>di", ":lua require'dap'.step_into()<CR>")
nnoremap("<leader>db", ":lua require'dap'.step_out()<CR>")
nnoremap("<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
nnoremap("<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
nnoremap("<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
nnoremap("<leader>dr", ":lua require'dap'.repl.open()<CR>")
nnoremap("<leader>x", ":lua require'dap'.terminate()<CR>")

nnoremap("<leader>n", ":Neogen<CR>")
