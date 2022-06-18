local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))


-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
npairs.setup {}

npairs.add_rules({
    Rule('{', '}'):use_key('<CR>'):replace_endpair(function()
        return '<CR><CR><Up><Esc>cc'
    end, true), -- it is a short version of this
    --     Rule('(', ''):use_key('<c-h>'):with_pair(cond.after_text_check(')')) -- check text after cursor is )
    --     :replace_endpair(function()
    --         return '<bs><del>'
    --     end)
    -- Rule('<.*>'):use_key('<CR>'):replace_endpair(function(opts)
    --     return ''
    -- end)
    --

    -- auto close html tags
    -- string.gsub trims the word so for example if you create a tag that is indented it will remove the spaces
    -- from the indent
    Rule("^<%a*>$", "</>"):use_regex(true, '<CR>'):replace_endpair(function(opts)
        return '<CR><CR></' .. string.sub(string.gsub(opts.text, "%s+", ""), 2) .. '<Up>'

    end),
    -- modify the behavior of parentheses in rust and lua files
    Rule('(', ')', 'rust'):use_key('<CR>'):replace_endpair(function()
        return '<cr><cr><bs><up><esc>cc'
    end, true),
    Rule('(', ')', 'lua'):use_key('<CR>'):replace_endpair(function()
        return '<CR><CR><Up><tab>'
    end, true),
    --     Rule('(', ')', 'lua'):use_key('<tab>'):replace_endpair(function()
    --         return '<CR><CR><Up><tab>'
    --     end, (not (cond.is_bracket_in_quote() or false))),
    Rule('(', ')'):replace_endpair(function()
        return '<CR><CR><Up><Esc>cc'
    end, cond.not_filetypes({ "lua", "rust" })) -- it is a short version of this
})
