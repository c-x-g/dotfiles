-- local cmp = require "cmp"
-- local luasnip = require "luasnip"
-- local has_words_before = function()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end
-- 
-- cmp.setup(
--     {
--       -- Enable LSP snippets
--       snippet = {
--         expand = function(args)
--           -- vim.fn["vsnip#anonymous"](args.body)
--           require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
--           -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
--           -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--         end,
--       },
--       mapping = {
--         ["<C-p>"] = cmp.mapping.select_prev_item(),
--         ["<C-n>"] = cmp.mapping.select_next_item(),
--         -- Add tab support
--         -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--         ["<S-Tab>"] = cmp.mapping(
--             function(fallback)
--               if cmp.visible() then
--                 cmp.select_prev_item()
--               elseif luasnip.jumpable(-1) then
--                 luasnip.jump(-1)
--               else
--                 fallback()
--               end
--             end, {"i", "s"}),
--         -- ['<Tab>'] = cmp.mapping.select_next_item(),
--         ["<Tab>"] = cmp.mapping(
--             function(fallback)
--               if cmp.visible() then
--                 cmp.select_next_item()
--               elseif luasnip.expand_or_jumpable() then
--                 luasnip.expand_or_jump()
--               elseif has_words_before() then
--                 cmp.complete()
--               else
--                 fallback()
--               end
--             end, {"i", "s"}),
--         ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<C-e>"] = cmp.mapping.close(),
--         ["<CR>"] = cmp.mapping.confirm(
--             {
--               -- behavior = cmp.ConfirmBehavior.Insert,
--               select = false,
--             }),
--       },
--       -- Installed sources
--       sources = {{name = "nvim_lsp"}, {name = "vsnip"}, {name = "luasnip"}, {name = "buffer", keyword_length = 5}},
--     })
local cmp = require "cmp"

cmp.setup(
    {
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert(
          {
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({select = true}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          }),
      sources = cmp.config.sources(
          {
            {name = "nvim_lsp"}, {name = "vsnip"}, -- For vsnip users.
            {name = "luasnip"}, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
          }, {{name = "buffer"}}),
    })

-- Set configuration for specific filetype.
cmp.setup.filetype(
    "gitcommit", {
      sources = cmp.config.sources(
          {
            {name = "git"}, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
          }, {{name = "buffer"}}),
    })

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({"/", "?"}, {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    ":", {mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})})

--  Set up lspconfig.
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require("lspconfig")["rust-tools"].setup {capabilities = capabilities}
-- require("lspconfig")["lua_ls"].setup {capabilities = capabilities}
-- 
