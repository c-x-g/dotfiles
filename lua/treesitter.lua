require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'python', 'lua', 'vue', 'typescript', 'rust'
  },
  sync_install = false,
  highlight = {
    -- parsers you want to ignore installations of
    -- ignore_installed = {}
    enable = true,
    additional_vim_regex_highlighting = false
  }
}
