local actions = require "telescope.actions"
local action_state = require('telescope.actions.state')

local builtin = require "telescope.builtin"
local telescope_custom_actions = {}
function telescope_custom_actions._multiopen(prompt_bufnr, open_cmd)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local selected_entry = action_state.get_selected_entry()
    local num_selections = #picker:get_multi_selection()
    if not num_selections or num_selections <= 1 then
        actions.add_selection(prompt_bufnr)
    end
    actions.send_selected_to_qflist(prompt_bufnr)
    vim.cmd("cfdo " .. open_cmd)
end

function telescope_custom_actions.multi_selection_open_vsplit(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "vsplit")
end

function telescope_custom_actions.multi_selection_open_split(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "split")
end

function telescope_custom_actions.multi_selection_open_tab(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "tabe")
end

function telescope_custom_actions.multi_selection_open(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "edit")
end

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<CR>"] = actions.select_tab,
                ["<C-T>"] = telescope_custom_actions.multi_selection_open_tab
            },
        },
        file_ignore_patterns = {
            "node_modules",
        },
    },
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
                    end,
                }
            }
        }
    },
    extensions = {
        -- fzy_native = {
        --     override_generic_sorter = false,
        --     override_file_sorter = true,
        -- }
    },
}
require('telescope').load_extension('fzy_native')
