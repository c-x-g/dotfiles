require('formatter').setup({
    filetype = {
        javascript = {
            function()
                return {
                    exe = 'prettier',
                    args = {'--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
                    stdin = true
                }
            end
        }
        --     typescript = {
        --         function()
        --             return {
        --                 exe = 'prettier',
        --                 args = {'--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
        --                 stdin = true
        --             }
        --         end
        --     }
    }
    --     filetype = {
    --         go = {
    --             function()
    --                 return {
    --                     exe = 'go fmt',
    --                     args = {vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
    --                     stdin = true
    --                 }
    --             end
    --         }
    --     }
})
-- *.go reminder to add back just in case
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js FormatWrite
augroup END
]], true)

