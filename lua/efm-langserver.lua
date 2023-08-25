local api = vim.api

-- autoformatter
require"lspconfig".efm.setup {
  on_attach = on_attach,
  init_options = {documentFormatting = true},
  filetypes = {
    "lua", "python", -- "javascript",
    "typescript", "vue", "yaml", "java", "svelte", "rust", "dart"
  },
  settings = {
    rootMarkers = {".git/"},
    languages = {
      lua = {
        {
          formatCommand = "lua-format -i --no-keep-simple-function-one-line --single-quote-to-double-quote --column-limit=240 --break-after-table-lb --indent-width=2 --break-after-functioncall-lp  --break-after-functiondef-lp --break-before-functiondef-rp --break-after-operator --align-args",
          formatStdin = true
        }
      },
      rust = {{formatCommand = "rustfmt --quiet", formatStdin = true}},
      dart = {{formatCommand = "dart format", formatStdin = true}},
      -- typescript = {{formatCommand = "prettier --single-quote"}, formatStdin = true},
      javascript = {{formatCommand = "prettier --quiet --single-quote --stdin-filepath " .. api.nvim_buf_get_name(0)}},
      typescript = {{formatCommand = "prettier --quiet --single-quote --stdin-filepath " .. api.nvim_buf_get_name(0)}},
      python = {{formatCommand = "isort --quiet -i 4 -", formatStdin = true}},
      -- vue = {{formatCommand = "prettier --single-quote --vue-indent-script-and-style"}, formatStdin = true},
      svelte = {{formatCommand = "prettier --plugin prettier-plugin-svelte --stdin-filepath " .. api.nvim_buf_get_name(0)}}

      --   javascript = {
      --     {
      --       lintCommand = 'eslint -f visualstudio --stdin --stdin-filename ${INPUT}',
      --       lintIgnoreExitCode = true,
      --       lintStdin = true,
      --       lintFormats = {'%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m'}
      --     }
      --   },
    }
  }
}
