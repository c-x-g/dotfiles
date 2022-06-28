local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
local cmp_autopairs = require(
                          'nvim-autopairs.completion.cmp')
local cmp = require('cmp')
-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

-- npairs.config.map_cr = false
-- print(vim.inspect(npairs))
npairs.setup {map_cr = false, enable_afterquote = false}
npairs.add_rules({
  Rule('^ *<%a*>$', '</>'):use_regex(true):replace_endpair(
      function(opts)
        return '</'
                   .. string.sub(
                       string.gsub(opts.text, '%s+', ''), 2)
      end), -- modify the behavior of parentheses in rust and lua files
  Rule('(', '<CR><Esc>O'):use_key('<CR>')
})
