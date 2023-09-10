-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
local packer = require("packer")
local use = packer.use

return require("packer").startup(
           function()
      -- Packer can manage itself
      use "wbthomason/packer.nvim"

      -- lualine
      use {"nvim-lualine/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons", opt = true}}

      -- Signify
      use "mhinz/vim-signify"

      -- nvim-lspconfig
      use "neovim/nvim-lspconfig"

      -- telescope
      use {"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/plenary.nvim"}}}

      -- telescope fzy
      use "nvim-telescope/telescope-fzy-native.nvim"

      -- vim-floaterm borders
      use "delphinus/denite-floaterm"
      use "voldikss/vim-floaterm"

      -- efm-langserver
      use "mattn/efm-langserver"

      -- syntax parser
      use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

      -- autoclose plugin
      use {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end}

      -- lua completion
      use "nvim-lua/completion-nvim"

      -- hrsh7th packages
      use "hrsh7th/cmp-nvim-lsp"
      use "hrsh7th/cmp-buffer"
      use "hrsh7th/cmp-path"
      use "hrsh7th/cmp-nvim-lua"
      use "hrsh7th/nvim-cmp"
      use "hrsh7th/vim-vsnip"
      use "hrsh7th/cmp-vsnip"
      -- use 'saadparwaiz1/cmp_luasnip'

      -- lua snippets

      use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*", run = "make install_jsregexp"})

      -- use {
      --   "hrsh7th/nvim-cmp",
      --   config = function()
      --     require"cmp".setup {
      --       snippet = {
      --         expand = function(args)
      --           require"luasnip".lsp_expand(args.body)
      --         end
      --       },

      --       sources = {
      --         {name = "luasnip"}
      --         -- more sources
      --       }
      --     }
      --   end
      -- }
      use {"saadparwaiz1/cmp_luasnip"}

      -- nerdtree
      --    use 'preservim/nerdtree'

      -- colorizer
      use "norcalli/nvim-colorizer.lua"

      -- formatter
      use "mhartington/formatter.nvim"

      -- Which Key
      use "liuchengxu/vim-which-key"

      -- 'better quickfix window'
      use {"kevinhwang91/nvim-bqf"}

      -- --------------------------------------------------------------------------------------------------------------
      --                                                  Git Tools
      -- --------------------------------------------------------------------------------------------------------------

      -- Fugitive; git integration with nvim
      use "tpope/vim-fugitive"

      -- sindrets; tool that easily navigates git file changes
      use "sindrets/diffview.nvim"

      -- Use dependency and run lua function after load
      use {
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = function() require("gitsigns").setup() end,
      }

      -- Lazy loading:
      -- Load on specific commands
      use {"tpope/vim-dispatch", opt = true, cmd = {"Dispatch", "Make", "Focus", "Start"}}

      -- --------------------------------------------------------------------------------------------------------------
      --                                                  LSPs
      -- --------------------------------------------------------------------------------------------------------------

      -- rust lsp
      use "simrat39/rust-tools.nvim"

      -- lua lsp
      use "LuaLS/lua-language-server"

      -- go lsp
      use "fatih/vim-go"

      -- java lsp
      use "mfussenegger/nvim-jdtls"

      -- vue lsp
      -- installed vue-language-server from AUR using provider volar-server-bin which works

      -- python lsp
      -- installed python-lsp-server from AUR which works as expected

      -- dart lsp
      use {
        "akinsho/flutter-tools.nvim",
        requires = {
          "nvim-lua/plenary.nvim", "stevearc/dressing.nvim", -- optional for vim.ui.select
        },
      }

      -- --------------------------------------------------------------------------------------------------------------
      --                                                  Color Schemes
      -- --------------------------------------------------------------------------------------------------------------

      -- tokyonight theme
      use "folke/tokyonight.nvim"

      -- gruvbox theme
      use "morhetz/gruvbox"

      -- nord-vim theme
      use "arcticicestudio/nord-vim"

      -- vs code
      use "Mofiqul/vscode.nvim"

      -- aurora theme
      use "ray-x/aurora"

      -- nightfox
      use "EdenEast/nightfox.nvim"

      -- onedark
      use "ful1e5/onedark.nvim"

      -- nvim-tree (file explorer)
      use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require"nvim-tree".setup {} end,
      }

      -- --------------------------------------------------------------------------------------------------------------
      --                                                  Testing
      -- --------------------------------------------------------------------------------------------------------------
      use "antoinemadec/FixCursorHold.nvim"

      use {
        "nvim-neotest/neotest",
        requires = {"nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "antoinemadec/FixCursorHold.nvim"},
      }

      use "nvim-neotest/neotest-go"
      use "nvim-neotest/neotest-python"
      use "rouge8/neotest-rust"

      -- jest isn't ready yet
      -- use 'haydenmeade/neotest-jest'

      -- --------------------------------------------------------------------------------------------------------------
      --                                                  Debugger
      -- --------------------------------------------------------------------------------------------------------------

      -- use 'sakhnik/nvim-gdb' -- not as useful since it is basically just gdb inside of neovim, no graphical UI to faciliate debugging
      use "mfussenegger/nvim-dap"
      use "leoluz/nvim-dap-go"
      use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
      use "theHamsta/nvim-dap-virtual-text"
      use "nvim-telescope/telescope-dap.nvim"
    end)

