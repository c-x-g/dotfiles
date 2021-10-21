local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
npairs.setup {}

npairs.add_rules({
    --     Rule('(', ')'):use_key('<c-h>'):replace_endpair(function()
    --         return '<bs><del>'
    --     end, true), -- it is a short version of this
    -- Rule('(', ')'):use_key('<CR>'):replace_endpair(function()
    --     return '<CR><CR><Up><Esc>cc'
    -- end, true), -- it is a short version of this
    Rule('{', '}'):use_key('<CR>'):replace_endpair(function()
        return '<CR><CR><Up><Esc>cc'
    end, true) -- it is a short version of this
    --     Rule('(', ''):use_key('<c-h>'):with_pair(cond.after_text_check(')')) -- check text after cursor is )
    --     :replace_endpair(function()
    --         return '<bs><del>'
    --     end)
})

-- parentheses behavior is different between these file types...

if (vim.bo.filetype == 'rust') then
    npairs.add_rules({
        Rule('(', ')'):use_key('<CR>'):replace_endpair(function()
            return '<CR><CR><bs><Up><Esc>cc'
        end, true) -- it is a short version of this
    })
elseif (vim.bo.filetype == 'lua') then
    npairs.add_rules({
        Rule('(', ')'):use_key('<CR>'):replace_endpair(function()
            return '<CR><CR><Up><tab>'
        end, true) -- it is a short version of this
    })
else
    npairs.add_rules({
        Rule('(', ')'):use_key('<CR>'):replace_endpair(function()
            return '<CR><CR><Up><Esc>cc'
        end, true) -- it is a short version of this

    })

end
