local api = vim.api
local util = vim.lsp.util
-- local diagnostic = vim.diagnostic
local handlers = vim.lsp.handlers
local log = vim.lsp.log

-- this file overwrites the logic to jump to declarations, definitions, typeDefinitions, and implementations
-- by jumping to them in a new tab rather than switching the current file
-- make sure to always have this executed before keybindings.lua!

local custom_location_handler = function(_, result, ctx, _)
    if result == nil or vim.tbl_isempty(result) then
        local _ = log.info() and log.info(ctx.method, 'No location found')
        return nil
    end

    -- create a new tab and save bufnr
    api.nvim_command('tabnew')
    local buf = api.nvim_get_current_buf()

    if vim.tbl_islist(result) then
        util.jump_to_location(result[1])

        -- if #result > 1 then
        --     diagnostic.setqflist(util.locations_to_items(result))
        --     api.nvim_command('copen')
        -- end
    else
        util.jump_to_location(result)
    end

    api.nvim_command(buf .. 'bd')
end

handlers['textDocument/declaration'] = custom_location_handler
handlers['textDocument/definition'] = custom_location_handler
handlers['textDocument/typeDefinition'] = custom_location_handler
handlers['textDocument/implementation'] = custom_location_handler
