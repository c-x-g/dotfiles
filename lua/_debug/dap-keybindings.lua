vim.keymap.set("n", "<F1>",
    ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "F2>",
    ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "F3>",
    ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "F4>",
    ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<Leader>b",
    ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<Leader>B",
    ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<Leader>lp",
    ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<Leader>dr",
    ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<Leader>dl",
    ":lua require'dap'.run_last()<CR>")
