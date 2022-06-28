-- main file to import all dependencies from luasnippets package
ls = require "luasnip"
types = require "luasnip.util.types"
rep = require("luasnip.extras").rep
fmt = require("luasnip.extras.fmt").fmt
s, i, t, c, f, d = ls.s, ls.insert_node, ls.text_node,
                   ls.choice_node, ls.function_node,
                   ls.dynamic_node
sn = ls.snippet_node
snip = ls.snippet

ls.config.set_config {
  history = true,
  updateevents = "TextChanged, TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {virt_text = {{"<-", "Error"}}}
    }
  }
}
