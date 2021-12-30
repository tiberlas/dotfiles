" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 1
let g:signify_sign_show_text = 1

" Jump though hunks
nmap <leader>j <plug>(signify-next-hunk)
nmap <leader>k <plug>(signify-prev-hunk)
nmap <leader>J 9999<leader>gJ
nmap <leader>K 9999<leader>gk

" show gutter symbols and line number at the same time
set signcolumn=yes:2

" default updatetime 4000ms is not good for async update
set updatetime=100

" If you like colors instead
 "highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
 "highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
 "highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

" show current hunk git diff
nmap <leader>e :SignifyHunkDiff<CR>

" undo hunk git diff
nmap <leader>E :SignifyHunkUndo<CR>
