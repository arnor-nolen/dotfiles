-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = false,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "soft", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {
        DiagnosticSignWarn = {
            bg = "NONE",
            fg = "#fabd2f"
        },
        DiagnosticSignError = {
            bg = "NONE",
            fg = "#fb4934"
        },
        DiagnosticSignHint = {
            bg = "NONE",
            fg = "#83a598"
        }
    },
    dim_inactive = false,
    transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")
