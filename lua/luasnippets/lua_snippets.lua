require("luasnippets.imports")

local same = function(index)
  return f(function(arg)
    return arg[1]
  end, {index})
end

-- local get_test_result = function(position)
--   return d(position, function()
--     local nodes = {}
--     table.insert(nodes, t " ")
--
--     local lines = vim.api
--                       .nvim_buf_get_lines(0, 0, -1, false)
--     for _, line in ipairs(lines) do
--       if line:match("anyhow::Result") then
--         table.insert(nodes, t " -> Result<()>")
--         break
--       end
--     end
--     return sn(nil, c(1, nodes))
--   end, {})
-- end

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
