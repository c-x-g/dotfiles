-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
local packer = require("packer")
local use = packer.use

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Fugitive; git integration with nvim
    use 'tpope/vim-fugitive'

    -- sindrets; tool that easily navigates git file changes
    use 'sindrets/diffview.nvim'

    -- Signify
    use 'mhinz/vim-signify'

    -- nvim-lspconfig
    use 'neovim/nvim-lspconfig'

    -- denite
    use 'Shougo/denite.nvim'

    -- defx
    use 'Shougo/defx.nvim'

    -- vim-floaterm borders
    use 'delphinus/denite-floaterm'
    use 'voldikss/vim-floaterm'

    -- rust lsp
    use 'simrat39/rust-tools.nvim'

    -- lua lsp
    use 'sumneko/lua-language-server'

    -- go lsp
    use 'fatih/vim-go'

    -- java lsp
    use 'mfussenegger/nvim-jdtls'

    -- vue lsp
    -- installed vue-language-server from AUR using provider volar-server-bin which works

    -- python lsp
    -- installed python-lsp-server from AUR which works as expected

    -- syntax parser
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- autoclose plugin
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- lua completion
    use 'nvim-lua/completion-nvim'

    -- lua snippets
    use 'L3MON4D3/LuaSnip'

    -- hrsh7th packages
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/vim-vsnip'

    -- nerdtree
    --    use 'preservim/nerdtree'

    -- colorizer
    use 'norcalli/nvim-colorizer.lua'

    -- formatter
    use 'mhartington/formatter.nvim'

    -- Which Key
    use 'liuchengxu/vim-which-key'

    -- --------------------------------------------------------------------------------------------------------------
    --                                                  Color Schemes
    -- --------------------------------------------------------------------------------------------------------------

    -- tokyonight theme
    use 'folke/tokyonight.nvim'

    -- gruvbox theme
    use 'morhetz/gruvbox'

    -- nord-vim theme
    use 'arcticicestudio/nord-vim'

    -- aurora theme
    use 'ray-x/aurora'

    -- nvim-tree (file explorer)
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require 'nvim-tree'.setup {}
        end
    }

    -- Use dependency and run lua function after load
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Lazy loading:
    -- Load on specific commands
    use { 'tpope/vim-dispatch', opt = true, cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }

    -- You can specify rocks in isolation
    use_rocks 'penlight'
    use_rocks { 'lua-resty-http', 'lpeg' }

end)
