require('plugins')
require('lspconfig-configurations')
require('location_handler')
require('keybindings')

require('border')
-- require('rust-analyzer')
-- require('luasnips')
require('luasnippets')
require('completion-config')

require('settings')
-- require('autopairs')
-- lsp dependencies
require('lua-lsp')
require('go-lsp')
require('typescript-lsp')
require('python-lsp')
require('java-lsp')
require('vue-lsp')

-- efm-langserver; the autoformatter
require('efm-langserver')

-- require('treesitter')
require('autoformatter')

require('sindrets-diffview')
require('autopairs')
