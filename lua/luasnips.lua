local ls = require "luasnip"
local types = require "luasnip.util.types"

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

vim.keymap.set({"i", "s"}, "<c-j>", function()
  if ls.jumpable(-1) then ls.jump(-1) end
end, {silent = true})

-- expand current snippet if it is a snippet
vim.keymap.set({"i", "s"}, "<c-k>", function()
  if ls.expand_or_jumpable() then ls.expand_or_jump() end
end, {})

vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then ls.change_choice(1) end
end)

local s, i, t, c, f, d = ls.s, ls.insert_node, ls.text_node,
                         ls.choice_node, ls.function_node,
                         ls.dynamic_node
local sn = ls.snippet_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local snip = ls.snippet

local same = function(index)
  return f(function(arg)
    return arg[1]
  end, {index})
end

local get_test_result = function(position)
  return d(position, function()
    local nodes = {}
    table.insert(nodes, t " ")

    local lines = vim.api
                      .nvim_buf_get_lines(0, 0, -1, false)
    for _, line in ipairs(lines) do
      if line:match("anyhow::Result") then
        table.insert(nodes, t " -> Result<()>")
        break
      end
    end
    return sn(nil, c(1, nodes))
  end, {})
end

ls.add_snippets("lua", {
  -- ls.parser.parse_snippet("lf", "local $1 = function($2)\n $0\nend"),
  s("req", fmt([[local {} = require "{}"]], {
    f(function(import_name)
      local parts = vim.split(import_name[1][1], ".", true)
      return parts[#parts] or ""
    end, {1}), i(1)
  })), s("sametest", fmt([[example: {}, function: {}]],
                         {i(1), same(1)}))
})

ls.add_snippets("java", {
  -- ls.parser.parse_snippet("obj", "local $1 = function($2)\n $0\nend"),
  ls.parser.parse_snippet("obj", "$1<> = $2<>();"),
  s("psvm", fmt([[
            public static void main(String[] args) {{
                System.out.println("{}Hello World")
            }}
        ]], {i(1)})), s("sout", fmt(
                            [[System.out.println("{}") {}]],
                            {i(1), same(1)}))
})

ls.add_snippets("rust", {
  s("modtest", fmt([[
    #[cfg(test)]
    mod test {{
    {}
        {}
    }}
      ]], {c(1, {t "    use super::*;", t ""}), i(0)})),
  s("func", fmt([[
   fn {}({}){} {{
       {}
   }}
      ]], {i(1), i(2), c(3, {t " -> type ", t ""}), i(0)})),
  s("test", fmt([[
            #[test]
            fn {}(){}{{
                {}
            }}
        ]], {i(1, "testname"), get_test_result(2), i(0)}))
})

ls.add_snippets("all", {
  s("curtime", f(function()
    return os.date "%D - %H:%M"
  end)), s("trig", {
    i(1), f(function(args, snip, user_arg_1)
      return args[1][1] .. user_arg_1
    end, {1}, {
      user_args = {"Will be appended to text from i(0)"}
    }), i(0)
  })
})
