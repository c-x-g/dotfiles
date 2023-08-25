require("plugins")
require("lazy-nvim-plugins")
require("lspconfig-configurations")
require("location_handler")
-- require('keybindings')

require("border")
require("_lualine")
require("luasnips")
require("completion-config")

require("preferences")
-- require('denite')

-- efm-langserver; the autoformatter
require("efm-langserver")

require("treesitter")
-- require('autoformatter')

require("sindrets-diffview")

-- includes autopairs, possibly more later
require("format")

require("_telescope")

-- included in lsp folder
require("lsp")

-- for facilitating unit tests
require("testing")

-- debugging
require("_debug")

