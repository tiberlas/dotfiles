" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.9}})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep({layout_strategy='vertical',layout_config={width=0.9}})<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers({layout_strategy='vertical',layout_config={width=0.9}})<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags({layout_strategy='vertical',layout_config={width=0.9}})<cr>
nnoremap <leader>fl <cmd>lua require('telescope.builtin').lsp_references({layout_strategy='vertical',layout_config={width=0.9}})<cr>

"nnoremap <leader>ff <cmd> lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{prompt_title = "Telescope", layout_config = {width = 0.9, height = 0.4}})<cr>

