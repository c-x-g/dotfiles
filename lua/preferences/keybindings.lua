-- local utils = require('utils')
-- remap leader key from \ to spacebar
vim.g.mapleader = " "

-- clear a line up to the first character in the line
vim.keymap.set({"i"}, "<C-d>", "<leader><esc>d^i", {silent = true})

-- jump to first character in line
vim.keymap.set({"i"}, "<C-s>", "<esc>^i", {silent = true})

--  find word
vim.keymap.set({"i"}, "<C-f>", "<esc>:/", {silent = true})

vim.keymap.set({"i"}, "<C-Up>", "<esc>ggi", {silent = true})
vim.keymap.set({"i"}, "<C-Down>", "<esc>Gi", {silent = true})

-- use the home/end keys to navigate to the beginning and end of line
vim.keymap.set("n", "<C-l>", "<cmd>noh<CR>")
-- vim.keymap.set('n', '<leader>p',
--    ':Denite file/rec -start-filter<CR>')
-- vim.keymap.set('n', '<leader>s', ':Denite grep -start-filter<CR>')
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>")

vim.keymap.set("n", "<leader>p", ":lua require('telescope.builtin').find_files()<CR>")
vim.keymap.set("n", "<leader>s", ":lua require('telescope.builtin').live_grep()<CR>")

-- tab management
vim.keymap.set("n", "<leader>t", ":tabs<CR>")
vim.keymap.set("n", "<leader>w", ":tabclose<CR>")
vim.keymap.set("n", "<leader>nt", ":tabnew<CR>")
vim.keymap.set("n", "<leader><Left>", ":tabl<CR>")
vim.keymap.set("n", "<leader><Right>", ":tabr<CR>")

-- don't copy to clipboard
vim.keymap.set("n", "nc", "\"_")

-- view messages (logs)
vim.keymap.set("n", "<leader>m", ":messages<CR>")

-- replace with paste
vim.keymap.set("n", "vp", "viwp")

-- source the current buffer's filename
vim.keymap.set("n", "<leader>so", ":so %<CR>")

-- jump between tabs
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")
vim.keymap.set("n", "<leader>0", ":tablast<CR>")

-- diffview shortcuts
vim.keymap.set("n", "<leader>df", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>dfc", ":DiffviewClose<CR>")
vim.keymap.set("n", "<leader>dfh", ":DiffviewFileHistory ")
vim.keymap.set("n", "<leader>dft", ":DiffviewToggle<CR>")

-- git shortcuts
vim.keymap.set("n", "<leader>ga", ":G add .<CR>")
vim.keymap.set("n", "<leader>gcm", ":G commit -m \"")
vim.keymap.set("n", "<leader>gpo", ":G push origin ")

-- map scrolling up to Ctrl + s
vim.keymap.set("n", "<C-s>", "<C-u>")
vim.keymap.set("n", "<S-Up>", "<C-y>")
vim.keymap.set("n", "<S-Down>", "<C-e>")

-- vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>")
-- vim.keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
-- vim.keymap.set("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>")
-- vim.keymap.set("n", "<space>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>")
-- vim.keymap.set("n", "<space>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>")
-- vim.keymap.set("n", "<space>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
-- vim.keymap.set("n", "<space>D", ":lua vim.lsp.buf.type_definition()<CR>")
-- vim.keymap.set("n", "<space>rn", ":lua vim.lsp.buf.rename()<CR>")
-- vim.keymap.set("n", "<space>ca", ":lua vim.lsp.buf.code_action()<CR>")
-- vim.keymap.set("n", "gr", ":lua vim.lsp.buf.references()<CR>")
-- vim.keymap.set("n", "<space>e", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
-- vim.keymap.set("n", "[d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
-- vim.keymap.set("n", "]d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
-- vim.keymap.set("n", "<space>q", ":lua vim.lsp.diagnostic.set_loclist()<CR>")
-- vim.keymap.set("n", "<space>f", ":lua vim.lsp.buf.formatting()<CR>")

-- Java boilerplate
-- vim.keymap.set('n', '<leader>sout', 'ccSystem.out.println("");<Left><Left><Left>')

-- local opts = {
--     noremap = true,
--     silent = true
-- }

