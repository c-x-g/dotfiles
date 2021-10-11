local utils = {}

local scopes = {
    o = vim.o, -- get or set editor options
    b = vim.bo, -- get or set buffer-scoped local-options
    w = vim.wo -- get or set window-scoped local options
}

function utils.opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.map(mode, lhs, rhs, opts)
    local options = {
        noremap = true
    }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return utils
