local system_name
local lspconfigconfigurations = require('lspconfig-configurations')

if vim.fn.has('mac') == 1 then
    system_name = 'macOS'
elseif vim.fn.has('unix') == 1 then
    system_name = 'Linux'
elseif vim.fn.has('win32') == 1 then
    system_name = 'Windows'
else
    print('Unsupported system for sumneko')
end

-- Sumneko LSP
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = '/home/carl/.local/share/nvim/site/pack/packer/start/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require 'lspconfig'.sumneko_lua.setup {
    cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
    -- auto-completion for lua files
    --     on_attach = lspconfigconfigurations.on_attach,
    { on_attach = require 'completion'.on_attach },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
            format = {
                enable = true,
                indent_style = "space",
                indent_size = "2",
            }
        }
    }
}
