nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

cabbrev g-l Git log --oneline --graph
cabbrev g-f Git show --pretty="" --name-only HEAD~0
cabbrev g-diff Gdiff :0

fu!TStatus()
  :Git log --oneline --graph
endfunc
com!TStatus call TStatus()

fu!TFileHistory()
  :Git show --pretty="" --name-only HEAD~0
endfunc
com!TFileHistory call TFileHistory()

fu!TChangesDiff()
  :Gdiff :0
endfunc
com!TChangesDiff call TChangesDiff()

fu!TPreviousCommitDiff()
  :Gdiff :HEAD^
endfunc
com!TPreviousCommitDiff call TPreviousCommitDiff()

