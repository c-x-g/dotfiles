local api = vim.api

-- formatter for javascript/typescript projects
local prettierd = {formatCommand = "prettierd \"${INPUT}\"", formatStdin = true}

-- autoformatter
require"lspconfig".efm.setup {
  -- on_attach = on_attach,
  init_options = {documentFormatting = true},
  filetypes = {
    "css","lua", "python", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "yaml", "java", "svelte",
    "rust", "dart",
  },
  settings = {
    rootMarkers = {".git/"},
    languages = {
      lua = {
        {
          formatCommand = "lua-format -i  --single-quote-to-double-quote --column-limit=120 --break-after-table-lb --indent-width=2 --break-after-functioncall-lp  --break-after-functiondef-lp --break-before-functiondef-rp --break-after-operator --no-align-args --extra-sep-at-table-end ",
          formatStdin = true,
        },
      },
      rust = {{formatCommand = "rustfmt --quiet", formatStdin = true}},
      dart = {{formatCommand = "dart format", formatStdin = true}},
      css = {prettierd},
      javascript = {prettierd},
      javascriptreact = {prettierd},
      typescript = {prettierd},
      typescriptreact = {prettierd},
      python = {{formatCommand = "isort --quiet -i 4 -", formatStdin = true}},
      java = {{formatCommand = "google-java-format -", formatStdin = true}},
      -- vue = {{formatCommand = "prettier --single-quote --vue-indent-script-and-style"}, formatStdin = true},
      svelte = {prettierd},
      -- {formatCommand = "prettier --plugin=prettier-plugin-svelte --stdin-filepath " .. api.nvim_buf_get_name(0)},
      yaml = {{formatCommand = "yamlfmt -in", formatStdin = true}},

      --   javascript = {
      --     {
      --       lintCommand = 'eslint -f visualstudio --stdin --stdin-filename ${INPUT}',
      --       lintIgnoreExitCode = true,
      --       lintStdin = true,
      --       lintFormats = {'%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m'}
      --     }
      --   },
    },
  },
}
