vim.keymap.set("n", "<Leader>duo",
    ":lua require'dapui'.open()<CR>")
vim.keymap.set("n", "<Leader>duc",
    ":lua require'dap'.close()<CR>")
vim.keymap.set("n", "<Leader>dut",
    ":lua require'dap'toggle()<CR>")
