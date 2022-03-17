" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.9}})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep({layout_strategy='vertical',layout_config={width=0.9}})<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers({layout_strategy='vertical',layout_config={width=0.9}})<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags({layout_strategy='vertical',layout_config={width=0.9}})<cr>
nnoremap <leader>fl <cmd>lua require('telescope.builtin').lsp_references({layout_strategy='vertical',layout_config={width=0.9}})<cr>

"nnoremap <leader>ff <cmd> lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{prompt_title = "Telescope", layout_config = {width = 0.9, height = 0.4}})<cr>

" DEFAULT MAPPINGS
"
"<C-n>  <C-p> next | previous
"<Down> <Up>  next | previous
"j      k     next | previous (in normal mode, press ESC to enter normal mode, i for insert mode)
"<CR>         go to file selection

"<C-x>        go to file selection as a split
"<C-v>        go to file selection as a vertical split
"<C-t>        go to a file in a new tab

"<C-u>        scroll up in preview window
"<C-d>        scroll down in preview window

"<C-c>        close telescope
"<Esc>        close telescope (in normal mode)
