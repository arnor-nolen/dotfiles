local custom_theme = require('lualine.themes.16color')

custom_theme.normal.b = { fg = '#dcd7ba', bg = '#363646' };
custom_theme.normal.c = custom_theme.normal.b;
custom_theme.normal.a = { fg = '#1f1f28', bg = '#6a9589', gui = 'bold' };
custom_theme.insert.a = { fg = custom_theme.normal.a.fg, bg = '#76946a', gui = custom_theme.normal.a.gui };
custom_theme.replace.a = { fg = custom_theme.normal.a.fg, bg = '#c34043', gui = custom_theme.normal.a.gui };
custom_theme.visual.a = { fg = custom_theme.normal.a.fg, bg = '#dca561', gui = custom_theme.normal.a.gui };
custom_theme.inactive = custom_theme.normal;

require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = custom_theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', flie_status = true, path = 1 } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})
