local builtin = require "telescope.builtin"

require('telescope').setup {
  pickers = {
    grep_string = {
      mappings = {
        n = {
          -- ["<leader>s"] = function()
          --   builtin.grep_string()
          -- end
          ["cd"] = function(prompt_bufnr)
            local selection = require(
                                  "telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path,
                                           ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            -- Depending on what you want put `cd`, `lcd`, `tcd`
            vim.cmd(string.format("silent lcd %s", dir))
          end
        }
      }
    }
  },
  extensions = {
    -- fzy_native = {
    --     override_generic_sorter = false,
    --     override_file_sorter = true,
    -- }
  }
}
require('telescope').load_extension('fzy_native')
