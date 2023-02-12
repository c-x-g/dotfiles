local utils = require('utils')
require('preferences/keybindings')

local indent = 4
local cmd = vim.cmd

local normal_color_scheme = 'vscode'
-- local insert_color_scheme = 'gruvbox'

cmd 'set clipboard+=unnamedplus'

-- short for packadd termdebug this is related to rust debugging
cmd 'pa termdebug'

-- set cursor to blink and cursor shape to be thin line in insert + visual modes
cmd 'set guicursor=v-i:ver80-blinkon5'
cmd 'set autoindent'


-- set the colorscheme
cmd('colorscheme ' .. normal_color_scheme)
-- cmd 'colorscheme nord'

-- cmd 'colorscheme tokyonight'
-- vim.o.background = 'light'
-- vim.g.tokyonnight_style = 'day'
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
-- utils.opt('o', 'termguicolors', true)
utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')

-- set line numbers in NERDTree
-- vim.g['NERDTreeShowLineNumbers'] = 1

-- control the width of the file explorer tab
-- vim.g['NERDTreeWinSize'] = 50

-- these two lines were causing bugs with the NERDTree window
-- utils.opt('o', 'previewheight', 50)
-- utils.opt('o', 'winwidth', vim.o.columns)

vim.opt.shortmess = vim.opt.shortmess + 'A'
-- local SM = vim.opt.shortmess + 'A'
-- utils.opt('o', 'shortmess', vim.opt.shortmess..'A')
-- utils.opt('o', 'scrolloff', 4)
-- utils.opt('o', 'shiftround', true)
-- utils.opt('o', 'smartcase', true)
-- utils.opt('o', 'splitbelow', true)
-- utils.opt('o', 'splitright', true)
-- utils.opt('o', 'wildmode', 'list:longest')
-- utils.opt('w', 'relativenumber', true)
-- utils.opt('o', 'clipboard', 'unnamed,unnamedplus')

-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- autoformat file types on save
-- call formatting_seq_sync instead of formatting_sync if there are multiple language servers, format based on the first one

-- format various file types with efm-langserver configured
local autoformat = function()
    -- vim.lsp.buf.formatting_seq_sync(nil, 1000, { 'efm' })
    vim.lsp.buf.format(nil, 1000, { 'efm' })
end

vim.api.nvim_create_autocmd(
    'BufWritePre', {
    pattern = {
        '*.lua', '*.py', '*.js', '*.ts', '*.vue', '*.rs',
        '*.yaml', '*.yml', '*.java'
    },
    callback = function()
        autoformat()
    end
})


vim.api.nvim_create_autocmd(
    {'BufNewFile,BufRead'}, {
    pattern = {
        '*.lua', '*.py', '*.js', '*.ts', '*.vue', '*.rs',
        '*.yaml', '*.yml', '*.java'
    },
    command = "setlocal formatoptions-=cro"
})


-- -- disable comment continuation on subsequent lines
-- vim.cmd 'set formatoptions-=cro'


-- local change_color_scheme = function(style)
--   cmd('colorscheme ' .. style)
-- end
-- vim.api.nvim_create_autocmd('InsertEnter', {
--   pattern = {
--     '*.lua', '*.py', '*.js', '*.ts', '*.vue', '*.rs',
--     '*.yaml', '*.yml'
--   },
--   callback = function()
--     change_color_scheme(insert_color_scheme)
--   end
-- })
--
-- vim.api.nvim_create_autocmd('InsertLeave', {
--   pattern = {
--     '*.lua', '*.py', '*.js', '*.ts', '*.vue', '*.rs',
--     '*.yaml', '*.yml'
--   },
--   callback = function()
--     change_color_scheme(normal_color_scheme)
--   end
-- })
-- COME BACK TO THIS LATER IF A VERSION IS SUPPORTED
-- vim.api.nvim_create_autocmd("BufWritePre", { command = 'lua vim.lsp.buf.formatting_seq_sync(nil, 100, {"efm", "sumneko_lua"})', group = "*.lua" })
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = 'lua',
--     callback = function()
--         vim.schedule(function()
--             print("Hey, we got called")
--         end)
--     end,
-- })

-- vim.api.nvim_exec([[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.go FormatWrite
-- augroup END
-- ]], true)
-- ]], true)


