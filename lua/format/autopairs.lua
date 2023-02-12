local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
local cmp_autopairs = require(
    'nvim-autopairs.completion.cmp')
local cmp = require('cmp')
-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

-- npairs.config.map_cr = false
-- print(vim.inspect(npairs))

-- if quotes are inserted between the html tags, do not trigger duplication
function check_quotes(opts)
    print(opts.text)
    print(vim.api.nvim_get_current_buf())
    if string.find(opts.text, "^M") then print("FOUND") end
    if string.find(opts.text, "\"") then return "\"" end
    if string.find(opts.text, "'") then return "'" end
    return nil
end

npairs.setup { map_cr = false, enable_afterquote = false }
npairs.add_rules({
    Rule('^ *<[%a|%d]*>$', '</>'):use_regex(true):replace_endpair(
        function(opts)
            local is_quote = check_quotes(opts)
            if is_quote ~= nil then return "\"" end
            return '</'
                .. string.sub(
                    string.gsub(opts.text, '%s+', ''), 2)
        end)
    -- Rule('(', ')'):use_key('<CR>'):replace_endpair(function(
    --    opts)
    --  print(opts.text)
    --  local is_quote = check_quotes(opts)
    --  if is_quote ~= nil then return is_quote end
    --  return '<CR><Esc>O'
    -- end)
})
