local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
npairs.setup {}

npairs.add_rules({
    --     Rule('(', ')'):use_key('<c-h>'):replace_endpair(function()
    --         return '<bs><del>'
    --     end, true), -- it is a short version of this
    Rule('(', ')'):use_key('<CR>'):replace_endpair(function()
        return '<CR><CR><Up><Esc>cc'
    end, true), -- it is a short version of this
    Rule('{', '}'):use_key('<CR>'):replace_endpair(function()
        return '<CR><CR><Up><Esc>cc'
    end, true) -- it is a short version of this
    --     Rule('(', ''):use_key('<c-h>'):with_pair(cond.after_text_check(')')) -- check text after cursor is )
    --     :replace_endpair(function()
    --         return '<bs><del>'
    --     end)
})
