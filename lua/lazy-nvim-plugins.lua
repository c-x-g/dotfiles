local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
      {
        "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath,
      })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
      {"nvim-lualine/lualine.nvim", dependencies = {"kyazdani42/nvim-web-devicons", lazy = true}}, -- Signify --
      "mhinz/vim-signify", -- nvim-lspconfig
      "neovim/nvim-lspconfig", -- telescope
      {"nvim-telescope/telescope.nvim", dependencies = {{"nvim-lua/plenary.nvim"}}}, -- telescope fzy
      "nvim-telescope/telescope-fzy-native.nvim", -- efm-langserver
      "mattn/efm-langserver", -- syntax parser
      {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}, -- autoclose plugin
      {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end}, -- lua completion
      -- "nvim-lua/completion-nvim", -- hrsh7th packages
      "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "hrsh7th/cmp-nvim-lua",
      "hrsh7th/nvim-cmp", -- {
      --   "hrsh7th/nvim-cmp",
      --   dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer"},
      --   config = function()
      --     require"cmp".setup {
      --       snippet = {expand = function(args) require"luasnip".lsp_expand(args.body) end},
      --       sources = {
      --         {name = "luasnip"},
      --         -- more sources
      --       },
      --     }
      --   end,
      -- }, 
      "hrsh7th/vim-vsnip", {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
      }, "hrsh7th/cmp-vsnip", {"saadparwaiz1/cmp_luasnip"}, -- nerdtree
      --    'preservim/nerdtree',
      -- colorizer
      "norcalli/nvim-colorizer.lua", -- formatter
      "mhartington/formatter.nvim", -- Which Key
      "liuchengxu/vim-which-key", -- 'better quickfix window'
      {"kevinhwang91/nvim-bqf"},
      -- --------------------------------------------------------------------------------------------------------------
      --                                                  Git Tools
      -- --------------------------------------------------------------------------------------------------------------
      -- Fugitive; git integration with nvim
      "tpope/vim-fugitive", -- sindrets; tool that easily navigates git file changes
      "sindrets/diffview.nvim", -- dependency and run lua function after load,
      {
        "lewis6991/gitsigns.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function() require("gitsigns").setup() end,
      }, -- Lazy loading:
      -- Load on specific commands
      {"tpope/vim-dispatch", lazy = true, cmd = {"Dispatch", "Make", "Focus", "Start"}},
      -- --------------------------------------------------------------------------------------------------------------
      --                                                  LSPs
      -- --------------------------------------------------------------------------------------------------------------
      -- rust lsp
      "simrat39/rust-tools.nvim", -- lua lsp
      "LuaLS/lua-language-server", -- go lsp
      "fatih/vim-go", -- java lsp
      "mfussenegger/nvim-jdtls", -- vue lsp
      -- installed vue-language-server from AUR using provider volar-server-bin which works
      -- python lsp
      -- installed python-lsp-server from AUR which works as expected
      -- dart lsp
      {
        "akinsho/flutter-tools.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim", "stevearc/dressing.nvim", -- optional for vim.ui.select
        },
      },
      -- --------------------------------------------------------------------------------------------------------------
      --                                                  Color Schemes
      -- --------------------------------------------------------------------------------------------------------------
      -- tokyonight theme
      "folke/tokyonight.nvim", -- gruvbox theme
      "morhetz/gruvbox", -- nord-vim theme
      "arcticicestudio/nord-vim", -- vs code
      "Mofiqul/vscode.nvim", -- aurora theme
      "ray-x/aurora", -- nightfox
      "EdenEast/nightfox.nvim", -- onedark
      "ful1e5/onedark.nvim", -- nvim-tree (file explorer)
      {
        "kyazdani42/nvim-tree.lua",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function() require"nvim-tree".setup {} end,
      },
      -- --------------------------------------------------------------------------------------------------------------
      --                                                  Testing
      -- --------------------------------------------------------------------------------------------------------------
      "antoinemadec/FixCursorHold.nvim", {
        "nvim-neotest/neotest",
        dependencies = {"nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "antoinemadec/FixCursorHold.nvim"},
      }, "nvim-neotest/neotest-go", "nvim-neotest/neotest-python", "rouge8/neotest-rust", -- jest isn't ready yet
      -- 'haydenmeade/neotest-jest',
      -- --------------------------------------------------------------------------------------------------------------
      --                                                  Debugger
      -- --------------------------------------------------------------------------------------------------------------
      -- 'sakhnik/nvim-gdb' -- not as ul since it is basically just gdb inside of neovim, no graphical UI to faciliate debugging,
      "mfussenegger/nvim-dap", "leoluz/nvim-dap-go", {"rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"}},
      "theHamsta/nvim-dap-virtual-text", "nvim-telescope/telescope-dap.nvim",
    })

