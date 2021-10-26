local utils = require('utils')
require('denite')

local indent = 4
local cmd = vim.cmd

cmd 'syntax enable'
cmd 'filetype plugin indent on'

-- set the colorscheme
cmd 'colorscheme gruvbox'
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
cmd([[
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
]])

-- vim.api.nvim_exec([[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.go FormatWrite
-- augroup END
-- ]], true)

