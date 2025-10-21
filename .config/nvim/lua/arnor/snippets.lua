local ls = require('luasnip')
local types = require('luasnip.util.types')

ls.config.set_config {
    history = true,                            -- This tells luasnip to keep last snippet around
    updateevents = "TextChanged,TextChangedI", -- Update as you type
    enable_autosnippets = true,

    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<-", "GruvboxOrange" } },
            },
        },
        [types.insertNode] = {
            active = {
                virt_text = { { "<-", "GruvboxBlue" } },
            },
        },
    },
}

vim.keymap.set({ 'i', 's' }, '<C-j>', function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-k>', function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-l>', function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

local s = ls.s
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local t = ls.text_node
local rep = require('luasnip.extras').rep

local split_camel = function(str)
    return (str:gsub("%u", "_%1"):gsub(".", string.upper):sub(2))
end

local macro_convert = function(index)
    return f(function(arg)
        return { split_camel(arg[1][1]) }
    end, { index })
end


ls.add_snippets('cpp', {
    -- hpp specific snippets
    s('ro5', fmt([[
        #ifndef {}{}_HPP
        #define {}{}_HPP

        class {}
        {{
        public:
            explicit {}() noexcept = default;
            ~{}() noexcept = default;

            {}(const {}&) noexcept = delete;
            {}({}&&) noexcept = delete;

            {}& operator=(const {}&) noexcept = delete;
            {}& operator=({}&&) noexcept = delete;
        }};
        #endif
    ]],
        { c(2, { t '', t 'KZ_' }), macro_convert(1), rep(2), macro_convert(1), i(1, 'ClassName'), rep(1), rep(1),
            rep(1), rep(1), rep(1), rep(1), rep(1), rep(1), rep(1), rep(1)
        })),
})

-- ls.filetype_extend('cpp', { 'hpp' })
