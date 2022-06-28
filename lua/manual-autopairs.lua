local keymap = vim.keymap

-- format curly braces upon pressing enter
keymap.set({'i'}, '<CR>', function()
  print(vim.api.nvim_get_current_line())
  vim.cmd('normal O')
  vim.cmd('normal <Down>')
end, {silent = true})
