local i = require("neogen.types.template").item

local c_config = require("arnor.neogen-cfg.configuration.c")
local cpp_config = require("arnor.neogen-cfg.configuration.cpp")

cpp_config.template = {
    annotation_convention = "my_annotation",
    my_annotation = {
        { nil,         "/// \\file",           { no_results = true, type = { "file" } } },
        { nil,         "/// $1",               { no_results = true, type = { "func", "file", "class" } } },
        { nil,         "/// \\since Kanzi $1", { no_results = true, type = { "func", "file", "class" } } },
        { nil,         "",                     { no_results = true, type = { "file" } } },
        { i.ClassName, "/// \\class %s",       { type = { "class" } } },
        { i.Type,      "/// \\typedef %s",     { type = { "type" } } },
        { nil,         "/// $1",               { type = { "func", "class", "type" } } },
        { i.Tparam,    "/// \\tparam %s $1" },
        { i.Parameter, "/// \\param %s $1" },
        { i.Return,    "/// \\retval $1" },
        { i.Return,    "/// \\return $1" },
        { nil,         "/// \\since Kanzi $1" },
    }
}

require('neogen').setup {
    snippet_engine = "luasnip",
    placeholders_text = {
        ["description"] = "[TODO:annotate]"
    },
    languages = {
        c = c_config,
        cpp = cpp_config
    }
}
