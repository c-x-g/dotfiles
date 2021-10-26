-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged

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

    -- syntax parser
    use 'nvim-treesitter/nvim-treesitter'

    -- autoclose plugin
    use 'windwp/nvim-autopairs'

    -- lua completion
    use 'nvim-lua/completion-nvim'

    -- hrsh7th packages
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
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
            require'nvim-tree'.setup {}
        end
    }

    -- Use dependency and run lua function after load
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Lazy loading:
    -- Load on specific commands
    use {
        'tpope/vim-dispatch',
        opt = true,
        cmd = {'Dispatch', 'Make', 'Focus', 'Start'}
    }

    -- You can specify rocks in isolation
    use_rocks 'penlight'
    use_rocks {'lua-resty-http', 'lpeg'}

end)
