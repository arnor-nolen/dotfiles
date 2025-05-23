require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>do', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    local telescope = require('telescope.builtin')

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', telescope.lsp_definitions, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', telescope.lsp_implementations, bufopts)
    vim.keymap.set({ 'n', 'i' }, '<C-h>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', 'gtd', telescope.lsp_type_definitions, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', telescope.lsp_references, bufopts)
    vim.keymap.set('n', 'gh', '<cmd>ClangdSwitchSourceHeader<cr>', bufopts)
    vim.keymap.set('n', '<space>fm', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.offsetEncoding = { "utf-16" }

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
local lspkind = require 'lspkind'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.confirm {
            select = true,
        },
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
    },
    formatting = {
        format = function(entry, vim_item)
            if vim.tbl_contains({ 'path' }, entry.source.name) then
                local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
                if icon then
                    vim_item.kind = icon
                    vim_item.kind_hl_group = hl_group
                    return vim_item
                end
            end
            return lspkind.cmp_format({ mode = 'symbol_text', with_text = false })(entry, vim_item)
        end
    }
}

-- Set up nvim-cmp.
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Override border globally
local border = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, options, ...)
    options = options or {}
    options.border = options.border or border
    return orig_util_open_floating_preview(contents, syntax, options, ...)
end

local excluded_filetypes = {
    'c',
    'h',
}

local clang_format_filetypes = {
    'cpp',
    'hpp',
}

-- Format on save
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    pattern = { '*' },
    callback = function()
        local ft = vim.bo.filetype
        local bufnr = vim.api.nvim_get_current_buf()
        local name = vim.api.nvim_buf_get_name(bufnr)

        -- Use clang-format for these filetypes.
        -- NOTE: InsertNewlineAtEOF might be ignored.
        for _, clang_format_filetype in ipairs(clang_format_filetypes) do
            if ft == clang_format_filetype then
                local content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
                local job_id = vim.fn.jobstart({ 'clang-format', '--assume-filename', name }, {
                    stdout_buffered = true,
                    on_stdout = function(_, data)
                        if data and table.concat(data) ~= '' then
                            if data[#data] == '' then
                                data[#data] = nil
                            end
                            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, data)
                            vim.diagnostic.show()
                        end
                    end,
                    on_stderr = function(_, data)
                        if data then
                            print(table.concat(data, '\n'))
                        end
                    end,
                })
                vim.fn.chansend(job_id, content)
                vim.fn.chanclose(job_id, 'stdin')
                vim.fn.jobwait({ job_id }, -1)
                return
            end
        end

        -- Ignore formatting for these filetypes.
        for _, excluded_filetype in ipairs(excluded_filetypes) do
            if ft == excluded_filetype then
                return
            end
        end

        -- Everything else uses LSP formatter.
        vim.lsp.buf.format()
    end,
})

require 'fidget'.setup {
    notification = {
        window = {
            winblend = 0
        }
    }
}

-- Set up lspconfig.
require 'lspconfig'.lua_ls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "use", "require" },
            },
        },
    },
}

require 'lspconfig'.clangd.setup {
    on_attach = on_attach,
    cmd = { "/home/arnor/scripts/clangd-qnx710.sh" },
    flags = lsp_flags,
    capabilities = capabilities,
}

require 'lspconfig'.rust_analyzer.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    -- Server-specific settings...
    settings = {
        ["rust-analyzer"] = {}
    }
}

require 'lspconfig'.pyright.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    }
}

require 'lspconfig'.cmake.setup {
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        -- Disable formatting if no .cmake-format file is present
        if vim.fn.filereadable("./.cmake-format") == 0 then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end
    end,
    flags = lsp_flags,
    capabilities = capabilities,
}

-- efm setup
local efm = require('lspconfig').efm

local cppcheck = require('efmls-configs.linters.cppcheck')

local cppcheck_args = {
    "cppcheck",
    " --enable=all",
    " --template=gcc",
    " --force",
    " --error-exitcode=1",
    " --check-level=exhaustive",
    " ${INPUT}"
}

if vim.fn.filereadable("./suppressions.txt") ~= 0 then
    table.insert(cppcheck_args, 4, " --suppressions-list=" .. vim.fn.getcwd() .. "/suppressions.txt")
end

cppcheck.lintCommand = table.concat(cppcheck_args)

if vim.fn.filereadable("./suppressions.txt") == 0 then
    cppcheck = {}
end


local languages = {
    cpp = {
        cppcheck
    },
    python = {
        require('efmls-configs.formatters.black')
    }
};

local efmls_config = {
    filetypes = vim.tbl_keys(languages),
    init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
        hover = true,
        documentSymbol = true,
        codeAction = true,
        completion = true,
    },
    settings = {
        languages = languages
    }
};

efm.setup(vim.tbl_extend('force', efmls_config, {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities
}))

local diagnostic_format = function(diagnostic)
    local text;
    -- If message starts with a bracket, it's a tool name and comes from efm.
    if diagnostic.message:find("[", 1, true) == 1 then
        local tool_loc = diagnostic.message:find("]", 1, true)
        diagnostic.message = diagnostic.message:sub(2, tool_loc - 1) .. ":" .. diagnostic.message:sub(tool_loc + 1)
    end
    if diagnostic.code == nil then
        text = diagnostic.message;
    else
        text = diagnostic.message .. " [" .. diagnostic.code .. "]";
    end
    return text;
end

vim.diagnostic.config({
    virtual_text = {
        source = "always", -- Or "if_many"
        prefix = "",
        format = diagnostic_format,
    },
    float = {
        source = "always", -- Or "if_many"
        format = diagnostic_format,
    },
})

require 'trouble'.setup({
    padding = false
})

-- Hide markdown errors
vim.cmd [[hi link markdownError NONE]]
