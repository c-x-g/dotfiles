-- autoformatter
require 'lspconfig'.efm.setup {
    init_options = { documentFormatting = true },
    filetypes = { 'lua', 'python', 'javascript', 'typescript', 'rust', 'vue', 'yaml' },
    settings = {
        rootMarkers = { '.git/' }
        -- lua = {
        --   {
        --     formatCommand = 'lua-format -i --no-keep-simple-function-one-line --single-quote-to-double-quote --no-break-after-operator --column-limit=120 --break-after-table-lb --indent-width=2 ',
        --     formatStdin = true
        --   }
        -- }
        -- languages = {
        --   javascript = {
        --     {
        --       lintCommand = 'eslint -f visualstudio --stdin --stdin-filename ${INPUT}',
        --       lintIgnoreExitCode = true,
        --       lintStdin = true,
        --       lintFormats = {'%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m'}
        --     }
        --   },
        --   typescript = {
        --     {
        --       lintCommand = 'eslint -f visualstudio --stdin --stdin-filename ${INPUT}',
        --       lintIgnoreExitCode = true,
        --       lintStdin = true,
        --       lintFormats = {'%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m'}
        --     }
        --   },
        --   python = {formatCommand = 'black --quiet -', formatStdin = true}
        -- }
    }
}
