vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        file_browser = {
            hijack_netrw = true,
            hidden = true
        }
    },
    defaults = {
        file_ignore_patterns = { "node_modules" }
    },
    pickers = {
        find_files = {
            hidden = true,
            file_ignore_patterns = { "node_modules", ".git", ".cache" }
        },
        buffers = {
            mappings = {
                n = {
                    ['<C-f>'] = require('telescope.actions').delete_buffer
                },
                i = {
                    ['<C-f>'] = require('telescope.actions').delete_buffer
                }
            }
        }
    },
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('dap')

require 'nvim-web-devicons'.setup {
    -- your personnal icons can go here (to override)
    -- you can specify color or cterm_color instead of specifying both of them
    -- DevIcon will be appended to `name`
    override = {
        zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
        }
    },
    -- globally enable different highlight colors per icon (default to true)
    -- if set to false all icons will have the default icon's color
    color_icons = true,
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true,
}

require('dressing').setup({
})
