-- ---------------------------------------------------------------------------------------------
--                                          Imports
-- ---------------------------------------------------------------------------------------------
ls = require("luasnip")
types = require "luasnip.util.types"
rep = require("luasnip.extras").rep
fmt = require("luasnip.extras.fmt").fmt
s, i, t, c, f, d = ls.s, ls.insert_node, ls.text_node, ls.choice_node, ls.function_node, ls.dynamic_node
sn = ls.snippet_node
snip = ls.snippet

-- ---------------------------------------------------------------------------------------------
--                                         Setup Options
-- ---------------------------------------------------------------------------------------------
ls.setup(
    {
      history = true,
      update_events = "TextChanged,TextChangedI",
      enable_autosnippets = true,
      ext_opts = {[types.choiceNode] = {active = {virt_text = {{"<-", "Error"}}}}},
    })

ls.filetype_extend("typescript", {"typescriptreact"})

-- ---------------------------------------------------------------------------------------------
--                                          Key Bindings
-- ---------------------------------------------------------------------------------------------

vim.keymap.set({"i", "s"}, "<c-k>", function() if ls.jumpable(-1) then ls.jump(-1) end end, {silent = true})

-- expand current snippet if it is a snippet
vim.keymap.set({"i", "s"}, "<c-j>", function() if ls.expand_or_jumpable() then ls.expand_or_jump() end end, {})

vim.keymap.set("i", "<c-l>", function() if ls.choice_active() then ls.change_choice(1) end end)
