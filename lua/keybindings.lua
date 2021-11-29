local utils = require('utils')

-- remap leader key from \ to spacebar
vim.g.mapleader = ' '

utils.map('n', '<C-l>', '<cmd>noh<CR>')
utils.map('n', '<leader>p', ':Denite file/rec -start-filter<CR>')
utils.map('n', '<leader>s', ':Denite grep -start-filter<CR>')
utils.map('n', '<leader>e', ':NvimTreeToggle<CR>')
utils.map('n', '<leader>sv', ':source $MYVIMRC<CR>')

-- tab management
utils.map('n', '<leader>t', ':tabs<CR>')
utils.map('n', '<leader>w', ':tabclose<CR>')
utils.map('n', '<leader>nt', ':tabnew<CR>')
utils.map('n', '<leader><Left>', ':tabl<CR>')
utils.map('n', '<leader><Right>', ':tabr<CR>')

-- jump between tabs
utils.map('n', '<leader>1', '1gt')
utils.map('n', '<leader>2', '2gt')
utils.map('n', '<leader>3', '3gt')
utils.map('n', '<leader>4', '4gt')
utils.map('n', '<leader>5', '5gt')
utils.map('n', '<leader>6', '6gt')
utils.map('n', '<leader>7', '7gt')
utils.map('n', '<leader>8', '8gt')
utils.map('n', '<leader>9', '9gt')
utils.map('n', '<leader>0', ':tablast<CR>')

-- diffview shortcuts
utils.map('n', '<leader>df', ':DiffviewOpen<CR>')
utils.map('n', '<leader>dfc', ':DiffviewClose<CR>')
utils.map('n', '<leader>dfh', ':DiffviewFileHistory ')
utils.map('n', '<leader>dft', ':DiffviewToggle<CR>')

-- git shortcuts
utils.map('n', '<leader>ga', ':G add .<CR>')
utils.map('n', '<leader>gcm', ':G commit -m \"')
utils.map('n', '<leader>gpo', ':G push origin ')

-- map scrolling up to Ctrl + s
utils.map('n', '<C-s>', '<C-u>')
utils.map('n', '<S-Up>', '<C-y>')
utils.map('n', '<S-Down>', '<C-e>')

-- Java boilerplate 
utils.map('n', '<leader>sout', 'ccSystem.out.println("");<Left><Left><Left>')

-- local opts = {
--     noremap = true,
--     silent = true
-- }

-- See `:help vim.lsp.*` for documentation on any of the below functions
utils.map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
utils.map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- utils.map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
-- utils.map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
-- utils.map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
-- utils.map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
-- utils.map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
-- -- utils.map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
-- utils.map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- utils.map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- utils.map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
-- -- utils.map('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
-- utils.map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
-- utils.map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
-- utils.map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
-- -- utils.map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')

