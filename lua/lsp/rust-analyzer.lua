local rt = require("rust-tools")

local extension_path = "/home/carl/.vscode-oss/extensions/vadimcn.vscode-lldb-1.7.4/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

local opts = {
  --    tools = { -- rust-tools options
  --        autoSetHints = true,
  --        hover_with_actions = true,
  --        inlay_hints = {
  --            show_parameter_hints = false,
  --            parameter_hints_prefix = '',
  --            other_hints_prefix = ''
  --        }
  --    },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    -- on_attach = on_attach,
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, {buffer = bufnr})
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, {buffer = bufnr})
    end,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {command = "clippy"}
        -- diagnostics = { disabled = 'inactive-code' }
      }
    }
  },
  dap = {adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)}
}

rt.setup(opts)
