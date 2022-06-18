local cmd = vim.cmd

-- Denite Configurations
--  Use ripgrep for searching current directory for files
--  By default, ripgrep will respect rules in .gitignore
--    --files: Print each file that would be searched (but don't search)
--    --glob:  Include or exclues files for searching that match the given glob
--             (aka ignore .git files)
--
vim.api.nvim_call_function('denite#custom#var', { 'file/rec', 'command', { 'rg', '--files', '--glob', '!.git' } })

-- Use ripgrep in place of "grep"
-- call denite#custom#var('grep', 'command', ['rg'])
vim.api.nvim_call_function('denite#custom#var', { 'grep', 'command', { 'rg' } })

--  Custom options for ripgrep
--    --vimgrep:  Show results with every match on it's own line
--    --hidden:   Search hidden directories and files
--    --heading:  Show the file name above clusters of matches from each file
--    --S:        Search case insensitively if the pattern is all lowercase
vim.api.nvim_call_function('denite#custom#var', { 'grep', 'default_opts', { '--hidden', '--vimgrep', '--heading', '-S' } })

-- Recommended defaults for ripgrep via Denite docs
vim.api.nvim_call_function('denite#custom#var', { 'grep', 'recursive_opts', {} })
vim.api.nvim_call_function('denite#custom#var', { 'grep', 'pattern_opt', { '--regexp' } })
vim.api.nvim_call_function('denite#custom#var', { 'grep', 'separator', { '--' } })
vim.api.nvim_call_function('denite#custom#var', { 'grep', 'final_opts', {} })

-- Remove date from buffer list
vim.api.nvim_call_function('denite#custom#var', { 'buffer', 'date_format', '' })

-- ---------------------------------------------------------------------------------------------
--                                          Denite Options
-- ---------------------------------------------------------------------------------------------

local denite_options = {}
denite_options['default'] = {}
denite_options['default']['split'] = 'floating'
denite_options['default']['floating_border'] = 'double'
-- denite_options['default']['floating_preview'] = true
denite_options['default']['start_filter'] = true
-- denite_options['default']['auto_resize'] = 1
denite_options['default']['source_names'] = 'short'
denite_options['default']['prompt'] = '道'
denite_options['default']['highlight_matched_char'] = 'QuickFixLine'
denite_options['default']['highlight_matched_range'] = 'Visual'
denite_options['default']['highlight_filter_background'] = 'DiffAdd'
-- denite_options['default']['vertical_preview'] = 1
denite_options['default']['filter_zindex'] = 1
denite_options['default']['preview_height'] = 80
denite_options['default']['winrow'] = 80
denite_options['default']['winheight'] = 40
denite_options['default']['winwidth'] = vim.o.columns

for e_key, _ in pairs(denite_options) do
    for i_key, i_value in pairs(denite_options[e_key]) do vim.api.nvim_call_function('denite#custom#option', { e_key, i_key, i_value }) end
end

cmd('autocmd FileType denite nnoremap <silent><buffer><expr> <CR> denite#do_map(\'do_action\', \'tabopen\')')
cmd('autocmd FileType denite nnoremap <silent><buffer><expr> p denite#do_map(\'do_action\', \'preview\')')
cmd('autocmd FileType denite nnoremap <silent><buffer><expr> q denite#do_map(\'quit\')')
cmd('autocmd FileType denite nnoremap <silent><buffer><expr> i denite#do_map(\'open_filter_buffer\')')
cmd('autocmd FileType denite nnoremap <silent><buffer><expr> <Space> denite#do_map(\'toggle_select\').\'j\'')
-- cmd('autocmd FileType denite nnoremap <silent><buffer><expr> <C-v> denite#do_map(\'vsplit\').\'j\'')
-- cmd('autocmd FileType denite nnoremap <silent><buffer><expr> <C-x> denite#do_map(\'split\').\'j\'')

-- show line numbers in file search results
cmd('autocmd FileType denite setlocal number')

-- map the down arrow key to a function that quits the Denite filter buffer to go directly into the search results
function SetDeniteFilterQuit()
    cmd('imap <silent><buffer> <Down> <Plug>(denite_filter_update)')
    cmd('imap <silent><buffer> <CR> <Plug>(denite_filter_update)')
end

cmd('autocmd FileType denite-filter lua SetDeniteFilterQuit()')

-- cmd('autocmd User denite-preview setlocal number')
