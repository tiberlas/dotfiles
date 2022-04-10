fu! ConvertToTabs()
  set noexpandtab
  retab!
endfunc
com! -nargs=0 ConvertToTabs :call ConvertToTabs()

fu! ConvertToSpaces()
  set expandtab
  retab!
endfunc
com! -nargs=0 ConvertToSpaces :call ConvertToSpaces()

fu! WindowFull()
  res
  vert res
endfunc
com! -nargs=0 WindowFull :call WindowFull()

