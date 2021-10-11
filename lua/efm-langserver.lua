-- autoformatter
require'lspconfig'.efm.setup {
    init_options = {
        documentFormatting = true
    },
    filetypes = {'lua'},
    settings = {
        rootMarkers = {'.git/'},
        languages = {
            lua = {
                {
                    formatCommand = 'lua-format -i --no-keep-simple-function-one-line --double-quote-to-single-quote --no-break-after-operator --column-limit=150 --break-after-table-lb --indent-width=4 ',
                    formatStdin = true
                }
            },
            javascript = {
                {
                    lintCommand = 'eslint -f visualstudio --stdin --stdin-filename ${INPUT}',
                    lintIgnoreExitCode = true,
                    lintStdin = true,
                    lintFormats = {'%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m'}
                }
            }
        }
    }
}